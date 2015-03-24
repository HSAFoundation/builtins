
#if 0

#define COMPILING_EXP2
#include "expF_base.h"

#else

#include "math32.h"

__attribute__((overloadable, weak)) float
exp2(float x)
{
    // Reduce x
    const float ln2HI = 0x1.62e300p-1f;
    const float ln2LO = 0x1.2fefa2p-17f;

    float t = rint(x);
    int p = (int)t;
    float tt = x - t;
    float hi = tt * ln2HI;
    float lo = tt * ln2LO;

    // Evaluate poly
    t = hi + lo;
    tt  = t*t;
    float v = mad(tt,
                  -mad(tt,
		       mad(tt,
		           mad(tt,
			       mad(tt, 0x1.637698p-25f, -0x1.bbd41cp-20f),
                               0x1.1566aap-14f),
                           -0x1.6c16c2p-9f),
                       0x1.555556p-3f),
                  t);

    float y = 1.0f - (((-lo) - MATH_DIVIDE(t * v, 2.0f - v)) - hi);

    // Scale by 2^p
    float r =  as_float(as_int(y) + (p << 23));

    const float ulim =  128.0f;
    const float llim = -126.0f;

    r = x < llim ? 0.0f : r;
    r = x < ulim ? r : as_float(0x7f800000);
    return isnan(x) ? x : r;
}

#endif
