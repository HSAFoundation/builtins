
#include "math64.h"
#include "sincosD_piby4.h"
#include "remainderD_piby2.h"

__attribute__((overloadable)) double
sin(double x)
{
    double y = fabs(x);

    double r, rr;
    int regn;

    if (y < 0x1.0p+30)
        remainder_piby2_medium(y, &r, &rr, &regn);
    else 
        remainder_piby2_large(y, &r, &rr, &regn);

    double2 sc = sincos_piby4(r, rr);

    int2 s = as_int2(regn & 1 ? sc.hi : sc.lo);
    s.hi ^= ((regn > 1) << 31) ^ ((x < 0.0) << 31);

    return  __amdil_class_f64(x, SNAN|QNAN|PINF|NINF) ? as_double(QNANBITPATT_DP64) : as_double(s);
}

