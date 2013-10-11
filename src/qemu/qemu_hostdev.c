/*
 * qemu_hostdev.c: QEMU hostdev management
 *
 * Copyright (C) 2006-2007, 2009-2011 Red Hat, Inc.
 * Copyright (C) 2006 Daniel P. Berrange
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
 *
 * Author: Daniel P. Berrange <berrange@redhat.com>
 */

#include <config.h>

#include "qemu_hostdev.h"
#include "logging.h"
#include "virterror_internal.h"
#include "memory.h"
#include "pci.h"
#include "hostusb.h"

static pciDeviceList *
qemuGetPciHostDeviceList(virDomainHostdevDefPtr *hostdevs, int nhostdevs)
{
    pciDeviceList *list;
    int i;

    if (!(list = pciDeviceListNew()))
        return NULL;

    for (i = 0 ; i < nhostdevs ; i++) {
        virDomainHostdevDefPtr hostdev = hostdevs[i];
        pciDevice *dev;

        if (hostdev->mode != VIR_DOMAIN_HOSTDEV_MODE_SUBSYS)
            continue;
        if (hostdev->source.subsys.type != VIR_DOMAIN_HOSTDEV_SUBSYS_TYPE_PCI)
            continue;

        dev = pciGetDevice(hostdev->source.subsys.u.pci.domain,
                           hostdev->source.subsys.u.pci.bus,
                           hostdev->source.subsys.u.pci.slot,
                           hostdev->source.subsys.u.pci.function);
        if (!dev) {
            pciDeviceListFree(list);
            return NULL;
        }

        if (pciDeviceListAdd(list, dev) < 0) {
            pciFreeDevice(dev);
            pciDeviceListFree(list);
            return NULL;
        }

        pciDeviceSetManaged(dev, hostdev->managed);
    }

    return list;
}

static pciDeviceList *
qemuGetActivePciHostDeviceList(struct qemud_driver *driver,
                               virDomainHostdevDefPtr *hostdevs,
                               int nhostdevs)
{
    pciDeviceList *list;
    int i;

    if (!(list = pciDeviceListNew()))
        return NULL;

    for (i = 0 ; i < nhostdevs ; i++) {
        virDomainHostdevDefPtr hostdev = hostdevs[i];
        pciDevice *dev;
        pciDevice *activeDev;

        if (hostdev->mode != VIR_DOMAIN_HOSTDEV_MODE_SUBSYS)
            continue;
        if (hostdev->source.subsys.type != VIR_DOMAIN_HOSTDEV_SUBSYS_TYPE_PCI)
            continue;

        dev = pciGetDevice(hostdev->source.subsys.u.pci.domain,
                           hostdev->source.subsys.u.pci.bus,
                           hostdev->source.subsys.u.pci.slot,
                           hostdev->source.subsys.u.pci.function);
        if (!dev) {
            pciDeviceListFree(list);
            return NULL;
        }

        if ((activeDev = pciDeviceListFind(driver->activePciHostdevs, dev))) {
            if (pciDeviceListAdd(list, activeDev) < 0) {
                pciFreeDevice(dev);
                pciDeviceListFree(list);
                return NULL;
            }
        }

        pciFreeDevice(dev);
    }

    return list;
}

int qemuUpdateActivePciHostdevs(struct qemud_driver *driver,
                                virDomainDefPtr def)
{
    virDomainHostdevDefPtr hostdev = NULL;
    int i;

    if (!def->nhostdevs)
        return 0;

    for (i = 0; i < def->nhostdevs; i++) {
        pciDevice *dev = NULL;
        hostdev = def->hostdevs[i];

        if (hostdev->mode != VIR_DOMAIN_HOSTDEV_MODE_SUBSYS)
            continue;
        if (hostdev->source.subsys.type != VIR_DOMAIN_HOSTDEV_SUBSYS_TYPE_PCI)
            continue;

        dev = pciGetDevice(hostdev->source.subsys.u.pci.domain,
                           hostdev->source.subsys.u.pci.bus,
                           hostdev->source.subsys.u.pci.slot,
                           hostdev->source.subsys.u.pci.function);

        if (!dev)
            return -1;

        pciDeviceSetManaged(dev, hostdev->managed);
        pciDeviceSetUsedBy(dev, def->name);

        /* Setup the original states for the PCI device */
        pciDeviceSetUnbindFromStub(dev, hostdev->origstates.states.pci.unbind_from_stub);
        pciDeviceSetRemoveSlot(dev, hostdev->origstates.states.pci.remove_slot);
        pciDeviceSetReprobe(dev, hostdev->origstates.states.pci.reprobe);

        if (pciDeviceListAdd(driver->activePciHostdevs, dev) < 0) {
            pciFreeDevice(dev);
            return -1;
        }
    }

    return 0;
}

