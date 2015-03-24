
#include "math32.h"

__attribute__((overloadable, always_inline, weak)) float
half_exp(float x)
{
    return native_exp(x);
}

//__attribute__((overloadable, always_inline)) float2
//half_exp(float2 x)
//{
//    return native_exp(x);
//}
//
//__attribute__((overloadable, always_inline)) float4
//half_exp(float4 x)
//{
//    return native_exp(x);
//}

__attribute__((overloadable, always_inline, weak)) float
half_exp2(float x)
{
    return native_exp2(x);
}

//__attribute__((overloadable, always_inline)) float2
//half_exp2(float2 x)
//{
//    return native_exp2(x);
//}
//
//__attribute__((overloadable, always_inline)) float4
//half_exp2(float4 x)
//{
//    return native_exp2(x);
//}

__attribute__((overloadable, always_inline, weak)) float
half_exp10(float x)
{
    return native_exp10(x);
}

//__attribute__((overloadable, always_inline)) float2
//half_exp10(float2 x)
//{
//    return native_exp10(x);
//}
//
//__attribute__((overloadable, always_inline)) float4
//half_exp10(float4 x)
//{
//    return native_exp10(x);
//}

