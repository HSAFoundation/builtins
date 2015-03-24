
#include "math64.h"

__attribute__((overloadable, always_inline)) double
fdim(double x, double y)
{
    long n = -(isnan(x) | isnan(y)) & QNANBITPATT_DP64;
    long r = -(x > y) & as_long(x - y);
    return as_double(n | r);
}