int qemuPrepareHostdevPCIDevices(struct qemud_driver *driver,
                                 const char *name,
                                 virDomainHostdevDefPtr *hostdevs,
                                 int nhostdevs)
{
    pciDeviceList *pcidevs;
    int i;
    int ret = -1;

    if (!(pcidevs = qemuGetPciHostDeviceList(hostdevs, nhostdevs)))
        return -1;

    /* We have to use 7 loops here. *All* devices must
     * be detached before we reset any of them, because
     * in some cases you have to reset the whole PCI,
     * which impacts all devices on it. Also, all devices
     * must be reset before being marked as active.
     */

    /* Loop 1: validate that non-managed device isn't in use, eg
     * by checking that device is either un-bound, or bound
     * to pci-stub.ko
     */

    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        pciDevice *other;

        if (!pciDeviceIsAssignable(dev, !driver->relaxedACS)) {
            qemuReportError(VIR_ERR_OPERATION_INVALID,
                            _("PCI device %s is not assignable"),
                            pciDeviceGetName(dev));
            goto cleanup;
        }
        /* The device is in use by other active domain if
         * the dev is in list driver->activePciHostdevs.
         */
        if ((other = pciDeviceListFind(driver->activePciHostdevs, dev))) {
            const char *other_name = pciDeviceGetUsedBy(other);

            if (other_name)
                qemuReportError(VIR_ERR_OPERATION_INVALID,
                                _("PCI device %s is in use by domain %s"),
                                pciDeviceGetName(dev), other_name);
            else
                qemuReportError(VIR_ERR_OPERATION_INVALID,
                                _("PCI device %s is already in use"),
                                pciDeviceGetName(dev));
            goto cleanup;
        }
    }

    /* Loop 2: detach managed devices */
    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        if (pciDeviceGetManaged(dev) &&
            pciDettachDevice(dev, driver->activePciHostdevs) < 0)
            goto reattachdevs;
    }

    /* Loop 3: Now that all the PCI hostdevs have been detached, we
     * can safely reset them */
    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        if (pciResetDevice(dev, driver->activePciHostdevs, pcidevs) < 0)
            goto reattachdevs;
    }

    /* Loop 4: Now mark all the devices as active */
    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        if (pciDeviceListAdd(driver->activePciHostdevs, dev) < 0) {
            pciFreeDevice(dev);
            goto inactivedevs;
        }
    }

    /* Loop 5: Now set the used_by_domain of the device in
     * driver->activePciHostdevs as domain name.
     */
    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev, *activeDev;

        dev = pciDeviceListGet(pcidevs, i);
        activeDev = pciDeviceListFind(driver->activePciHostdevs, dev);

        pciDeviceSetUsedBy(activeDev, name);
    }

    /* Loop 6: Now set the original states for hostdev def */
    for (i = 0; i < nhostdevs; i++) {
        pciDevice *dev;
        pciDevice *pcidev;
        virDomainHostdevDefPtr hostdev = hostdevs[i];

        if (hostdev->mode != VIR_DOMAIN_HOSTDEV_MODE_SUBSYS)
            continue;
        if (hostdev->source.subsys.type != VIR_DOMAIN_HOSTDEV_SUBSYS_TYPE_PCI)
            continue;

        dev = pciGetDevice(hostdev->source.subsys.u.pci.domain,
                           hostdev->source.subsys.u.pci.bus,
                           hostdev->source.subsys.u.pci.slot,
                           hostdev->source.subsys.u.pci.function);

        /* original states "unbind_from_stub", "remove_slot",
         * "reprobe" were already set by pciDettachDevice in
         * loop 2.
         */
        if ((pcidev = pciDeviceListFind(pcidevs, dev))) {
            hostdev->origstates.states.pci.unbind_from_stub =
                pciDeviceGetUnbindFromStub(pcidev);
            hostdev->origstates.states.pci.remove_slot =
                pciDeviceGetRemoveSlot(pcidev);
            hostdev->origstates.states.pci.reprobe =
                pciDeviceGetReprobe(pcidev);
        }

        pciFreeDevice(dev);
    }

    /* Loop 7: Now steal all the devices from pcidevs */
    while (pciDeviceListCount(pcidevs) > 0) {
        pciDevice *dev = pciDeviceListGet(pcidevs, 0);
        pciDeviceListSteal(pcidevs, dev);
    }

    ret = 0;
    goto cleanup;

