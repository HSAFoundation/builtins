
#include "math32.h"

__attribute__((always_inline)) static float
__FREXPF4(float x, __private int *ep)
{
    int c = __amdil_class_f32(x, PINF|NINF|SNAN|QNAN);
    int e = __amdil_frexp_exp_f32(x);
    float r = __amdil_frexp_mant_f32(x);
    e = c ? 0 : e;
    r = c ? x : r;
    *ep = e;
    return r;
}

__attribute__((overloadable, alias("__FREXPF4"))) float frexp(float, __private int *);

__attribute__((overloadable, always_inline)) float
frexp(float x, __local int *ep)
{
    int e;
    float f = __FREXPF4(x, &e);
    *ep = e;
    return f;
}

__attribute__((overloadable, always_inline)) float
frexp(float x, __global int *ep)
{
    int e;
    float f = __FREXPF4(x, &e);
    *ep = e;
    return f;
}

