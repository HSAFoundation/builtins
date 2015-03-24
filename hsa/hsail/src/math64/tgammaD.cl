
#include "math64.h"

__attribute__((overloadable)) double
tgamma(double x)
{
    const double pi = 3.1415926535897932384626433832795;
    double ax = fabs(x);
    double lg = lgamma(ax);
    double g = exp(lg);

    if (x < 0.0)
    {
		double z = sinpi(x);
		g = g * ax * z;
        g = pi / g;
        g = g == 0 ? as_double(PINFBITPATT_DP64) : g;
        g = z == 0 ? as_double(QNANBITPATT_DP64) : g;
	}

    return g;
}