inactivedevs:
    /* Only steal all the devices from driver->activePciHostdevs. We will
     * free them in pciDeviceListFree().
     */
    while (pciDeviceListCount(pcidevs) > 0) {
        pciDevice *dev = pciDeviceListGet(pcidevs, 0);
        pciDeviceListSteal(driver->activePciHostdevs, dev);
    }

reattachdevs:
    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        pciReAttachDevice(dev, driver->activePciHostdevs);
    }

cleanup:
    pciDeviceListFree(pcidevs);
    return ret;
}

static int
qemuPrepareHostPCIDevices(struct qemud_driver *driver,
                          virDomainDefPtr def)
{
    return qemuPrepareHostdevPCIDevices(driver, def->name, def->hostdevs, def->nhostdevs);
}


int
qemuPrepareHostdevUSBDevices(struct qemud_driver *driver,
                             const char *name,
                             usbDeviceList *list)
{
    int i;
    unsigned int count;
    usbDevice *tmp;

    count = usbDeviceListCount(list);

    for (i = 0; i < count; i++) {
        usbDevice *usb = usbDeviceListGet(list, i);
        if ((tmp = usbDeviceListFind(driver->activeUsbHostdevs, usb))) {
            const char *other_name = usbDeviceGetUsedBy(tmp);

            if (other_name)
                qemuReportError(VIR_ERR_OPERATION_INVALID,
                                _("USB device %s is in use by domain %s"),
                                usbDeviceGetName(tmp), other_name);
            else
                qemuReportError(VIR_ERR_OPERATION_INVALID,
                                _("USB device %s is already in use"),
                                usbDeviceGetName(tmp));
            return -1;
        }

        usbDeviceSetUsedBy(usb, name);
        VIR_DEBUG("Adding %03d.%03d dom=%s to activeUsbHostdevs",
                  usbDeviceGetBus(usb), usbDeviceGetDevno(usb), name);
        /*
         * The caller is responsible to steal these usb devices
         * from the usbDeviceList that passed in on success,
         * perform rollback on failure.
         */
        if (usbDeviceListAdd(driver->activeUsbHostdevs, usb) < 0)
            return -1;
    }
    return 0;
}

