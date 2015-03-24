
#include "math32.h"

__attribute__((overloadable, always_inline)) float
round(float x)
{
    float t = trunc(x);
    float d = fabs(x - t);
    float o = as_float((as_int(x) & 0x80000000) | 0x3f800000);
    return t + (d >= 0.5f ? o : 0.0f);
}

