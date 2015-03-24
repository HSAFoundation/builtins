
#include "math64.h"

__attribute__((always_inline)) static double
__FREXPF8(double x, __private int *ep)
{
    int c = __amdil_class_f64(x, PINF|NINF|SNAN|QNAN);
    int e = __amdil_frexp_exp_f64(x);
    double r = __amdil_frexp_mant_f64(x);
    e = c ? 0 : e;
    r = c ? x : r;
    *ep = e;
    return r;
}

extern __attribute__((overloadable, alias("__FREXPF8"))) double frexp(double, __private int *);

__attribute__((overloadable, always_inline)) double
frexp(double x, __local int *ep)
{
    int e;
    double f = __FREXPF8(x, &e);
    *ep = e;
    return f;
}

__attribute__((overloadable, always_inline)) double
frexp(double x, __global int *ep)
{
    int e;
    double f = __FREXPF8(x, &e);
    *ep = e;
    return f;
}

