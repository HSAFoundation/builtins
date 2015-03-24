
#if __OPENCL_C_VERSION__ >= 200

#pragma OPENCL EXTENSION cl_khr_subgroups : enable

extern __attribute__((const)) uint __hsail_get_lane_id(void);
extern __attribute__((pure)) uint __hsail_activelanecount_wavewidth_u32_b1(bool);
extern __attribute__((pure)) uint __hsail_activelaneshuffle_wavewidth_b32(uint src, uint lid, uint ival, bool useival);
extern __attribute__((pure)) ulong __hsail_activelaneshuffle_wavewidth_b64(ulong src, uint lid, ulong ival, bool useival);
extern void __hsail_wavebarrier(void);

#define GENA(TY,SZ,AO,AI,Z) \
__attribute__((overloadable, always_inline)) TY \
sub_group_reduce_add(TY a) \
{ \
    uint n = __hsail_activelanecount_wavewidth_u32_b1(true); \
    if (popcount(n) == 1) { \
        uint lid = __hsail_get_lane_id(); \
        a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^1, AI(Z), false)); \
        __hsail_wavebarrier(); \
        a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^2, AI(Z), false)); \
        __hsail_wavebarrier(); \
        a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^4, AI(Z), false)); \
        __hsail_wavebarrier(); \
        a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^8, AI(Z), false)); \
        __hsail_wavebarrier(); \
        a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^16, AI(Z), false)); \
        __hsail_wavebarrier(); \
        a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^32, AI(Z), false)); \
        __hsail_wavebarrier(); \
    } else { \
	a = sub_group_scan_inclusive_add(a); \
	a = sub_group_broadcast(a, n-1); \
    } \
    return a; \
}

GENA(int,32,as_int,as_uint,0)
GENA(uint,32,,,0U)
GENA(long,64,as_long,as_ulong,0L)
GENA(ulong,64,,,0UL)
GENA(float,32,as_float,as_uint,0.0f)
GENA(double,64,as_double,as_ulong,0.0)

#define GENO(TY,SZ,OP,AO,AI,ID) \
__attribute__((overloadable, always_inline)) TY \
sub_group_reduce_##OP(TY a) \
{ \
    uint n = __hsail_activelanecount_wavewidth_u32_b1(true); \
    if (popcount(n) == 1) { \
        uint lid = __hsail_get_lane_id(); \
        a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^1, AI(ID), false))); \
        __hsail_wavebarrier(); \
        a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^2, AI(ID), false))); \
        __hsail_wavebarrier(); \
        a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^4, AI(ID), false))); \
        __hsail_wavebarrier(); \
        a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^8, AI(ID), false))); \
        __hsail_wavebarrier(); \
        a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^16, AI(ID), false))); \
        __hsail_wavebarrier(); \
        a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), lid^32, AI(ID), false))); \
        __hsail_wavebarrier(); \
    } else { \
	a = sub_group_scan_inclusive_##OP(a); \
	a = sub_group_broadcast(a, n-1); \
    } \
    return a; \
}

GENO(int,32,min,as_int,as_uint,INT_MAX)
GENO(uint,32,min,,,UINT_MAX)
GENO(long,64,min,as_long,as_ulong,LONG_MAX)
GENO(ulong,64,min,,,ULONG_MAX)
GENO(float,32,min,as_float,as_uint,INFINITY)
GENO(double,64,min,as_double,as_ulong,(double)INFINITY)

GENO(int,32,max,as_int,as_uint,INT_MIN)
GENO(uint,32,max,,,0U)
GENO(long,64,max,as_long,as_ulong,LONG_MIN)
GENO(ulong,64,max,,,0UL)
GENO(float,32,max,as_float,as_uint,-INFINITY)
GENO(double,64,max,as_double,as_ulong,-(double)INFINITY)

#endif

