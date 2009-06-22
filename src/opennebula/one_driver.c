/*---------------------------------------------------------------------------*/
/* Copyright 2002-2009, Distributed Systems Architecture Group, Universidad
 * Complutense de Madrid (dsa-research.org)
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
 */
/*---------------------------------------------------------------------------*/

#include <config.h>

#include <fcntl.h>
#include <sched.h>
#include <sys/utsname.h>
#include <stdbool.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/poll.h>
#include <unistd.h>
#include <wait.h>
#include <sys/time.h>

#include "virterror_internal.h"
#include "logging.h"
#include "datatypes.h"
#include "one_conf.h"
#include "one_driver.h"
#include "memory.h"
#include "util.h"
#include "bridge.h"
#include "veth.h"

#define VIR_FROM_THIS VIR_FROM_ONE

static int oneStartup(void);
static int oneShutdown(void);
static int oneActive(void);

static void oneDriverLock(one_driver_t* driver)
{
    virMutexLock(&driver->lock);
}

static void oneDriverUnlock(one_driver_t* driver)
{
    virMutexUnlock(&driver->lock);
}

static one_driver_t *one_driver =NULL;


static virDrvOpenStatus oneOpen(virConnectPtr conn,
                                virConnectAuthPtr auth ATTRIBUTE_UNUSED,
                                int flags ATTRIBUTE_UNUSED)
{
    /* Verify uri was specified */
    if (conn->uri == NULL) {
        conn->uri = xmlParseURI("one:///");
        if (!conn->uri) {
            virReportOOMError(conn);
            return VIR_DRV_OPEN_ERROR;
        }
    } else if (conn->uri->scheme == NULL ||
               STRNEQ(conn->uri->scheme, "one")) {
        goto declineConnection;
    }
    conn->privateData = one_driver;

    return VIR_DRV_OPEN_SUCCESS;

declineConnection:
    return VIR_DRV_OPEN_DECLINED;
}

static int oneClose(virConnectPtr conn)
{
    conn->privateData = NULL;
    return 0;
}

static virDomainPtr oneDomainLookupByID(virConnectPtr conn,
                                        int id)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    virDomainPtr dom = NULL;
    virDomainObjPtr vm = NULL;

    oneDriverLock(driver);
    vm = virDomainFindByID(&driver->domains, id);
    oneDriverUnlock(driver);

    if (!vm) {
        oneError(conn, NULL, VIR_ERR_NO_DOMAIN, NULL);
        goto return_point;
    }

    dom = virGetDomain(conn, vm->def->name, vm->def->uuid);
    if (dom) {
        dom->id = vm->def->id;
    }

return_point:
    if(vm) {
        virDomainObjUnlock(vm);
    }

    return dom;
}

static virDomainPtr oneDomainLookupByUUID(virConnectPtr conn,
                                          const unsigned char *uuid)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    virDomainPtr dom = NULL;
    virDomainObjPtr vm = NULL;

    oneDriverLock(driver);
    vm = virDomainFindByUUID(&driver->domains, uuid);
    oneDriverUnlock(driver);
    if (!vm) {
        oneError(conn, NULL, VIR_ERR_NO_DOMAIN, NULL);
        goto return_point;
    }

    dom = virGetDomain(conn, vm->def->name, vm->def->uuid);
    if (dom) {
        dom->id = vm->def->id;
    }

return_point:
    if(vm) {
        virDomainObjUnlock(vm);
    }

    return dom;
}

static virDomainPtr oneDomainLookupByName(virConnectPtr conn,
                                          const char *name)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    virDomainObjPtr vm = NULL;
    virDomainPtr dom=NULL;

    oneDriverLock(driver);
    vm = virDomainFindByName(&driver->domains, name);
    oneDriverUnlock(driver);

    if (!vm) {
        oneError(conn, NULL, VIR_ERR_NO_DOMAIN, NULL);
        goto return_point;
    }

    dom = virGetDomain(conn, vm->def->name, vm->def->uuid);
    if (dom) {
        dom->id = vm->def->id;
    }
