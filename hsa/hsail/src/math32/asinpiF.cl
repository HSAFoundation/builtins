
#include "math32.h"

__attribute__((overloadable)) float
asinpi(float x)
{
    // Computes arcsin(x).
    // The argument is first reduced by noting that arcsin(x)
    // is invalid for abs(x) > 1 and arcsin(-x) = -arcsin(x).
    // For denormal and small arguments arcsin(x) = x to machine
    // accuracy. Remaining argument ranges are handled as follows.
    // For abs(x) <= 0.5 use
    // arcsin(x) = x + x^3*R(x^2)
    // where R(x^2) is a rational minimax approximation to
    // (arcsin(x) - x)/x^3.
    // For abs(x) > 0.5 exploit the identity:
    // arcsin(x) = pi/2 - 2*arcsin(sqrt(1-x)/2)
    // together with the above rational approximation, and
    // reconstruct the terms carefully.


    const float pi = 3.1415926535897933e+00f;
    const float piby2_tail = 7.5497894159e-08F;   /* 0x33a22168 */
    const float hpiby2_head = 7.8539812565e-01F;  /* 0x3f490fda */

    uint ux = as_uint(x);
    uint aux = ux & EXSIGNBIT_SP32;
    uint xs = ux ^ aux;
    float shalf = as_float(xs | as_uint(0.5f));

    int xexp = (int)(aux >> EXPSHIFTBITS_SP32) - EXPBIAS_SP32;

    float y = as_float(aux);

    // abs(x) >= 0.5
    int transform = xexp >= -1;

    float y2 = y * y;
    float rt = 0.5f * (1.0f - y);
    float r = transform ? rt : y2;

    // Use a rational approximation for [0.0, 0.5]
    float a = mad(r,
                  mad(r,
                      mad(r, -0.00396137437848476485201154797087F, -0.0133819288943925804214011424456F),
                      -0.0565298683201845211985026327361F),
                  0.184161606965100694821398249421F);
    float b = mad(r, -0.836411276854206731913362287293F, 1.10496961524520294485512696706F);
    float u = r * MATH_DIVIDE(a, b);

    float s = MATH_SQRT(r);
    float s1 = as_float(as_uint(s) & 0xffff0000);
    float c = MATH_DIVIDE(mad(-s1, s1, r), s + s1);
    float p = mad(2.0f*s, u, -mad(c, -2.0f, piby2_tail));
    float q = mad(s1, -2.0f, hpiby2_head);
    float vt = hpiby2_head - (p - q);
    float v = mad(y, u, y);
    v = transform ? vt : v;
    v = MATH_DIVIDE(v, pi);
    float xbypi = MATH_DIVIDE(x, pi);

    float ret = as_float(xs | as_uint(v));
    ret = aux > 0x3f800000U ? as_float(QNANBITPATT_SP32) : ret;
    ret = aux == 0x3f800000U ? shalf : ret;
    ret = xexp < -14 ? xbypi : ret;

    return ret;
}

