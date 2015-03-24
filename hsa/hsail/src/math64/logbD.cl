
#include "math64.h"

__attribute__((overloadable, always_inline)) double
logb(double x)
{
    long ax = as_long(x) & EXSIGNBIT_DP64;
    double s = -1011L - clz(ax);
    double r = (int)(ax >> EXPSHIFTBITS_DP64) - EXPBIAS_DP64;
    r = ax >= PINFBITPATT_DP64 ? as_double(ax) : r;
    r = ax < 0x0010000000000000L ? s : r;
    r = ax == 0L ? as_double(NINFBITPATT_DP64) : r;
    return r;
}

