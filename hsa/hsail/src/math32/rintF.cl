
#include "math32.h"

#define G(N) \
__attribute__((overloadable, always_inline)) float##N \
rint(float##N x) \
{ \
    float##N ret; \
    ret.lo = rint(x.lo); \
    ret.hi = rint(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)

__attribute__((overloadable, always_inline)) float3
rint(float3 x)
{
    float3 ret;
    ret.xy = rint(x.xy);
    ret.z = rint(x.z);
    return ret;
}

G(2)


__attribute__((overloadable, always_inline)) float
rint(float x)
{
    return __amdil_round_nearest_f32(x);
}
