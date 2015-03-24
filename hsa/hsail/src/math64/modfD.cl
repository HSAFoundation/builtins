
#include "math64.h"

__attribute__((overloadable, always_inline)) double
modf(double x, double *iptr)
{
    long ux = as_long(x);
    int e = ((int)(ux >> 52) & 0x7ff) - 1023;
    long s = ux & 0x8000000000000000L;
    long msk = 0xffffffffffffffffL << (52 - e);
    long i = msk & ux;
    long r = as_long(x - as_double(i));

    r = e < 0 ? ux : r;
    i = e < 0 ? s : i;

    r = e >= 52 ? s : r;
    i = e >= 52 ? ux : i;

    r = (ux & 0x7fffffffffffffffL) > 0x7ff0000000000000L ? ux : r;

    *iptr = as_double(i);
    return as_double(r);
}


#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline)) double
modf(double x, __global double *iptr)
{
    double i;
    double f = modf(x, &i);
    *iptr = i;
    return f;
}

__attribute__((overloadable, always_inline)) double
modf(double x, __local double *iptr)
{
    double i;
    double f = modf(x, &i);
    *iptr = i;
    return f;
}
#endif

