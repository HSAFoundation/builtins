
#include "math32.h"

#define G(N) \
__attribute__((overloadable, always_inline)) float##N \
fmin(float##N x, float##N y) \
{ \
    float##N ret; \
    ret.lo = fmin(x.lo, y.lo); \
    ret.hi = fmin(x.hi, y.hi); \
    return ret; \
}

G(4)

__attribute__((overloadable, always_inline)) float3 \
fmin(float3 x, float3 y) \
{ \
    float3 ret; \
    ret.xy = fmin(x.xy, y.xy);\
    ret.z = fmin(x.z, y.z);\
    return ret; \
}
G(2)

__attribute__((overloadable, always_inline, weak)) float
fmin(float x, float y)
{
    /// \see comments in float fmax source.
    return __hsail_min_f32(__hsail_mul_ftz_f32(x, 1.0F), __hsail_mul_ftz_f32(y, 1.0F));
}
