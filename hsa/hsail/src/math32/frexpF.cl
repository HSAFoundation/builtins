
#include "math32.h"

__attribute__((overloadable, always_inline, weak)) float
frexp(float x, int *ep)
{
    int i = as_int(x);
    int ai = i & 0x7fffffff;
    int d = ai > 0 & ai < 0x00800000;
    // scale subnormal by 2^26 without multiplying
    float s = as_float(ai | 0x0d800000) - 0x1.0p-100F;
    ai = d ? as_int(s) : ai;
    int e = (ai >> 23) - 126 - (d ? 26 : 0);
    int t = ai == 0 | e == 129;
    i = (i & 0x80000000) | 0x3f000000 | (ai & 0x007fffff);
    *ep = t ? 0 : e;
    return t ? x : as_float(i);
}

#if __OPENCL_C_VERSION__ < 200

__attribute__((overloadable, always_inline, weak)) float
frexp(float x, __local int *ep)
{
    int e;
    float f = frexp(x, &e);
    *ep = e;
    return f;
}

__attribute__((overloadable, always_inline, weak)) float
frexp(float x, __global int *ep)
{
    int e;
    float f = frexp(x, &e);
    *ep = e;
    return f;
}
#endif

__attribute__((overloadable, always_inline, weak)) float4
frexp(float4 x, int4 *ep)
{
    int4 i = as_int4(x);
    int4 ai = i & 0x7fffffff;
    int4 d = ai > 0 & ai < 0x00800000;
    float4 s = as_float4(ai | 0x0d800000) - 0x1.0p-100F;
    ai = bitselect(ai, as_int4(s), d);
    int4 e = (ai >> 23) - 126 - bitselect((int4)0, (int4)26, d);
    int4 t = ai == (int4)0 | e == (int4)129;
    i = (i & (int4)0x80000000) | (int4)0x3f000000 | (ai & 0x007fffff);
    *ep = bitselect(e, (int4)0, t);
    return bitselect(as_float4(i), x, as_float4(t));
}


#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline, weak)) float4
frexp(float4 x, __global int4 *ep)
{
    int4 e;
    float4 ret = frexp(x, &e);
    *ep = e;
    return ret;
}

__attribute__((overloadable, always_inline, weak)) float4
frexp(float4 x, __local int4 *ep)
{
    int4 e;
    float4 ret = frexp(x, &e);
    *ep = e;
    return ret;
}
#endif
