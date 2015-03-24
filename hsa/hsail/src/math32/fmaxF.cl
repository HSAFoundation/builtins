
#include "math32.h"

#define G(N) \
__attribute__((overloadable, always_inline)) float##N \
fmax(float##N x, float##N y) \
{ \
    float##N ret; \
    ret.lo = fmax(x.lo, y.lo); \
    ret.hi = fmax(x.hi, y.hi); \
    return ret; \
}

G(4)

__attribute__((overloadable, always_inline)) float3 \
fmax(float3 x, float3 y) \
{ \
    float3 ret; \
    ret.xy = fmax(x.xy, y.xy);\
    ret.z = fmax(x.z, y.z);\
    return ret; \
}
G(2)

__attribute__ ((overloadable, always_inline, weak)) float
fmax(float x, float y)
{
    // The multiplications are for sNAN quieting (required and work only when mode.IEEE=1).
    // These also flush denorms (note that this is *not* required by OpenCL even if
    // CL_FP_DENORMS is not reported for floats). HSAIL min/max_ftz have denorm-flushing
    // overhead, HSAIL min/max without ftz would cause denorm mode switching. GCN min/max
    // do not have any overhead but should not be used in the general library.
    return __hsail_max_f32(__hsail_mul_ftz_f32(x, 1.0F), __hsail_mul_ftz_f32(y, 1.0F));
}
