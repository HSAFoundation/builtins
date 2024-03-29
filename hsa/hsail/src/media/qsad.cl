#include "media.h"

#pragma OPENCL EXTENSION cl_amd_media_ops2 : enable

__attribute__((overloadable,always_inline,const)) ulong2 amd_qsad(ulong2 v1, uint2 v2, ulong2 v3) 
{
    ulong2 ret;
    ret.x =  __hsail_qsad(v1.x,v2.x, v3.x);
    ret.y =  __hsail_qsad(v1.y,v2.y,v3.y);
    return ret;
}
__attribute__((overloadable,always_inline,const)) ulong3 amd_qsad(ulong3 v1, uint3 v2, ulong3 v3) 
{
    ulong3 ret;
    ret.x =  __hsail_qsad(v1.x,v2.x, v3.x);
    ret.y =  __hsail_qsad(v1.y,v2.y,v3.y);
    ret.z =  __hsail_qsad(v1.z,v2.z, v3.z);
    return ret;
}
__attribute__((overloadable,always_inline,const)) ulong4 amd_qsad(ulong4 v1, uint4 v2, ulong4 v3) 
{
    ulong4 ret;
    ret.x =  __hsail_qsad(v1.x,v2.x, v3.x);
    ret.y =  __hsail_qsad(v1.y,v2.y,v3.y);
    ret.z =  __hsail_qsad(v1.z,v2.z, v3.z);
    ret.w =  __hsail_qsad(v1.w,v2.w,v3.w);
    return ret;
}
__attribute__((overloadable,always_inline,const)) ulong8 amd_qsad(ulong8 v1, uint8 v2, ulong8 v3) 
{
    ulong8 ret;
    ret.s0 =  __hsail_qsad(v1.s0,v2.s0, v3.s0);
    ret.s1 =  __hsail_qsad(v1.s1,v2.s1,v3.s1);
    ret.s2 =  __hsail_qsad(v1.s2,v2.s2, v3.s2);
    ret.s3 =  __hsail_qsad(v1.s3,v2.s3,v3.s3);
    ret.s4 =  __hsail_qsad(v1.s4,v2.s4,v3.s4) ;
    ret.s5 =  __hsail_qsad(v1.s5,v2.s5,v3.s5);
    ret.s6 =  __hsail_qsad(v1.s6,v2.s6,v3.s6 );
    ret.s7 =  __hsail_qsad(v1.s7,v2.s7,v3.s7);
    return ret;
}
__attribute__((overloadable,always_inline,const)) ulong16 amd_qsad(ulong16 v1, uint16 v2, ulong16 v3) 
{
    ulong16 ret;
    ret.s0 =  __hsail_qsad(v1.s0,v2.s0, v3.s0);
    ret.s1 =  __hsail_qsad(v1.s1,v2.s1,v3.s1);
    ret.s2 =  __hsail_qsad(v1.s2,v2.s2, v3.s2);
    ret.s3 =  __hsail_qsad(v1.s3,v2.s3,v3.s3);
    ret.s4 =  __hsail_qsad(v1.s4,v2.s4,v3.s4) ;
    ret.s5 =  __hsail_qsad(v1.s5,v2.s5,v3.s5);
    ret.s6 =  __hsail_qsad(v1.s6,v2.s6,v3.s6 );
    ret.s7 =  __hsail_qsad(v1.s7,v2.s7,v3.s7);
    ret.s8 =  __hsail_qsad(v1.s8,v2.s8,v3.s8 );
    ret.s9 =  __hsail_qsad(v1.s9,v2.s9,v3.s9);
    ret.sa =  __hsail_qsad(v1.sa,v2.sa, v3.sa);
    ret.sb =  __hsail_qsad(v1.sb,v2.sb,v3.sb);
    ret.sc =  __hsail_qsad(v1.sc,v2.sc, v3.sc);
    ret.sd =  __hsail_qsad(v1.sd,v2.sd,v3.sd);
    ret.se =  __hsail_qsad(v1.se,v2.se, v3.se);
    ret.sf=  __hsail_qsad(v1.sf,v2.sf,v3.sf);

    return ret;
}
__attribute__((overloadable,always_inline,const)) ulong amd_qsad(ulong v1, uint v2, ulong v3) 
{
    return  __hsail_qsad(v1,v2,v3);
}

