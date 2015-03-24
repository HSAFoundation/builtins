
#include "math32.h"

extern __attribute__((const)) float __hsail_div_ftz_f32(float, float);

__attribute__((always_inline, weak)) float
__precise_fp32_div_f32(float x, float y)
{
    return __hsail_div_ftz_f32(x,y);
}


__attribute__((always_inline, weak)) float2
__precise_fp32_div_2f32(float2 x, float2 y)
{
    float2 ret;
    ret.lo = __precise_fp32_div_f32(x.lo, y.lo);
    ret.hi = __precise_fp32_div_f32(x.hi, y.hi);
    return ret;
}

__attribute__((always_inline, weak)) float3
__precise_fp32_div_3f32(float3 x, float3 y)
{
    float3 ret;
    ret.xy = __precise_fp32_div_2f32(x.xy, y.xy);
    ret.z = __precise_fp32_div_f32(x.z, y.z);
    return ret;
}

__attribute__((always_inline, weak)) float4
__precise_fp32_div_4f32(float4 x, float4 y)
{
    float4 ret;
    ret.lo = __precise_fp32_div_2f32(x.lo, y.lo);
    ret.hi = __precise_fp32_div_2f32(x.hi, y.hi);
    return ret;
}

__attribute__((always_inline, weak)) float8
__precise_fp32_div_8f32(float8 x, float8 y)
{
    float8 ret;
    ret.lo = __precise_fp32_div_4f32(x.lo, y.lo);
    ret.hi = __precise_fp32_div_4f32(x.hi, y.hi);
    return ret;
}

__attribute__((always_inline, weak)) float16
__precise_fp32_div_16f32(float16 x, float16 y)
{
    float16 ret;
    ret.s0123 = __precise_fp32_div_4f32(x.s0123, y.s0123);
    ret.s4567 = __precise_fp32_div_4f32(x.s4567, y.s4567);
    ret.s89ab = __precise_fp32_div_4f32(x.s89ab, y.s89ab);
    ret.scdef = __precise_fp32_div_4f32(x.scdef, y.scdef);
    return ret;
}
