
#include "math32.h"

__attribute__((overloadable, always_inline)) float
tgamma(float x)
{
    const float pi = 3.1415926535897932384626433832795f;
    float ax = fabs(x);
    float lg = lgamma(ax);
    float g = exp(lg);

    if (x < 0.0f)
    {
		float z = sinpi(x);
		g = g * ax * z;
        g = pi / g;
        g = g == 0 ? as_float(PINFBITPATT_SP32) : g;
        g = z == 0 ? as_float(QNANBITPATT_SP32) : g;
	}

    return g;
}