return_point:
    if(vm) {
        virDomainObjUnlock(vm);
    }

    return dom;
}

static int oneListDomains(virConnectPtr conn, int *ids, int nids)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    int got = 0, i;

    oneDriverLock(driver);
    for (i = 0 ; i < driver->domains.count && got < nids ; i++){
        virDomainObjLock(driver->domains.objs[i]);
        if (virDomainIsActive(driver->domains.objs[i]))
            ids[got++] = driver->domains.objs[i]->def->id;
        virDomainObjUnlock(driver->domains.objs[i]);
    }
    oneDriverUnlock(driver);

    return got;
}

static int oneNumDomains(virConnectPtr conn)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    int n = 0, i;

    oneDriverLock(driver);
    for (i = 0 ; i < driver->domains.count ; i++){
        virDomainObjLock(driver->domains.objs[i]);
        if (virDomainIsActive(driver->domains.objs[i]))
            n++;
        virDomainObjUnlock(driver->domains.objs[i]);
    }
    oneDriverUnlock(driver);

    return n;
}

static int oneListDefinedDomains(virConnectPtr conn,
                                 char **const names, int nnames) {
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    int got = 0, i;

    oneDriverLock(driver);
    for (i = 0 ; i < driver->domains.count && got < nnames ; i++) {
        virDomainObjLock(driver->domains.objs[i]);
        if (!virDomainIsActive(driver->domains.objs[i])) {
            if (!(names[got++] = strdup(driver->domains.objs[i]->def->name))) {
                virReportOOMError(conn);
                virDomainObjUnlock(driver->domains.objs[i]);
                goto cleanup;
            }
        }
        virDomainObjUnlock(driver->domains.objs[i]);
    }
    oneDriverUnlock(driver);

    return got;

cleanup:
    for (i = 0 ; i < got ; i++)
        VIR_FREE(names[i]);
    oneDriverUnlock(driver);

    return -1;
}

static int oneNumDefinedDomains(virConnectPtr conn)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    int n = 0, i;

    oneDriverLock(driver);
    for (i = 0 ; i < driver->domains.count ; i++){
        virDomainObjLock(driver->domains.objs[i]);
        if (!virDomainIsActive(driver->domains.objs[i]))
            n++;
        virDomainObjUnlock(driver->domains.objs[i]);
    }
    oneDriverUnlock(driver);

    return n;
}

static virDomainPtr oneDomainDefine(virConnectPtr conn, const char *xml)
{
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    virDomainDefPtr def;
    virDomainObjPtr vm;
    virDomainPtr dom=NULL;

    oneDriverLock(driver);
    if (!(def = virDomainDefParseString(conn, driver->caps, xml,
                                        VIR_DOMAIN_XML_INACTIVE)))
        goto return_point;

    if (!(vm = virDomainAssignDef(conn, &driver->domains, def))) {
        virDomainDefFree(def);
        goto return_point;
    }

    vm->def->id = -1;
    vm->persistent = 1;
    dom = virGetDomain(conn, vm->def->name, vm->def->uuid);
    if (dom) {
        dom->id = vm->def->id;
    }
    virDomainObjUnlock(vm);

return_point:
    oneDriverUnlock(driver);
    return dom;
}


static int oneDomainUndefine(virDomainPtr dom)
{
    one_driver_t *driver = (one_driver_t *)dom->conn->privateData;
    virDomainObjPtr vm = NULL;
    int ret=-1;

    oneDriverLock(driver);
    vm =virDomainFindByUUID(&driver->domains, dom->uuid);
    if (!vm) {
        oneError(dom->conn, dom, VIR_ERR_INVALID_DOMAIN,
                 _("no domain with matching uuid"));
        goto return_point;
    }

    if (!vm->persistent) {
        oneError(dom->conn, dom, VIR_ERR_INTERNAL_ERROR,
                 _("cannot undefine transient domain"));
        goto return_point;
    }
    virDomainRemoveInactive(&driver->domains, vm);
    ret=0;

return_point:
    oneDriverUnlock(driver);
    return ret;
}