static int
qemuPrepareHostUSBDevices(struct qemud_driver *driver,
                          virDomainDefPtr def)
{
    int i, ret = -1;
    usbDeviceList *list;
    usbDevice *tmp;
    virDomainHostdevDefPtr *hostdevs = def->hostdevs;
    int nhostdevs = def->nhostdevs;

    /* To prevent situation where USB device is assigned to two domains
     * we need to keep a list of currently assigned USB devices.
     * This is done in several loops which cannot be joined into one big
     * loop. See qemuPrepareHostdevPCIDevices()
     */
    if (!(list = usbDeviceListNew()))
        goto cleanup;

    /* Loop 1: build temporary list and validate no usb device
     * is already taken
     */
    for (i = 0 ; i < nhostdevs ; i++) {
        virDomainHostdevDefPtr hostdev = hostdevs[i];
        usbDevice *usb = NULL;

        if (hostdev->mode != VIR_DOMAIN_HOSTDEV_MODE_SUBSYS)
            continue;
        if (hostdev->source.subsys.type != VIR_DOMAIN_HOSTDEV_SUBSYS_TYPE_USB)
            continue;

        unsigned vendor = hostdev->source.subsys.u.usb.vendor;
        unsigned product = hostdev->source.subsys.u.usb.product;
        unsigned bus = hostdev->source.subsys.u.usb.bus;
        unsigned device = hostdev->source.subsys.u.usb.device;

        if (vendor && bus) {
            usb = usbFindDevice(vendor, product, bus, device);

        } else if (vendor && !bus) {
            usbDeviceList *devs = usbFindDeviceByVendor(vendor, product);
            if (!devs)
                 goto cleanup;

            if (usbDeviceListCount(devs) > 1) {
                qemuReportError(VIR_ERR_OPERATION_FAILED,
                                _("multiple USB devices for %x:%x, "
                                  "use <address> to specify one"), vendor, product);
                usbDeviceListFree(devs);
                goto cleanup;
            }
            usb = usbDeviceListGet(devs, 0);
            usbDeviceListSteal(devs, usb);
            usbDeviceListFree(devs);

            hostdev->source.subsys.u.usb.bus = usbDeviceGetBus(usb);
            hostdev->source.subsys.u.usb.device = usbDeviceGetDevno(usb);

        } else if (!vendor && bus) {
            usb = usbFindDeviceByBus(bus, device);
        }

        if (!usb)
            goto cleanup;

        if (usbDeviceListAdd(list, usb) < 0) {
            usbFreeDevice(usb);
            goto cleanup;
        }
    }

    /* Mark devices in temporary list as used by @name
     * and add them do driver list. However, if something goes
     * wrong, perform rollback.
     */
    if (qemuPrepareHostdevUSBDevices(driver, def->name, list) < 0)
        goto inactivedevs;

    /* Loop 2: Temporary list was successfully merged with
     * driver list, so steal all items to avoid freeing them
     * in cleanup label.
     */
    while (usbDeviceListCount(list) > 0) {
        tmp = usbDeviceListGet(list, 0);
        usbDeviceListSteal(list, tmp);
    }

    ret = 0;
    goto cleanup;

inactivedevs:
    /* Steal devices from driver->activeUsbHostdevs.
     * We will free them later.
     */
    for (i = 0; i < usbDeviceListCount(list); i++) {
        tmp = usbDeviceListGet(list, i);
        usbDeviceListSteal(driver->activeUsbHostdevs, tmp);
    }

cleanup:
    usbDeviceListFree(list);
    return ret;
}

int qemuPrepareHostDevices(struct qemud_driver *driver,
                           virDomainDefPtr def)
{
    if (!def->nhostdevs)
        return 0;

    if (qemuPrepareHostPCIDevices(driver, def) < 0)
        return -1;

    if (qemuPrepareHostUSBDevices(driver, def) < 0)
        return -1;

    return 0;
}


void qemuReattachPciDevice(pciDevice *dev, struct qemud_driver *driver)
{
    int retries = 100;

    if (!pciDeviceGetManaged(dev))
        return;

    while (pciWaitForDeviceCleanup(dev, "kvm_assigned_device")
           && retries) {
        usleep(100*1000);
        retries--;
    }

    if (pciReAttachDevice(dev, driver->activePciHostdevs) < 0) {
        virErrorPtr err = virGetLastError();
        VIR_ERROR(_("Failed to re-attach PCI device: %s"),
                  err ? err->message : _("unknown error"));
        virResetError(err);
    }
}


