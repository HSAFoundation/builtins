
#include "math32.h"

extern __attribute__((always_inline)) int
__hsa_argredhalf_f32(float *r, float x);

extern __attribute__((always_inline)) float
__hsa_half_sincos_piby4(float x, float *cp);

__attribute__((overloadable)) float
half_sin(float x)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;

    float dx = as_float(ax);

    float r0;
    int regn = __hsa_argredhalf_f32(&r0, dx);

    float cc;
    float ss = __hsa_half_sincos_piby4(r0, &cc);

    float s = (regn & 1) != 0 ? cc : ss;
    s = as_float(as_int(s) ^ ((regn > 1) << 31));

    s = ax > 0x47800000 ? 1.0f : s;
    s = as_float(as_int(s) ^ (ix ^ ax));
    s = x == 0.0f ? x : s;
    s = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : s;
    return s;
}
