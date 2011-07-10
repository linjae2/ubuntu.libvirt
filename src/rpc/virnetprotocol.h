/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#ifndef _VIRNETPROTOCOL_H_RPCGEN
#define _VIRNETPROTOCOL_H_RPCGEN

#include <rpc/rpc.h>


#ifdef __cplusplus
extern "C" {
#endif

#include "internal.h"
#include <arpa/inet.h>
#ifdef HAVE_XDR_U_INT64_T
# define xdr_uint64_t xdr_u_int64_t
#endif
#ifndef IXDR_PUT_INT32
# define IXDR_PUT_INT32 IXDR_PUT_LONG
#endif
#ifndef IXDR_GET_INT32
# define IXDR_GET_INT32 IXDR_GET_LONG
#endif
#ifndef IXDR_PUT_U_INT32
# define IXDR_PUT_U_INT32 IXDR_PUT_U_LONG
#endif
#ifndef IXDR_GET_U_INT32
# define IXDR_GET_U_INT32 IXDR_GET_U_LONG
#endif
#define VIR_NET_MESSAGE_MAX 262144
#define VIR_NET_MESSAGE_HEADER_MAX 24
#define VIR_NET_MESSAGE_PAYLOAD_MAX 262120
#define VIR_NET_MESSAGE_LEN_MAX 4
#define VIR_NET_MESSAGE_STRING_MAX 65536

enum virNetMessageType {
        VIR_NET_CALL = 0,
        VIR_NET_REPLY = 1,
        VIR_NET_MESSAGE = 2,
        VIR_NET_STREAM = 3,
};
typedef enum virNetMessageType virNetMessageType;

enum virNetMessageStatus {
        VIR_NET_OK = 0,
        VIR_NET_ERROR = 1,
        VIR_NET_CONTINUE = 2,
};
typedef enum virNetMessageStatus virNetMessageStatus;
#define VIR_NET_MESSAGE_HEADER_XDR_LEN 4

struct virNetMessageHeader {
        u_int prog;
        u_int vers;
        int proc;
        virNetMessageType type;
        u_int serial;
        virNetMessageStatus status;
};
typedef struct virNetMessageHeader virNetMessageHeader;

typedef char virNetMessageUUID[VIR_UUID_BUFLEN];

typedef char *virNetMessageNonnullString;

typedef virNetMessageNonnullString *virNetMessageString;

struct virNetMessageNonnullDomain {
        virNetMessageNonnullString name;
        virNetMessageUUID uuid;
        int id;
};
typedef struct virNetMessageNonnullDomain virNetMessageNonnullDomain;

struct virNetMessageNonnullNetwork {
        virNetMessageNonnullString name;
        virNetMessageUUID uuid;
};
typedef struct virNetMessageNonnullNetwork virNetMessageNonnullNetwork;

typedef virNetMessageNonnullDomain *virNetMessageDomain;

typedef virNetMessageNonnullNetwork *virNetMessageNetwork;

struct virNetMessageError {
        int code;
        int domain;
        virNetMessageString message;
        int level;
        virNetMessageDomain dom;
        virNetMessageString str1;
        virNetMessageString str2;
        virNetMessageString str3;
        int int1;
        int int2;
        virNetMessageNetwork net;
};
typedef struct virNetMessageError virNetMessageError;

/* the xdr functions */

#if defined(__STDC__) || defined(__cplusplus)
extern  bool_t xdr_virNetMessageType (XDR *, virNetMessageType*);
extern  bool_t xdr_virNetMessageStatus (XDR *, virNetMessageStatus*);
extern  bool_t xdr_virNetMessageHeader (XDR *, virNetMessageHeader*);
extern  bool_t xdr_virNetMessageUUID (XDR *, virNetMessageUUID);
extern  bool_t xdr_virNetMessageNonnullString (XDR *, virNetMessageNonnullString*);
extern  bool_t xdr_virNetMessageString (XDR *, virNetMessageString*);
extern  bool_t xdr_virNetMessageNonnullDomain (XDR *, virNetMessageNonnullDomain*);
extern  bool_t xdr_virNetMessageNonnullNetwork (XDR *, virNetMessageNonnullNetwork*);
extern  bool_t xdr_virNetMessageDomain (XDR *, virNetMessageDomain*);
extern  bool_t xdr_virNetMessageNetwork (XDR *, virNetMessageNetwork*);
extern  bool_t xdr_virNetMessageError (XDR *, virNetMessageError*);

#else /* K&R C */
extern bool_t xdr_virNetMessageType ();
extern bool_t xdr_virNetMessageStatus ();
extern bool_t xdr_virNetMessageHeader ();
extern bool_t xdr_virNetMessageUUID ();
extern bool_t xdr_virNetMessageNonnullString ();
extern bool_t xdr_virNetMessageString ();
extern bool_t xdr_virNetMessageNonnullDomain ();
extern bool_t xdr_virNetMessageNonnullNetwork ();
extern bool_t xdr_virNetMessageDomain ();
extern bool_t xdr_virNetMessageNetwork ();
extern bool_t xdr_virNetMessageError ();

#endif /* K&R C */

#ifdef __cplusplus
}
#endif

#endif /* !_VIRNETPROTOCOL_H_RPCGEN */
