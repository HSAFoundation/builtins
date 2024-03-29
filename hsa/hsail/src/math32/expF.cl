
#if 0

#define COMPILING_EXP
#include "expF_base.h"

#else

#include "math32.h"

__attribute__((overloadable, weak)) float
exp(float x)
{
    // Reduce x
    const float ln2HI = 0x1.62e300p-1f;
    const float ln2LO = 0x1.2fefa2p-17f;
    const float invln2 = 0x1.715476p+0f;

    float fhalF = x < 0.0f ? -0.5f : 0.5f;
    int p  = mad(x, invln2, fhalF);
    float fp = (float)p;
    float hi = mad(fp, -ln2HI, x); // t*ln2HI is exact here
    float lo = -fp*ln2LO;

    // Evaluate poly
    float t = hi + lo;
    float tt  = t*t;
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

    const float ulim =  0x1.62e430p+6f; // ln(largest_normal) = 88.72283905206835305366
    const float llim = -0x1.5d589ep+6f; // ln(smallest_normal) = -87.33654475055310898657

    r = x < llim ? 0.0f : r;
    r = x < ulim ? r : as_float(0x7f800000);
    return isnan(x) ? x : r;
}

#endif

