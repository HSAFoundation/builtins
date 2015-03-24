
#include "math32.h"

extern __attribute__((always_inline)) int
__hsa_argredhalf_f32(float *r, float x);

extern __attribute__((always_inline)) float
__hsa_half_sincos_piby4(float x, float *cp);

__attribute__((overloadable, always_inline)) float
half_cos(float x)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0;
    int regn = __hsa_argredhalf_f32(&r0, dx);

    float cc;
    float ss = - __hsa_half_sincos_piby4(r0, &cc);
    float c = (regn & 1) != 0 ? ss : cc;
    c = as_float(as_int(c) ^ ((regn > 1) << 31));
    c = ax > 0x47800000 ? 1.0f : c;
    c = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : c;
    return c;
}
