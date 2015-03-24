
#include "math32.h"

extern __attribute__((always_inline)) int
__hsa_argredhalf_f32(float *r, float x);

// Evaluate single precisions in and cos of value in interval [-pi/4, pi/4]

__attribute__((always_inline)) float
__hsa_half_sincos_piby4(float x, float *cp)
{
    float ax = fabs(x);
    *cp = native_cos(x);
    float s = native_sin(x);
    return ax < 0x1.0p-50f ? x : s;
}

// Calculate half_sin and half_cos at once

__attribute__((always_inline)) float
__hsa_half_sincos(float x, float *cp)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0;
    int regn = __hsa_argredhalf_f32(&r0, dx);

    float r1 = fabs(r0);
    float cc = native_cos(r0);
    float ss = native_sin(r0);
    ss = (r1 < 0x1.0p-50f) ? r0 : ss;

    bool reg0 = (regn & 1) != 0;
    float c = reg0 ? -ss : cc;
    float s = reg0 ? cc : ss;
    int xsign = ((regn > 1) << 31);
    c = as_float(as_int(c) ^ xsign);
    s = as_float(as_int(s) ^ xsign);
    bool is_huge = ax > 0x47800000;
    c = is_huge ? 1.0f : c;
    s = is_huge ? 1.0f : s;
    s = as_float(as_int(s) ^ (ix ^ ax));
    s = x == 0.0f ? x : s;
    bool is_inf = ax >= PINFBITPATT_SP32;
    c = is_inf ? as_float(QNANBITPATT_SP32) : c;
    s = is_inf ? as_float(QNANBITPATT_SP32) : s;
    *cp = c;
    return s;
}
