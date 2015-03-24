
#include "math32.h"

#define G(N) \
__attribute__((overloadable, always_inline)) float##N \
fabs(float##N x) \
{ \
    float##N ret; \
    ret.lo = fabs(x.lo); \
    ret.hi = fabs(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)

__attribute__((overloadable, always_inline)) float3
fabs(float3 x)
{
    float3 ret;
    ret.xy = fabs(x.xy);
    ret.z = fabs(x.z);
    return ret;
}

G(2)

__attribute__((overloadable, always_inline)) float
fabs(float x)
{
    return __amdil_fabs_f32(x);
}

