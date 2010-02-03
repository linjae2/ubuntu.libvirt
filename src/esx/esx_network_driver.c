
/*
 * esx_network_driver.c: network driver methods for managing VMware ESX
 *                       host networks
 *
 * Copyright (C) 2010 Matthias Bolte <matthias.bolte@googlemail.com>
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
 */

#include <config.h>

#include "internal.h"
#include "virterror_internal.h"
#include "util.h"
#include "memory.h"
#include "logging.h"
#include "uuid.h"
#include "esx_private.h"
#include "esx_network_driver.h"
#include "esx_vi.h"
#include "esx_vi_methods.h"
#include "esx_util.h"

#define VIR_FROM_THIS VIR_FROM_ESX

#define ESX_ERROR(conn, code, fmt...)                                         \
    virReportErrorHelper(conn, VIR_FROM_ESX, code, __FILE__, __FUNCTION__,    \
                         __LINE__, fmt)



static virDrvOpenStatus
esxNetworkOpen(virConnectPtr conn,
               virConnectAuthPtr auth ATTRIBUTE_UNUSED,
               int flags ATTRIBUTE_UNUSED)
{
    if (STRNEQ(conn->driver->name, "ESX")) {
        return VIR_DRV_OPEN_DECLINED;
    }

    conn->networkPrivateData = conn->privateData;

    return VIR_DRV_OPEN_SUCCESS;
}



static int
esxNetworkClose(virConnectPtr conn)
{
    conn->networkPrivateData = NULL;

    return 0;
}



static virNetworkDriver esxNetworkDriver = {
    "ESX",                                 /* name */
    esxNetworkOpen,                        /* open */
    esxNetworkClose,                       /* close */
    NULL,                                  /* numOfNetworks */
    NULL,                                  /* listNetworks */
    NULL,                                  /* numOfDefinedNetworks */
    NULL,                                  /* listDefinedNetworks */
    NULL,                                  /* networkLookupByUUID */
    NULL,                                  /* networkLookupByName */
    NULL,                                  /* networkCreateXML */
    NULL,                                  /* networkDefineXML */
    NULL,                                  /* networkUndefine */
    NULL,                                  /* networkCreate */
    NULL,                                  /* networkDestroy */
    NULL,                                  /* networkDumpXML */
    NULL,                                  /* networkGetBridgeName */
    NULL,                                  /* networkGetAutostart */
    NULL,                                  /* networkSetAutostart */
    NULL,                                  /* networkIsActive */
    NULL,                                  /* networkIsPersistent */
};



int
esxNetworkRegister(void)
{
    return virRegisterNetworkDriver(&esxNetworkDriver);
}
