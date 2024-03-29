
#include "media.h"

__attribute__((overloadable, always_inline)) uint
amd_sadhi(uint a, uint b, uint c)
{
    return __hsail_sadhi_u16x2_u8x4(a, b, c);
}

__attribute__((overloadable, always_inline)) uint2
amd_sadhi(uint2 a, uint2 b, uint2 c)
{
    uint2 ret;
    ret.x =  __hsail_sadhi_u16x2_u8x4(a.x, b.x, c.x);
    ret.y =  __hsail_sadhi_u16x2_u8x4(a.y, b.y, c.y);
    return ret;
}

__attribute__((overloadable, always_inline)) uint3
amd_sadhi(uint3 a, uint3 b, uint3 c)
{

    uint3 ret;
    ret.x =  __hsail_sadhi_u16x2_u8x4(a.x, b.x, c.x);
    ret.y =  __hsail_sadhi_u16x2_u8x4(a.y, b.y, c.y);
    ret.z =  __hsail_sadhi_u16x2_u8x4(a.z, b.z, c.z);
    return ret;

}

__attribute__((overloadable, always_inline)) uint4
amd_sadhi(uint4 a, uint4 b, uint4 c)
{
    uint4 ret;
    ret.x =  __hsail_sadhi_u16x2_u8x4(a.x, b.x, c.x);
    ret.y =  __hsail_sadhi_u16x2_u8x4(a.y, b.y, c.y);
    ret.z =  __hsail_sadhi_u16x2_u8x4(a.z, b.z, c.z);
    ret.w =  __hsail_sadhi_u16x2_u8x4(a.w, b.w, c.w);
    return ret;
}

__attribute__((overloadable, always_inline)) uint8
amd_sadhi(uint8 a, uint8 b, uint8 c)
{
    uint8 ret;
    ret.s0 =  __hsail_sadhi_u16x2_u8x4(a.s0, b.s0, c.s0);
    ret.s1 =  __hsail_sadhi_u16x2_u8x4(a.s1, b.s1, c.s1);
    ret.s2 =  __hsail_sadhi_u16x2_u8x4(a.s2, b.s2, c.s2);
    ret.s3 =  __hsail_sadhi_u16x2_u8x4(a.s3, b.s3, c.s3);
    ret.s4 =  __hsail_sadhi_u16x2_u8x4(a.s4, b.s4, c.s4);
    ret.s5 =  __hsail_sadhi_u16x2_u8x4(a.s5, b.s5, c.s5);
    ret.s6 =  __hsail_sadhi_u16x2_u8x4(a.s6, b.s6, c.s6);
    ret.s7 =  __hsail_sadhi_u16x2_u8x4(a.s7, b.s7, c.s7);
    return ret;
}

__attribute__((overloadable, always_inline)) uint16
amd_sadhi(uint16 a, uint16 b, uint16 c)
{
    uint16 ret;
    ret.s0 =  __hsail_sadhi_u16x2_u8x4(a.s0, b.s0, c.s0);
    ret.s1 =  __hsail_sadhi_u16x2_u8x4(a.s1, b.s1, c.s1);
    ret.s2 =  __hsail_sadhi_u16x2_u8x4(a.s2, b.s2, c.s2);
    ret.s3 =  __hsail_sadhi_u16x2_u8x4(a.s3, b.s3, c.s3);
    ret.s4 =  __hsail_sadhi_u16x2_u8x4(a.s4, b.s4, c.s4);
    ret.s5 =  __hsail_sadhi_u16x2_u8x4(a.s5, b.s5, c.s5);
    ret.s6 =  __hsail_sadhi_u16x2_u8x4(a.s6, b.s6, c.s6);
    ret.s7 =  __hsail_sadhi_u16x2_u8x4(a.s7, b.s7, c.s7);
    ret.s8 =  __hsail_sadhi_u16x2_u8x4(a.s8, b.s8, c.s8);
    ret.s9 =  __hsail_sadhi_u16x2_u8x4(a.s9, b.s9, c.s9);
    ret.sa =  __hsail_sadhi_u16x2_u8x4(a.sa, b.sa, c.sa);
    ret.sb =  __hsail_sadhi_u16x2_u8x4(a.sb, b.sb, c.sb);
    ret.sc =  __hsail_sadhi_u16x2_u8x4(a.sc, b.sc, c.sc);
    ret.sd =  __hsail_sadhi_u16x2_u8x4(a.sd, b.sd, c.sd);
    ret.se =  __hsail_sadhi_u16x2_u8x4(a.se, b.se, c.se);
    ret.sf =  __hsail_sadhi_u16x2_u8x4(a.sf, b.sf, c.sf);
    return ret;
}