static int oneDomainGetInfo(virDomainPtr dom,
                            virDomainInfoPtr info)
{
    one_driver_t *driver = (one_driver_t *)dom->conn->privateData;
    struct timeval tv;
    virDomainObjPtr vm;
    oneDriverLock(driver);
    vm= virDomainFindByUUID(&driver->domains, dom->uuid);
    oneDriverUnlock(driver);

    if (!vm) {
        oneError(dom->conn,dom, VIR_ERR_INVALID_DOMAIN,
                 "%s", _("no domain with matching uuid"));
        return -1;
    }

    if(gettimeofday(&tv,NULL)<0) {
        oneError(dom->conn,dom, VIR_ERR_INTERNAL_ERROR,
                 "%s",_("getting time of day"));
        virDomainObjUnlock(vm);
        return -1;
    }

    if (!virDomainIsActive(vm)) {
        info->cpuTime = 0;
    } else {
        char vm_info[257];
        c_oneVmInfo(vm->pid,vm_info,256);
        //State:
        char* cptr = strstr(vm_info,"STATE");
        cptr = index(cptr, ':');
        cptr++;
        int one_state=atoi(cptr);

        switch(one_state) {
        case 3:                                     /** running */
            if (vm->state!=VIR_DOMAIN_SHUTDOWN)
                vm->state=VIR_DOMAIN_RUNNING;
            break;
        case 5:                                     /** pause */
            vm->state=VIR_DOMAIN_PAUSED;
            break;
        case 6:                                     /** done */
            vm->state=VIR_DOMAIN_SHUTOFF;
            vm->def->id=-1;
            break;
        case 7:                                     /** error */
            vm->state=VIR_DOMAIN_CRASHED;
            break;
        default:
            break;
        };
        //Memory:
        cptr=strstr(vm_info,"MEMORY");
        cptr=index(cptr,':');
        cptr++;
        vm->def->memory = atoi(cptr);

        //run time:
        cptr=strstr(vm_info,"START TIME");
        cptr=index(cptr,':');
        cptr++;
        long starttime = atol(cptr);
        info->cpuTime = (tv.tv_sec - starttime) *1000ll *1000ll *1000ll;

    }

    info->state = vm->state;
    info->maxMem = vm->def->maxmem;
    info->memory = vm->def->memory;
    info->nrVirtCpu = vm->def->vcpus;

    virDomainObjUnlock(vm);
    return 0;
}

static char *oneGetOSType(virDomainPtr dom)
{

    one_driver_t *driver = (one_driver_t *)dom->conn->privateData;
    virDomainObjPtr vm = NULL;

    oneDriverLock(driver);
    vm =virDomainFindByUUID(&driver->domains, dom->uuid);
    oneDriverUnlock(driver);
    if (!vm) {
        oneError(dom->conn,dom, VIR_ERR_INVALID_DOMAIN,
                 "%s", _("no domain with matching uuid"));
        return NULL;
    }

    virDomainObjUnlock(vm);
    return strdup(vm->def->os.type);
}

static int oneDomainStart(virDomainPtr dom)
{
    virConnectPtr conn = dom->conn;
    one_driver_t *driver = (one_driver_t *)(conn->privateData);
    virDomainObjPtr vm;
    int ret = -1;
    int oneid;

    oneDriverLock(driver);
    vm = virDomainFindByName(&driver->domains, dom->name);

    if (!vm) {
        oneError(conn, dom, VIR_ERR_INVALID_DOMAIN,
                 _("no domain named %s"), dom->name);
        goto return_point;
    }
    if((oneid = oneSubmitVM(dom->conn,driver,vm)) < 0) {
        goto return_point;
    }
    vm->pid=oneid;
    vm->def->id=driver->nextid++;
    vm->state=VIR_DOMAIN_BLOCKED;
    ret=0;

return_point:
    if(vm)
        virDomainObjUnlock(vm);
    oneDriverUnlock(driver);

    return ret;
}

