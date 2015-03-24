
#include "math64.h"
#include "sincosD_piby4.h"
#include "remainderD_piby2.h"

__attribute__((overloadable)) double
cos(double x)
{
    x = fabs(x);

    double r, rr;
    int regn;

    if (x < 0x1.0p+30)
        remainder_piby2_medium(x, &r, &rr, &regn);
    else 
        remainder_piby2_large(x, &r, &rr, &regn);

    double2 sc = sincos_piby4(r, rr);
    sc.lo = -sc.lo;

    int2 c = as_int2(regn & 1 ? sc.lo : sc.hi);
    c.hi ^= (regn > 1) << 31;

    return __amdil_class_f64(x, SNAN|QNAN|PINF) ? as_double(QNANBITPATT_DP64) : as_double(c);
}

