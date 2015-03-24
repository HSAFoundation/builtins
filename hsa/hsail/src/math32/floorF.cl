
#include "math32.h"

#define G(N) \
__attribute__ ((overloadable, always_inline, weak)) float##N \
floor(float##N x) \
{ \
    float##N ret; \
    ret.lo = floor(x.lo); \
    ret.hi = floor(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)

__attribute__((overloadable, always_inline)) float3
floor(float3 x)
{
    float3 ret;
    ret.xy = floor(x.xy);;
    ret.z = floor(x.z);;
    return ret;
}

G(2)

__attribute__((overloadable, always_inline)) float
floor(float x)
{
    return __amdil_round_neginf_f32(x);
}