static virDomainPtr
oneDomainCreateAndStart(virConnectPtr conn,
                        const char *xml,
                        unsigned int flags ATTRIBUTE_UNUSED) {
    one_driver_t *driver = (one_driver_t *)conn->privateData;
    virDomainObjPtr vm = NULL;
    virDomainDefPtr def;
    virDomainPtr dom = NULL;
    int oneid;

    oneDriverLock(driver);
    if (!(def = virDomainDefParseString(conn, driver->caps, xml,
                                        VIR_DOMAIN_XML_INACTIVE)))
        goto return_point;

    vm = virDomainFindByName(&driver->domains, def->name);
    if (vm) {
        oneError(conn,NULL, VIR_ERR_OPERATION_FAILED,
                 _("Already an OpenNebula VM active with the name: '%s' id: %d "),
                 def->name,def->id);
        goto return_point;
    }

    if (!(vm = virDomainAssignDef(conn, &driver->domains, def))) {
        virDomainDefFree(def);
        goto return_point;
    }
    if ((oneid = oneSubmitVM(conn, driver, vm)) < 0) {
        virDomainRemoveInactive(&driver->domains, vm);
        vm=NULL;
        goto return_point;
    }

    vm->def->id=driver->nextid++;
    vm->persistent=0;
    vm->pid=oneid;
    vm->state=VIR_DOMAIN_BLOCKED;

    dom = virGetDomain(conn, vm->def->name, vm->def->uuid);
    if (dom) {
        dom->id = vm->def->id;
    }

return_point:
    if(vm)
        virDomainObjUnlock(vm);
    oneDriverUnlock(driver);

    return dom;
}

static int oneDomainShutdown(virDomainPtr dom)
{
    one_driver_t *driver = (one_driver_t*)dom->conn->privateData;
    virDomainObjPtr vm;
    int ret=-1;

    oneDriverLock(driver);
    if((vm=virDomainFindByID(&driver->domains, dom->id))) {
        if(!(c_oneShutdown(vm->pid) ) ) {
            vm->state=VIR_DOMAIN_SHUTDOWN;
            ret= 0;
            goto return_point;
        }
        oneError(dom->conn, dom, VIR_ERR_OPERATION_FAILED,
                 _("Wrong state to perform action"));
        goto return_point;
    }
    oneError(dom->conn,dom, VIR_ERR_INVALID_DOMAIN,
             _("no domain with id %d"), dom->id);
    goto return_point;

    if (!vm->persistent) {
        virDomainRemoveInactive(&driver->domains, vm);
        vm = NULL;
    }
return_point:
    if(vm)
        virDomainObjUnlock(vm);
    oneDriverUnlock(driver);

    return ret;
}

static int oneDomainDestroy(virDomainPtr dom)
{
    one_driver_t *driver = (one_driver_t*)dom->conn->privateData;
    virDomainObjPtr vm;
    int ret=-1;

    oneDriverLock(driver);
    vm= virDomainFindByID(&driver->domains, dom->id);
    if (!vm) {
        oneError(dom->conn, dom, VIR_ERR_INVALID_DOMAIN,
                 _("no domain with id %d"), dom->id);
        goto return_point;
    }
    if(c_oneCancel(vm->pid)) {
        /* VM not running, delete the instance at ONE DB */
        if(c_oneFinalize(vm->pid)){
            oneError(dom->conn, dom, VIR_ERR_OPERATION_FAILED,
                     _("Wrong state to perform action"));
            goto return_point;
        }
    }
    if(!vm->persistent) {
        virDomainRemoveInactive(&driver->domains,vm);
        vm=NULL;
    }
    ret=0;

return_point:
    if(vm)
        virDomainObjUnlock(vm);

    oneDriverUnlock(driver);

    return ret;
}

