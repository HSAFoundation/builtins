
#include "math64.h"

// No __amdil intrinsic, so use __hsail version
extern __attribute__((const)) double __hsail_nsqrt_f64(double);

__attribute__((overloadable, always_inline)) double
sqrt(double x)
{
    int cx = x == 0.0 | x == (double)INFINITY;
    int cb = x < 0x1.0p-767;
    int sx = cb ? 256 : 0;
    int ss = cb ? -128 : 0;

    x = __amdil_ldexp_f64(x, sx);

    double y = __hsail_nsqrt_f64(x);
    double s0 = x*y;
    double h0 = 0.5 * y;
    double r0 = fma(-h0, s0, 0.5);
    double h1 = fma(h0, r0, h0);
    double s1 = fma(s0, r0, s0);
    double d0 = fma(-s1, s1, x);
    double s2 = fma(d0, h1, s1);
    double d1 = fma(-s2, s2, x);
    double s3 = fma(d1, h1, s2);

    s3 = __amdil_ldexp_f64(s3, ss);

    return cx ? x : s3;
}
