
#include "math64.h"

__attribute__((overloadable, always_inline)) int
ilogb(double x)
{
    ulong ux = as_ulong(x);
    ulong ax = ux & ~SIGNBIT_DP64;
    int r = (int)(ax >> EXPSHIFTBITS_DP64) - EXPBIAS_DP64;
    int rs = -1011 - (int)clz(ax & MANTBITS_DP64);
    r = ax < 0x0010000000000000UL ? rs : r;
    r = ax > 0x7ff0000000000000UL | ax == 0UL ? 0x80000000 : r;
    r = ax == 0x7ff0000000000000UL ? 0x7fffffff : r;
    return r;
}

