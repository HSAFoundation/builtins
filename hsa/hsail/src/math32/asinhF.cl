
#include "math32.h"

__attribute__((overloadable)) float
asinh(float x)
{
    uint ux = as_uint(x);
    uint ax = ux & EXSIGNBIT_SP32;
    uint xsgn = ax ^ ux;

    // |x| <= 2
    float t = x * x;
    float a = mad(t,
                  mad(t,
		      mad(t,
		          mad(t, -1.177198915954942694e-4f, -4.162727710583425360e-2f),
		          -5.063201055468483248e-1f),
		      -1.480204186473758321f),
	          -1.152965835871758072f);
    float b = mad(t,
	          mad(t,
		      mad(t,
			  mad(t, 6.284381367285534560e-2f, 1.260024978680227945f),
			  6.582362487198468066f),
		      11.99423176003939087f),
		  6.917795026025976739f);

    float q = MATH_DIVIDE(a, b);
    float z1 = mad(x*t, q, x);

    // |x| > 2

    // Arguments greater than 1/sqrt(epsilon) in magnitude are
    // approximated by asinh(x) = ln(2) + ln(abs(x)), with sign of x
    // Arguments such that 4.0 <= abs(x) <= 1/sqrt(epsilon) are
    // approximated by asinhf(x) = ln(abs(x) + sqrt(x*x+1))
    // with the sign of x (see Abramowitz and Stegun 4.6.20)

    float absx = as_float(ax);
    int hi = ax > 0x46000000U;
    float y = MATH_SQRT(absx * absx + 1.0f) + absx;
    y = hi ? absx : y;
    float r = log(y) + (hi ? 0x1.62e430p-1f : 0.0f);
    float z2 = as_float(xsgn | as_uint(r));

    float z = ax <= 0x40000000 ? z1 : z2;
    z = ax < 0x39800000U | ax >= PINFBITPATT_SP32 ? x : z;

    return z;
}