static int oneDomainSuspend(virDomainPtr dom)
{
    one_driver_t* driver=dom->conn->privateData;
    virDomainObjPtr vm;
    int ret=-1;

    oneDriverLock(driver);
    if ((vm=virDomainFindByID(&driver->domains,dom->id))){

        if (vm->state == VIR_DOMAIN_RUNNING) {
            if( !(c_oneSuspend(vm->pid)) ) {
                vm->state=VIR_DOMAIN_PAUSED;
                ret=0;
                goto return_point;
            }
            oneError(dom->conn, dom, VIR_ERR_OPERATION_FAILED,
                     _("Wrong state to perform action"));
            goto return_point;
        }
        oneError(dom->conn,dom,VIR_ERR_OPERATION_FAILED,
                 _("domain is not running"));
    } else {
        oneError(dom->conn, dom, VIR_ERR_INVALID_DOMAIN,
                 _("no domain with matching id %d"), dom->id);
    }

return_point:
    if(vm)
        virDomainObjUnlock(vm);
    oneDriverUnlock(driver);

    return ret;
};

static int oneDomainResume(virDomainPtr dom)
{
    one_driver_t* driver=dom->conn->privateData;
    virDomainObjPtr vm;
    int ret=-1;

    oneDriverLock(driver);
    if ((vm=virDomainFindByID(&driver->domains,dom->id))) {
        if (vm->state == VIR_DOMAIN_PAUSED) {
            if( !(c_oneResume(vm->pid)) ) {
                vm->state=VIR_DOMAIN_RUNNING;
                ret=0;
                goto return_point;
            }
            oneError(dom->conn, dom, VIR_ERR_OPERATION_FAILED,
                     _("Wrong state to perform action"));
            goto return_point;
        }
        oneError(dom->conn,dom,VIR_ERR_OPERATION_FAILED,
                 _("domain is not paused "));
    } else {
        oneError(dom->conn, dom, VIR_ERR_INVALID_DOMAIN,
                 _("no domain with matching id %d"), dom->id);
    }

return_point:
    if(vm)
        virDomainObjUnlock(vm);
    oneDriverUnlock(driver);

    return ret;
};

static int oneStartup(void){

    if (VIR_ALLOC(one_driver) < 0) {
        return -1;
    }

    if(virMutexInit(&one_driver->lock)<0){
        VIR_FREE(one_driver);
        return -1;
    }

    c_oneStart();
    oneDriverLock(one_driver);
    one_driver->nextid=1;
    if ((one_driver->caps = oneCapsInit()) == NULL) {
        oneDriverUnlock(one_driver);
        VIR_FREE(one_driver);
        return -1;
    }
    oneDriverUnlock(one_driver);

    return 0;
}

static int oneShutdown(void){
    if (one_driver == NULL)
        return(-1);

    oneDriverLock(one_driver);
    virDomainObjListFree(&one_driver->domains);

    virCapabilitiesFree(one_driver->caps);
    oneDriverUnlock(one_driver);
    virMutexDestroy(&one_driver->lock);
    VIR_FREE(one_driver);
    one_driver = NULL;
    c_oneFree();
    return 0;
}

static int oneActive(void){
    unsigned int i;
    int active = 0;

    if (one_driver == NULL)
        return(0);

    oneDriverLock(one_driver);
    for (i = 0 ; i < one_driver->domains.count ; i++) {
        virDomainObjLock(one_driver->domains.objs[i]);
        if (virDomainIsActive(one_driver->domains.objs[i]))
            active = 1;
        virDomainObjUnlock(one_driver->domains.objs[i]);
    }
    oneDriverUnlock(one_driver);

    return active;

}

static int oneVersion(virConnectPtr conn ATTRIBUTE_UNUSED, unsigned long *hvVer)
{
    *hvVer = 1;
    return 0;
}


