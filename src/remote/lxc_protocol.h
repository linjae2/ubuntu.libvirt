/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#ifndef _LXC_PROTOCOL_H_RPCGEN
#define _LXC_PROTOCOL_H_RPCGEN

#include <rpc/rpc.h>


#ifdef __cplusplus
extern "C" {
#endif

#include "internal.h"
#include "remote_protocol.h"

struct lxc_domain_open_namespace_args {
        remote_nonnull_domain dom;
        u_int flags;
};
typedef struct lxc_domain_open_namespace_args lxc_domain_open_namespace_args;
#define LXC_PROGRAM 0x00068000
#define LXC_PROTOCOL_VERSION 1

enum lxc_procedure {
        LXC_PROC_DOMAIN_OPEN_NAMESPACE = 1,
};
typedef enum lxc_procedure lxc_procedure;

/* the xdr functions */

#if defined(__STDC__) || defined(__cplusplus)
extern  bool_t xdr_lxc_domain_open_namespace_args (XDR *, lxc_domain_open_namespace_args*);
extern  bool_t xdr_lxc_procedure (XDR *, lxc_procedure*);

#else /* K&R C */
extern bool_t xdr_lxc_domain_open_namespace_args ();
extern bool_t xdr_lxc_procedure ();

#endif /* K&R C */

#ifdef __cplusplus
}
#endif

#endif /* !_LXC_PROTOCOL_H_RPCGEN */