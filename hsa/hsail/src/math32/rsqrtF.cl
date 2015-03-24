
#include "math32.h"

__attribute__((overloadable, always_inline, weak)) float
rsqrt(float x)
{
#if !defined(SUBNORMALS_SUPPORTED)
    int i = as_int(x);
    int ai = i & 0x7fffffff;
    int d = ai > 0 & ai < 0x00800000;
    // scale subnormal by 2^26 without multiplying to avoid input flush
    float s = as_float(i | 0x0d800000) - 0x1.0p-100F;
    x = d ? s : x;
    x = native_rsqrt(x);
    x *= d ? 0x1.0p+13F : 1.0F;
    return x;
#else //SUBNORMALS_SUPPORTED
    return native_rsqrt(x);
#endif


}
