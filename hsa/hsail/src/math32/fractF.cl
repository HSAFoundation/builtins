
#include "math32.h"

__attribute__((overloadable, always_inline)) float
fract (float x, float *ip)
{
    *ip = __hsail_floor_f32(x);
    return  __hsail_fraction_f32(x);
}

#if __OPENCL_C_VERSION__ < 200

__attribute__((overloadable, always_inline)) float
fract(float x, __local float *ip)
{
    *ip = __hsail_floor_f32(x);
    return  __hsail_fraction_f32(x);
}

__attribute__((overloadable, always_inline)) float
fract(float x, __global float *ip)
{
    *ip = __hsail_floor_f32(x);
    return  __hsail_fraction_f32(x);
}

#endif

