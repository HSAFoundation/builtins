
#include "math32.h"

#define G(N) \
__attribute__ ((overloadable, always_inline, weak)) float##N \
ceil(float##N x) \
{ \
    float##N ret; \
    ret.lo = ceil(x.lo); \
    ret.hi = ceil(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)


__attribute__ ((overloadable, always_inline, weak)) float3
ceil(float3 x)
{
    float3 ret;
    ret.xy = ceil(x.xy);
    ret.z = ceil(x.z);
    return ret;
}

G(2)

__attribute__((overloadable, always_inline)) float
ceil(float x)
{
    return __amdil_round_posinf_f32(x);
}
