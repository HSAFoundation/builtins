
#include "math64.h"
#include "sincosD_piby4.h"
#include "remainderD_piby2.h"

__attribute__((overloadable, always_inline)) double
sincos(double x, double * cp)
{
    double y = fabs(x);

    double r, rr;
    int regn;

    if (y < 0x1.0p+47)
        remainder_piby2_medium(y, &r, &rr, &regn);
    else 
        remainder_piby2_large(y, &r, &rr, &regn);

    double2 sc = sincos_piby4(r, rr);

    int flip = (regn > 1) << 31;
    int2 s = as_int2(regn & 1 ?  sc.hi : sc.lo);
    s.hi ^= flip ^ ((x < 0.0) << 31);
    sc.lo = -sc.lo;
    int2 c = as_int2(regn & 1 ? sc.lo : sc.hi);
    c.hi ^= flip;

    int xgeinf = isnan(x) | isinf(x);
    s = xgeinf ? as_int2(QNANBITPATT_DP64) : s;
    c = xgeinf ? as_int2(QNANBITPATT_DP64) : c;

    *cp = as_double(c);
    return as_double(s);
}

#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline)) double
sincos(double x, __global double * cp)
{
    double c;
    double s = sincos(x, &c);
    *cp = c;
    return s;
}

__attribute__((overloadable, always_inline)) double
sincos(double x, __local double * cp)
{
    double c;
    double s = sincos(x, &c);
    *cp = c;
    return s;
}
#endif
