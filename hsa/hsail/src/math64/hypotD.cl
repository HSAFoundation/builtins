
#include "math64.h"

__attribute__((overloadable)) double
hypot(double x, double y)
{
    ulong ux = as_ulong(x) & ~SIGNBIT_DP64;
    int xexp = ux >> EXPSHIFTBITS_DP64;
    x = as_double(ux);

    ulong uy = as_ulong(y) & ~SIGNBIT_DP64;
    int yexp = uy >> EXPSHIFTBITS_DP64;
    y = as_double(uy);

    int c = xexp > EXPBIAS_DP64 + 500 | yexp > EXPBIAS_DP64 + 500;
    double preadjust = c ? 0x1.0p-600 : 1.0;
    double postadjust = c ? 0x1.0p+600 : 1.0;

    c = xexp < EXPBIAS_DP64 - 500 | yexp < EXPBIAS_DP64 - 500;
    preadjust = c ? 0x1.0p+600 : preadjust;
    postadjust = c ? 0x1.0p-600 : postadjust;

    double ax = x * preadjust;
    double ay = y * preadjust;

    // The post adjust may overflow, but this can't be avoided in any case
    double r = sqrt(fma(ax, ax, ay*ay)) * postadjust;

    // If the difference in exponents between x and y is large
    double s = x + y;
    c = abs(xexp - yexp) > MANTLENGTH_DP64 + 1;
    r = c ? s : r;

    // Check for NaN
    //c = x != x | y != y;
    c = isnan(x) | isnan(y);
    r = c ? as_double(QNANBITPATT_DP64) : r;

    // If either is Inf, we must return Inf
    c = x == as_double(PINFBITPATT_DP64) | y == as_double(PINFBITPATT_DP64);
    r = c ? as_double(PINFBITPATT_DP64) : r;

    return r;
}

