
#include "math64.h"

__attribute__((overloadable, always_inline)) double
fract(double x, double *ip)
{
    *ip = __hsail_floor_f64(x);
    return  __hsail_fraction_f64(x);
}

#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline)) double
fract(double x, __local double *ip)
{
    *ip = __hsail_floor_f64(x);
    return  __hsail_fraction_f64(x);
}

__attribute__((overloadable, always_inline)) double
fract(double x, __global double *ip)
{
    *ip = __hsail_floor_f64(x);
    return  __hsail_fraction_f64(x);
}
#endif

