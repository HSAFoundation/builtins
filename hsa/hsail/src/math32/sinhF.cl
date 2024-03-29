
#include "math32.h"

__attribute__((overloadable)) float
sinh(float x)
{
    // After dealing with special cases the computation is split into regions as follows.
    // abs(x) >= max_sinh_arg:
    // sinh(x) = sign(x)*Inf
    // abs(x) >= small_threshold:
    // sinh(x) = sign(x)*exp(abs(x))/2 computed using the splitexp and scaleDouble functions as for exp_amd().
    // abs(x) < small_threshold:
    // compute p = exp(y) - 1 and then z = 0.5*(p+(p/(p+1.0)))
    // sinh(x) is then sign(x)*z.

    // Tabulated values of sinh(i) and cosh(i) for i = 0,...,36.
    USE_TABLE(float2, p_tbl, SINHCOSH_TBL);

    const float max_sinh_arg = 0x1.65a9fap+6f;
    const float small_threshold = 0x1.0a2b24p+3f;

    uint ux = as_uint(x);
    uint aux = ux & EXSIGNBIT_SP32;
    uint xs = ux ^ aux;
    float y = as_float(aux);

    // We find the integer part y0 of y and the increment dy = y - y0. We then compute
    // z = sinh(y) = sinh(y0)cosh(dy) + cosh(y0)sinh(dy)
    // where sinh(y0) and cosh(y0) are tabulated above.
    int ind = (int) y;
    ind = (uint)ind > 36U ? 0 : ind;

    float dy = y - ind;
    float dy2 = dy * dy;

    float sdy = mad(dy2,
                    mad(dy2,
                        mad(dy2,
                            mad(dy2,
                                mad(dy2,
                                    mad(dy2, 0.7746188980094184251527126e-12f, 0.160576793121939886190847e-9f),
                                    0.250521176994133472333666e-7f),
                                0.275573191913636406057211e-5f),
                            0.198412698413242405162014e-3f),
                         0.833333333333329931873097e-2f),
                    0.166666666666666667013899e0f);
    sdy = mad(sdy, dy*dy2, dy);

    float cdy = mad(dy2,
                    mad(dy2,
                        mad(dy2,
                            mad(dy2,
                                mad(dy2,
                                    mad(dy2, 0.1163921388172173692062032e-10f, 0.208744349831471353536305e-8f),
                                    0.275573350756016588011357e-6f),
                                0.248015872460622433115785e-4f),
                            0.138888888889814854814536e-2f),
                        0.416666666666660876512776e-1f),
                    0.500000000000000005911074e0f);
    cdy = mad(cdy, dy2, 1.0f);

    float2 tv = p_tbl[ind];
    float z = mad(tv.s1, sdy, tv.s0 * cdy);
    z = as_float(xs | as_uint(z));

    // When y is large enough so that the negative exponential is negligible,
    // so sinh(y) is approximated by sign(x)*exp(y)/2.
    float t = exp(y - 0x1.62e500p-1f);
    float zsmall = mad(0x1.a0210ep-18f, t, t);
    zsmall = as_float(xs | as_uint(zsmall));
    z = y >= small_threshold ? zsmall : z;

    // Corner cases
    float zinf = as_float(PINFBITPATT_SP32 | xs);
    z = y >= max_sinh_arg ? zinf : z;
    z = aux > PINFBITPATT_SP32 | aux < 0x38800000U ? x : z;

    return z;
}

