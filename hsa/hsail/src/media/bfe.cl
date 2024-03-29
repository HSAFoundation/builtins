#include "media.h"

#pragma OPENCL EXTENSION cl_amd_media_ops2 : enable

__attribute__((overloadable,always_inline,const)) uint2 amd_bfe(uint2 v1, uint2 v2, uint2 v3) 
{
    uint2 ret;
    ret.x =  __hsail_bfe(v1.x,v2.x, v3.x);
    ret.y =  __hsail_bfe(v1.y,v2.y,v3.y);
    return ret;
}
__attribute__((overloadable,always_inline,const)) uint3 amd_bfe(uint3 v1, uint3 v2, uint3 v3) 
{
    uint3 ret;
    ret.x =  __hsail_bfe(v1.x,v2.x, v3.x);
    ret.y =  __hsail_bfe(v1.y,v2.y,v3.y);
    ret.z =  __hsail_bfe(v1.z,v2.z, v3.z);
    return ret;
}
__attribute__((overloadable,always_inline,const)) uint4 amd_bfe(uint4 v1, uint4 v2, uint4 v3) 
{
    uint4 ret;
    ret.x =  __hsail_bfe(v1.x,v2.x, v3.x);
    ret.y =  __hsail_bfe(v1.y,v2.y,v3.y);
    ret.z =  __hsail_bfe(v1.z,v2.z, v3.z);
    ret.w =  __hsail_bfe(v1.w,v2.w,v3.w);
    return ret;
}
__attribute__((overloadable,always_inline,const)) uint8 amd_bfe(uint8 v1, uint8 v2, uint8 v3) 
{
    uint8 ret;
    ret.s0 =  __hsail_bfe(v1.s0,v2.s0, v3.s0);
    ret.s1 =  __hsail_bfe(v1.s1,v2.s1,v3.s1);
    ret.s2 =  __hsail_bfe(v1.s2,v2.s2, v3.s2);
    ret.s3 =  __hsail_bfe(v1.s3,v2.s3,v3.s3);
    ret.s4 =  __hsail_bfe(v1.s4,v2.s4,v3.s4) ;
    ret.s5 =  __hsail_bfe(v1.s5,v2.s5,v3.s5);
    ret.s6 =  __hsail_bfe(v1.s6,v2.s6,v3.s6 );
    ret.s7 =  __hsail_bfe(v1.s7,v2.s7,v3.s7);
    return ret;
}
__attribute__((overloadable,always_inline,const)) uint16 amd_bfe(uint16 v1, uint16 v2, uint16 v3) 
{
    uint16 ret;
    ret.s0 =  __hsail_bfe(v1.s0,v2.s0, v3.s0);
    ret.s1 =  __hsail_bfe(v1.s1,v2.s1,v3.s1);
    ret.s2 =  __hsail_bfe(v1.s2,v2.s2, v3.s2);
    ret.s3 =  __hsail_bfe(v1.s3,v2.s3,v3.s3);
    ret.s4 =  __hsail_bfe(v1.s4,v2.s4,v3.s4) ;
    ret.s5 =  __hsail_bfe(v1.s5,v2.s5,v3.s5);
    ret.s6 =  __hsail_bfe(v1.s6,v2.s6,v3.s6 );
    ret.s7 =  __hsail_bfe(v1.s7,v2.s7,v3.s7);
    ret.s8 =  __hsail_bfe(v1.s8,v2.s8,v3.s8 );
    ret.s9 =  __hsail_bfe(v1.s9,v2.s9,v3.s9);
    ret.sa =  __hsail_bfe(v1.sa,v2.sa, v3.sa);
    ret.sb =  __hsail_bfe(v1.sb,v2.sb,v3.sb);
    ret.sc =  __hsail_bfe(v1.sc,v2.sc, v3.sc);
    ret.sd =  __hsail_bfe(v1.sd,v2.sd,v3.sd);
    ret.se =  __hsail_bfe(v1.se,v2.se, v3.se);
    ret.sf=  __hsail_bfe(v1.sf,v2.sf,v3.sf);

    return ret;
}
__attribute__((overloadable,always_inline,const)) uint amd_bfe(uint v1, uint v2, uint v3) 
{
    return  __hsail_bfe(v1,v2,v3);
}
__attribute__((overloadable,always_inline,const)) int2 amd_bfe(int2 v1, uint2 v2, uint2 v3)
{
    int2 ret;
    ret.x =  __hsail_ibfe(v1.x,v2.x, v3.x);
    ret.y =  __hsail_ibfe(v1.y,v2.y,v3.y);
    return ret;
}
__attribute__((overloadable,always_inline,const)) int3 amd_bfe(int3 v1, uint3 v2, uint3 v3)
{
    int3 ret;
    ret.x =  __hsail_ibfe(v1.x,v2.x, v3.x);
    ret.y =  __hsail_ibfe(v1.y,v2.y,v3.y);
    ret.z =  __hsail_ibfe(v1.z,v2.z, v3.z);
    return ret;
}
__attribute__((overloadable,always_inline,const)) int4 amd_bfe(int4 v1, uint4 v2, uint4 v3)
{
    int4 ret;
    ret.x =  __hsail_ibfe(v1.x,v2.x, v3.x);
    ret.y =  __hsail_ibfe(v1.y,v2.y,v3.y);
    ret.z =  __hsail_ibfe(v1.z,v2.z, v3.z);
    ret.w =  __hsail_ibfe(v1.w,v2.w,v3.w);
    return ret;
}
__attribute__((overloadable,always_inline,const)) int8 amd_bfe(int8 v1, uint8 v2, uint8 v3)
{
    int8 ret;
    ret.s0 =  __hsail_ibfe(v1.s0,v2.s0, v3.s0);
    ret.s1 =  __hsail_ibfe(v1.s1,v2.s1,v3.s1);
    ret.s2 =  __hsail_ibfe(v1.s2,v2.s2, v3.s2);
    ret.s3 =  __hsail_ibfe(v1.s3,v2.s3,v3.s3);
    ret.s4 =  __hsail_ibfe(v1.s4,v2.s4,v3.s4) ;
    ret.s5 =  __hsail_ibfe(v1.s5,v2.s5,v3.s5);
    ret.s6 =  __hsail_ibfe(v1.s6,v2.s6,v3.s6 );
    ret.s7 =  __hsail_ibfe(v1.s7,v2.s7,v3.s7);
    return ret;
}
__attribute__((overloadable,always_inline,const)) int16 amd_bfe(int16 v1, uint16 v2, uint16 v3)
{
    int16 ret;
    ret.s0 =  __hsail_ibfe(v1.s0,v2.s0, v3.s0);
    ret.s1 =  __hsail_ibfe(v1.s1,v2.s1,v3.s1);
    ret.s2 =  __hsail_ibfe(v1.s2,v2.s2, v3.s2);
    ret.s3 =  __hsail_ibfe(v1.s3,v2.s3,v3.s3);
    ret.s4 =  __hsail_ibfe(v1.s4,v2.s4,v3.s4) ;
    ret.s5 =  __hsail_ibfe(v1.s5,v2.s5,v3.s5);
    ret.s6 =  __hsail_ibfe(v1.s6,v2.s6,v3.s6 );
    ret.s7 =  __hsail_ibfe(v1.s7,v2.s7,v3.s7);
    ret.s8 =  __hsail_ibfe(v1.s8,v2.s8,v3.s8 );
    ret.s9 =  __hsail_ibfe(v1.s9,v2.s9,v3.s9);
    ret.sa =  __hsail_ibfe(v1.sa,v2.sa, v3.sa);
    ret.sb =  __hsail_ibfe(v1.sb,v2.sb,v3.sb);
    ret.sc =  __hsail_ibfe(v1.sc,v2.sc, v3.sc);
    ret.sd =  __hsail_ibfe(v1.sd,v2.sd,v3.sd);
    ret.se =  __hsail_ibfe(v1.se,v2.se, v3.se);
    ret.sf=  __hsail_ibfe(v1.sf,v2.sf,v3.sf);
    
    return ret;
}
__attribute__((overloadable,always_inline,const)) int amd_bfe(int v1, uint v2, uint v3)
{
    return  __hsail_ibfe(v1,v2,v3);
}
