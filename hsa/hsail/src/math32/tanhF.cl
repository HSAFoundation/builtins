
#include "math32.h"

__attribute__((overloadable)) float
tanh(float x)
{
    // The definition of tanh(x) is sinh(x)/cosh(x), which is also equivalent
    // to the following three formulae:
    // 1.  (exp(x) - exp(-x))/(exp(x) + exp(-x))
    // 2.  (1 - (2/(exp(2*x) + 1 )))
    // 3.  (exp(2*x) - 1)/(exp(2*x) + 1)
    // but computationally, some formulae are better on some ranges.

    const float large_threshold = 0x1.0a2b24p+3f;

    uint ux = as_uint(x);
    uint aux = ux & EXSIGNBIT_SP32;
    uint xs = ux ^ aux;

    float y = as_float(aux);
    float y2 = y*y;

    float a1 = mad(y2,
                   mad(y2, 0.4891631088530669873e-4F, -0.14628356048797849e-2F),
                   -0.28192806108402678e0F);
    float b1 = mad(y2, 0.3427017942262751343e0F, 0.845784192581041099e0F);

    float a2 = mad(y2,
                   mad(y2, 0.3827534993599483396e-4F, -0.12325644183611929e-2F),
                   -0.24069858695196524e0F);
    float b2 = mad(y2, 0.292529068698052819e0F, 0.72209738473684982e0F);

    int c = y < 0.9f;
    float a = c ? a1 : a2;
    float b = c ? b1 : b2;
    float zlo = mad(MATH_DIVIDE(a, b), y*y2, y);

    float p = exp(2.0f * y) + 1.0f;
    float zhi = 1.0F - MATH_DIVIDE(2.0F, p);

    float z = y <= 1.0f ? zlo : zhi;
    z = as_float(xs | as_uint(z));

    // Edge cases
    float sone = as_float(0x3f800000U | xs);
    z = y > large_threshold ? sone : z;
    z = aux < 0x39000000 | aux > 0x7f800000 ? x : z;

    return z;
}

