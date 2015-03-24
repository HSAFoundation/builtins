#pragma OPENCL EXTENSION cl_khr_subgroups : enable

extern __attribute__((const)) uint __hsail_get_lane_id(void);
extern __attribute__((pure)) uint __hsail_activelaneshuffle_wavewidth_b32(uint src, uint lid, uint ival, bool useival);
extern __attribute__((pure)) ulong __hsail_activelaneshuffle_wavewidth_b64(ulong src, uint lid, ulong ival, bool useival);
extern void __hsail_wavebarrier(void);

// Define exclusive in terms of inclusive

#define EGEN(TY,OP,SZ,AO,AI,ID) \
__attribute__((overloadable, always_inline)) TY \
sub_group_scan_exclusive_##OP(TY a) \
{ \
    a = sub_group_scan_inclusive_##OP(a); \
    uint lid = __hsail_get_lane_id(); \
    a = AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-1)&0x3f, AI(ID), lid < 1)); \
    return a; \
}

EGEN(int,add,32,as_int,as_uint,0)
EGEN(int,min,32,as_int,as_uint,INT_MAX)
EGEN(int,max,32,as_int,as_uint,INT_MIN)

EGEN(uint,add,32,,,0)
EGEN(uint,min,32,,,UINT_MAX)
EGEN(uint,max,32,,,0U)

EGEN(long,add,64,as_long,as_ulong,0L)
EGEN(long,min,64,as_long,as_ulong,LONG_MAX)
EGEN(long,max,64,as_long,as_ulong,LONG_MIN)

EGEN(ulong,add,64,,,0UL)
EGEN(ulong,min,64,,,ULONG_MAX)
EGEN(ulong,max,64,,,0UL)

EGEN(float,add,32,as_float,as_uint,0.0f)
EGEN(float,min,32,as_float,as_uint,INFINITY)
EGEN(float,max,32,as_float,as_uint,-INFINITY)

EGEN(double,add,64,as_double,as_ulong,0.0)
EGEN(double,min,64,as_double,as_ulong,(double)INFINITY)
EGEN(double,max,64,as_double,as_ulong,-(double)INFINITY)

// Now inclusive scan

#define IGENA(TY,SZ,AO,AI,ID) \
__attribute__((overloadable, always_inline)) TY \
sub_group_scan_inclusive_add(TY a) \
{ \
    uint lid = __hsail_get_lane_id(); \
    a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-1)&0x3f, AI(ID), lid < 1)); \
    __hsail_wavebarrier(); \
    a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-2)&0x3f, AI(ID), lid < 2)); \
    __hsail_wavebarrier(); \
    a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-4)&0x3f, AI(ID), lid < 4)); \
    __hsail_wavebarrier(); \
    a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-8)&0x3f, AI(ID), lid < 8)); \
    __hsail_wavebarrier(); \
    a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-16)&0x3f, AI(ID), lid < 16)); \
    __hsail_wavebarrier(); \
    a += AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-32)&0x3f, AI(ID), lid < 32)); \
    __hsail_wavebarrier(); \
    return a; \
}

#define IGENO(TY,SZ,OP,AO,AI,ID) \
__attribute__((overloadable, always_inline)) TY \
sub_group_scan_inclusive_##OP(TY a) \
{ \
    uint lid = __hsail_get_lane_id(); \
    a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-1)&0x3f, AI(ID), lid < 1))); \
    __hsail_wavebarrier(); \
    a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-2)&0x3f, AI(ID), lid < 2))); \
    __hsail_wavebarrier(); \
    a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-4)&0x3f, AI(ID), lid < 4))); \
    __hsail_wavebarrier(); \
    a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-8)&0x3f, AI(ID), lid < 8))); \
    __hsail_wavebarrier(); \
    a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-16)&0x3f, AI(ID), lid < 16))); \
    __hsail_wavebarrier(); \
    a = OP(a, AO(__hsail_activelaneshuffle_wavewidth_b##SZ(AI(a), (lid-32)&0x3f, AI(ID), lid < 32))); \
    __hsail_wavebarrier(); \
    return a; \
}

IGENA(int,32,as_int,as_uint,0)
IGENO(int,32,min,as_int,as_uint,INT_MAX)
IGENO(int,32,max,as_int,as_uint,INT_MIN)

IGENA(uint,32,,,0U)
IGENO(uint,32,min,,,UINT_MAX)
IGENO(uint,32,max,,,0U)

IGENA(long,64,as_long,as_ulong,0L)
IGENO(long,64,min,as_long,as_ulong,LONG_MAX)
IGENO(long,64,max,as_long,as_ulong,LONG_MIN)

IGENA(ulong,64,,,0UL)
IGENO(ulong,64,min,,,ULONG_MAX)
IGENO(ulong,64,max,,,0UL)

IGENA(float,32,as_float,as_uint,0.0f)
IGENO(float,32,min,as_float,as_uint,INFINITY)
IGENO(float,32,max,as_float,as_uint,-INFINITY)

IGENA(double,64,as_double,as_ulong,0.0)
IGENO(double,64,min,as_double,as_ulong,(double)INFINITY)
IGENO(double,64,max,as_double,as_ulong,-(double)INFINITY)

