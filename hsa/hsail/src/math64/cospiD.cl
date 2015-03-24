
#include "math64.h"
#include "sincosD_piby4.h"

__attribute__((overloadable)) double
cospi(double x)
{
    const double pi = 3.1415926535897932384626433832795;

    long ix = as_long(x) & 0x7fffffffffffffffL; 
    double ax = as_double(ix);
    long iax = (long)ax;
    double r = ax - (double)iax;
    long xodd = iax & 0x1L ? 0x8000000000000000L : 0L;

    // Initialize with return for +-Inf and NaN
    long ir = 0x7ff8000000000000L;

    // 2^53 <= |x| < Inf, the result is always even integer
    ir = ix < 0x7ff0000000000000 ? 0x3ff0000000000000L : ir;

    // 2^52 <= |x| < 2^53, the result is always integer
    ir = ax < 0x1.0p+53 ? xodd | 0x3ff0000000000000L : ir;

    // 0x1.0p-7 <= |x| < 2^52, result depends on which 0.25 interval

    // r < 1.0
    double a = 1.0 - r;
    int e = 1;
    long s = xodd ^ 0x8000000000000000L;

    // r <= 0.75
    int c = r <= 0.75;
    double t = r - 0.5;
    a = c ? t : a;
    e = c ? 0 : e;

    // r < 0.5
    c = r < 0.5;
    t = 0.5 - r;
    a = c ? t : a;
    s = c ? xodd : s;

    // r <= 0.25
    c = r <= 0.25;
    a = c ? r : a;
    e = c ? 1 : e;

    double2 sc = sincos_piby4(a * pi, 0.0);
    long jr = s ^ as_long(e ? sc.hi : sc.lo);

    ir = ax < 0x1.0p+52 ? jr : ir;

    return as_double(ir);
}

