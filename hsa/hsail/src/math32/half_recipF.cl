
#include "math32.h"

extern __attribute__((pure)) float __amdil_div_f32(float,float);
//extern __attribute__((pure)) float2 __amdil_div_v2f32(float2,float2);
//extern __attribute__((pure)) float4 __amdil_div_v4f32(float4,float4);

__attribute__((overloadable, always_inline)) float
half_recip(float x)
{
    return __amdil_div_f32(1.0f, x);
}

//__attribute__((overloadable, always_inline)) float2
//half_recip(float2 x)
//{
//    return __amdil_div_v2f32((float2)1.0f, x);
//}
//
//__attribute__((overloadable, always_inline)) float3
//half_recip(float3 x)
//{
//    float3 ret;
//    ret.s01 =  __amdil_div_v2f32((float2)1.0f, x.s01);
//    ret.s2 = __amdil_div_f32(1.0f, x.s2);
//    return ret;
//}
//
//__attribute__((overloadable, always_inline)) float4
//half_recip(float4 x)
//{
//    return __amdil_div_v4f32((float4)1.0f, x);
//}

