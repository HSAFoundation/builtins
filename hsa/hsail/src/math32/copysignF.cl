
#include "math32.h"

// __hsail_ intrinsic which has no __amdil_ equivalent.
extern __attribute__((const)) float  __hsail_copysign_f32(float, float);

__attribute__((overloadable, always_inline)) float4
copysign(float4 x, float4 y)
{
    return bitselect(y, x, as_float4((int4)0x7fffffff));
}

__attribute__((overloadable, always_inline)) float3
copysign(float3 x, float3 y)
{
    return bitselect(y, x, as_float3((int3)0x7fffffff));
}

__attribute__((overloadable, always_inline)) float2
copysign(float2 x, float2 y)
{
    return bitselect(y, x, as_float2((int2)0x7fffffff));
}

__attribute__((overloadable, always_inline)) float
copysign(float x, float y)
{
    return __hsail_copysign_f32(x, y);
}