static int oneGetAutostart(virDomainPtr domain ATTRIBUTE_UNUSED, int *autostart)
{
    autostart=0;
    return 0;
}

static char*  oneGetCapabilities(virConnectPtr conn){
    one_driver_t* privconn=conn->privateData;
    char *xml;
    oneDriverLock(privconn);
    if ((xml = virCapabilitiesFormatXML(privconn->caps)) == NULL)
        virReportOOMError(conn);
    oneDriverUnlock(privconn);
    return xml;
}
/* Function Tables */
static virDriver oneDriver = {
    VIR_DRV_ONE, /* the number virDrvNo */
    "one", /* the name of the driver */
    oneOpen, /* open */
    oneClose, /* close */
    NULL, /* supports_feature */
    NULL, /* type */
    oneVersion, /* version */
    NULL, /* getHostname */
    NULL, /* getMaxVcpus */
    NULL, /* nodeGetInfo */
    oneGetCapabilities, /* getCapabilities */
    oneListDomains, /* listDomains */
    oneNumDomains, /* numOfDomains */
    oneDomainCreateAndStart, /* domainCreateXML */
    oneDomainLookupByID, /* domainLookupByID */
    oneDomainLookupByUUID, /* domainLookupByUUID */
    oneDomainLookupByName, /* domainLookupByName */
    oneDomainSuspend, /* domainSuspend */
    oneDomainResume, /* domainResume */
    oneDomainShutdown, /* domainShutdown */
    NULL, /* domainReboot */
    oneDomainDestroy, /* domainDestroy */
    oneGetOSType, /* domainGetOSType */
    NULL, /* domainGetMaxMemory */
    NULL, /* domainSetMaxMemory */
    NULL, /* domainSetMemory */
    oneDomainGetInfo, /* domainGetInfo */
    NULL, /* domainSave */
    NULL, /* domainRestore */
    NULL, /* domainCoreDump */
    NULL, /* domainSetVcpus */
    NULL, /* domainPinVcpu */
    NULL, /* domainGetVcpus */
    NULL, /* domainGetMaxVcpus */
    NULL, /* domainGetSecurityLabel */
    NULL, /* nodeGetSecurityModel */
    NULL, /* domainDumpXML */
    oneListDefinedDomains, /* listDefinedDomains */
    oneNumDefinedDomains, /* numOfDefinedDomains */
    oneDomainStart, /* domainCreate */
    oneDomainDefine, /* domainDefineXML */
    oneDomainUndefine, /* domainUndefine */
    NULL, /* domainAttachDevice */
    NULL, /* domainDetachDevice */
    oneGetAutostart, /* domainGetAutostart */
    NULL, /* domainSetAutostart */
    NULL, /* domainGetSchedulerType */
    NULL, /* domainGetSchedulerParameters */
    NULL, /* domainSetSchedulerParameters */
    NULL, /* domainMigratePrepare */
    NULL, /* domainMigratePerform */
    NULL, /* domainMigrateFinish */
    NULL, /* domainBlockStats */
    NULL, /* domainInterfaceStats */
    NULL, /* domainBlockPeek */
    NULL, /* domainMemoryPeek */
    NULL, /* nodeGetCellsFreeMemory */
    NULL, /* getFreeMemory */
    NULL, /* domainEventRegister */
    NULL, /* domainEventDeregister */
    NULL, /* domainMigratePrepare2 */
    NULL, /* domainMigrateFinish2 */
    NULL, /* nodeDeviceDettach; */
    NULL, /* nodeDeviceReAttach; */
    NULL, /* nodeDeviceReset; */
};

static virStateDriver oneStateDriver = {
    .initialize = oneStartup,
    .cleanup    = oneShutdown,
    .active     = oneActive,
};


int oneRegister(void)
{
    virRegisterDriver(&oneDriver);
    virRegisterStateDriver(&oneStateDriver);
    return 0;
}