void qemuDomainReAttachHostdevDevices(struct qemud_driver *driver,
                                      const char *name,
                                      virDomainHostdevDefPtr *hostdevs,
                                      int nhostdevs)
{
    pciDeviceList *pcidevs;
    int i;

    if (!(pcidevs = qemuGetActivePciHostDeviceList(driver,
                                                   hostdevs,
                                                   nhostdevs))) {
        virErrorPtr err = virGetLastError();
        VIR_ERROR(_("Failed to allocate pciDeviceList: %s"),
                  err ? err->message : _("unknown error"));
        virResetError(err);
        return;
    }

    /* Again 3 loops; mark all devices as inactive before reset
     * them and reset all the devices before re-attach */
    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        pciDevice *activeDev = NULL;

        /* Never delete the dev from list driver->activePciHostdevs
         * if it's used by other domain.
         */
        activeDev = pciDeviceListFind(driver->activePciHostdevs, dev);
        if (activeDev &&
            STRNEQ_NULLABLE(name, pciDeviceGetUsedBy(activeDev)))
            continue;

        /* pciDeviceListFree() will take care of freeing the dev. */
        pciDeviceListSteal(driver->activePciHostdevs, dev);
    }

    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        if (pciResetDevice(dev, driver->activePciHostdevs, pcidevs) < 0) {
            virErrorPtr err = virGetLastError();
            VIR_ERROR(_("Failed to reset PCI device: %s"),
                      err ? err->message : _("unknown error"));
            virResetError(err);
        }
    }

    for (i = 0; i < pciDeviceListCount(pcidevs); i++) {
        pciDevice *dev = pciDeviceListGet(pcidevs, i);
        qemuReattachPciDevice(dev, driver);
    }

    pciDeviceListFree(pcidevs);
}

static void
qemuDomainReAttachHostUsbDevices(struct qemud_driver *driver,
                                 const char *name,
                                 virDomainHostdevDefPtr *hostdevs,
                                 int nhostdevs)
{
    int i;

    for (i = 0; i < nhostdevs; i++) {
        virDomainHostdevDefPtr hostdev = hostdevs[i];
        usbDevice *usb, *tmp;
        const char *used_by = NULL;

        if (hostdev->mode != VIR_DOMAIN_HOSTDEV_MODE_SUBSYS)
            continue;
        if (hostdev->source.subsys.type != VIR_DOMAIN_HOSTDEV_SUBSYS_TYPE_USB)
            continue;

        usb = usbGetDevice(hostdev->source.subsys.u.usb.bus,
                           hostdev->source.subsys.u.usb.device);

        if (!usb) {
            VIR_WARN("Unable to reattach USB device %03d.%03d on domain %s",
                     hostdev->source.subsys.u.usb.bus,
                     hostdev->source.subsys.u.usb.device,
                     name);
            continue;
        }

        /* Delete only those USB devices which belongs
         * to domain @name because qemuProcessStart() might
         * have failed because USB device is already taken.
         * Therefore we want to steal only those devices from
         * the list which were taken by @name */

        tmp = usbDeviceListFind(driver->activeUsbHostdevs, usb);
        usbFreeDevice(usb);

        if (!tmp) {
            VIR_WARN("Unable to find device %03d.%03d "
                     "in list of active USB devices",
                     hostdev->source.subsys.u.usb.bus,
                     hostdev->source.subsys.u.usb.device);
            continue;
        }

        used_by = usbDeviceGetUsedBy(tmp);
        if (STREQ_NULLABLE(used_by, name)) {
            VIR_DEBUG("Removing %03d.%03d dom=%s from activeUsbHostdevs",
                      hostdev->source.subsys.u.usb.bus,
                      hostdev->source.subsys.u.usb.device,
                      name);

            usbDeviceListDel(driver->activeUsbHostdevs, tmp);
        }
    }
}

void qemuDomainReAttachHostDevices(struct qemud_driver *driver,
                                   virDomainDefPtr def)
{
    if (!def->nhostdevs)
        return;

    qemuDomainReAttachHostdevDevices(driver, def->name, def->hostdevs, def->nhostdevs);

    qemuDomainReAttachHostUsbDevices(driver, def->name, def->hostdevs,
                                     def->nhostdevs);
}
