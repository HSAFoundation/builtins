
#include "media.h"

__attribute__((overloadable, always_inline)) uint
amd_bitalign(uint a, uint b, uint c)
{
    return __hsail_bitalign_b32(a, b, c);
}

__attribute__((overloadable, always_inline)) uint2
amd_bitalign(uint2 a, uint2 b, uint2 c)
{
    uint2 ret;
    ret.x =  __hsail_bitalign_b32(a.x, b.x, c.x);
    ret.y =  __hsail_bitalign_b32(a.y, b.y, c.y);
    return ret;
}

__attribute__((overloadable, always_inline)) uint3
amd_bitalign(uint3 a, uint3 b, uint3 c)
{
    uint3 ret;
    ret.x =  __hsail_bitalign_b32(a.x, b.x, c.x);
    ret.y =  __hsail_bitalign_b32(a.y, b.y, c.y);
    ret.z =  __hsail_bitalign_b32(a.z, b.z, c.z);
    return ret;

}

__attribute__((overloadable, always_inline)) uint4
amd_bitalign(uint4 a, uint4 b, uint4 c)
{
    uint4 ret;
    ret.x =  __hsail_bitalign_b32(a.x, b.x, c.x);
    ret.y =  __hsail_bitalign_b32(a.y, b.y, c.y);
    ret.z =  __hsail_bitalign_b32(a.z, b.z, c.z);
    ret.w =  __hsail_bitalign_b32(a.w, b.w, c.w);
    return ret;
}

__attribute__((overloadable, always_inline)) uint8
amd_bitalign(uint8 a, uint8 b, uint8 c)
{
    uint8 ret;
    ret.s0 =  __hsail_bitalign_b32(a.s0, b.s0, c.s0);
    ret.s1 =  __hsail_bitalign_b32(a.s1, b.s1, c.s1);
    ret.s2 =  __hsail_bitalign_b32(a.s2, b.s2, c.s2);
    ret.s3 =  __hsail_bitalign_b32(a.s3, b.s3, c.s3);
    ret.s4 =  __hsail_bitalign_b32(a.s4, b.s4, c.s4);
    ret.s5 =  __hsail_bitalign_b32(a.s5, b.s5, c.s5);
    ret.s6 =  __hsail_bitalign_b32(a.s6, b.s6, c.s6);
    ret.s7 =  __hsail_bitalign_b32(a.s7, b.s7, c.s7);
    return ret;
}

__attribute__((overloadable, always_inline)) uint16
amd_bitalign(uint16 a, uint16 b, uint16 c)
{
    uint16 ret;
    ret.s0 =  __hsail_bitalign_b32(a.s0, b.s0, c.s0);
    ret.s1 =  __hsail_bitalign_b32(a.s1, b.s1, c.s1);
    ret.s2 =  __hsail_bitalign_b32(a.s2, b.s2, c.s2);
    ret.s3 =  __hsail_bitalign_b32(a.s3, b.s3, c.s3);
    ret.s4 =  __hsail_bitalign_b32(a.s4, b.s4, c.s4);
    ret.s5 =  __hsail_bitalign_b32(a.s5, b.s5, c.s5);
    ret.s6 =  __hsail_bitalign_b32(a.s6, b.s6, c.s6);
    ret.s7 =  __hsail_bitalign_b32(a.s7, b.s7, c.s7);
    ret.s8 =  __hsail_bitalign_b32(a.s8, b.s8, c.s8);
    ret.s9 =  __hsail_bitalign_b32(a.s9, b.s9, c.s9);
    ret.sa =  __hsail_bitalign_b32(a.sa, b.sa, c.sa);
    ret.sb =  __hsail_bitalign_b32(a.sb, b.sb, c.sb);
    ret.sc =  __hsail_bitalign_b32(a.sc, b.sc, c.sc);
    ret.sd =  __hsail_bitalign_b32(a.sd, b.sd, c.sd);
    ret.se =  __hsail_bitalign_b32(a.se, b.se, c.se);
    ret.sf =  __hsail_bitalign_b32(a.sf, b.sf, c.sf);
    return ret;
}

