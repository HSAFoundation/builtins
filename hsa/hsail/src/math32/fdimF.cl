
#include "math32.h"

__attribute__((overloadable, always_inline)) float
fdim(float x, float y)
{
    int n = -(isnan(x) | isnan(y)) & QNANBITPATT_SP32;
    int r = -(x > y) & as_int(x - y);
    return as_float(n | r);
}

__attribute__((overloadable, always_inline)) float4
fdim(float4 x, float4 y)
{
    int4 n = ~((x == x) & (y == y)) & QNANBITPATT_SP32;
    int4 r = (x > y) & as_int4(x - y);
    return as_float4(n | r);
}

