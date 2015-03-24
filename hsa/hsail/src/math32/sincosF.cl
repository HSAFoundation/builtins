
#include "math32.h"
#include "remainderF_piby2.h"
#include "sincosF_piby4.h"

__attribute__ ((overloadable, always_inline)) float
sincos(float x, float *result_cos)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    // Almost all args should be caught in the first branch
    float r0, r1;
    int regn = argReductionS(&r0, &r1, dx);

    float ss = sinf_piby4_new(r0, r1);
    float cc = cosf_piby4_new(r0, r1);

    int flip = (regn > 1) << 31;
    float s = (regn & 1) != 0 ? cc : ss;
    s = as_float(as_int(s) ^ flip ^ (ax ^ ix));
    ss = -ss;
    float c = (regn & 1) != 0 ? ss : cc;
    c = as_float(as_int(c) ^ flip);

    c = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : c;
    s = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : s;

    *result_cos = c;
    return s;
}

#if __OPENCL_C_VERSION__ < 200
__attribute__ ((overloadable, always_inline)) float
sincos(float x, __local float *result_cos)
{
    float c;
    float s = sincos(x, &c);
    *result_cos = c;
    return s;
}

__attribute__ ((overloadable, always_inline)) float
sincos(float x, __global float *result_cos)
{
    float c;
    float s = sincos(x, &c);
    *result_cos = c;
    return s;
}
#endif
