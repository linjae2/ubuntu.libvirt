#include <config.h>
/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include "./remote/qemu_protocol.h"
#include "internal.h"
#include "remote_protocol.h"
#include <arpa/inet.h>

bool_t
xdr_qemu_monitor_command_args (XDR *xdrs, qemu_monitor_command_args *objp)
{

         if (!xdr_remote_nonnull_domain (xdrs, &objp->domain))
                 return FALSE;
         if (!xdr_remote_nonnull_string (xdrs, &objp->cmd))
                 return FALSE;
         if (!xdr_int (xdrs, &objp->flags))
                 return FALSE;
        return TRUE;
}

bool_t
xdr_qemu_monitor_command_ret (XDR *xdrs, qemu_monitor_command_ret *objp)
{

         if (!xdr_remote_nonnull_string (xdrs, &objp->result))
                 return FALSE;
        return TRUE;
}

bool_t
xdr_qemu_procedure (XDR *xdrs, qemu_procedure *objp)
{

         if (!xdr_enum (xdrs, (enum_t *) objp))
                 return FALSE;
        return TRUE;
}
