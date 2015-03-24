
#include "math32.h"

__attribute__((overloadable, always_inline)) float
modf(float x, float *iptr)
{
    int ux = as_int(x);
    int e = ((ux >> 23) & 0xff) - 127;
    int s = ux & 0x80000000;
    int msk = 0xffffffff << (23 - e);
    int i = msk & ux;
    int r = as_uint(x - as_float(i)) | s;

    r = e < 0 ? ux : r;
    i = e < 0 ? s : i;

    r = e >= 23 ? s : r;
    i = e >= 23 ? ux : i;

    r = (ux & 0x7fffffff) > 0x7f800000 ? ux : r;

    *iptr = as_float(i);
    return as_float(r);
}


#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline)) float
modf(float x, __global float *iptr)
{
    float i;
    float f = modf(x, &i);
    *iptr = i;
    return f;
}

__attribute__((overloadable, always_inline)) float
modf(float x, __local float *iptr)
{
    float i;
    float f = modf(x, &i);
    *iptr = i;
    return f;
}
#endif

