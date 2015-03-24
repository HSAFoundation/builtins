
#include "math64.h"

#define COMPILING_REMQUO
#include "remainderD.h"

#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline)) double
remquo(double x, double y, __global int *quo)
{
    int q;
    double r = remquo(x, y, &q);
    *quo = q;
    return r;
}

__attribute__((overloadable, always_inline)) double
remquo(double x, double y, __local int *quo)
{
    int q;
    double r = remquo(x, y, &q);
    *quo = q;
    return r;
}
#endif
