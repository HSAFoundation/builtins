
#include "math64.h"

__attribute__((overloadable)) double
tanh(double x)
{
    // The definition of tanh(x) is sinh(x)/cosh(x), which is also equivalent
    // to the following three formulae:
    // 1.  (exp(x) - exp(-x))/(exp(x) + exp(-x))
    // 2.  (1 - (2/(exp(2*x) + 1 )))
    // 3.  (exp(2*x) - 1)/(exp(2*x) + 1)
    // but computationally, some formulae are better on some ranges.

    // The point at which e^-x is insignificant compared to e^x = ln(2^27)
    const double large_threshold = 0x1.2b708872320e2p+4;

    ulong ux = as_ulong(x);
    ulong ax = ux & ~SIGNBIT_DP64;
    ulong sx = ux ^ ax;
    double y = as_double(ax);
    double y2 = y * y;

    // y < 0.9
    double znl = fma(y2,
	             fma(y2,
			 fma(y2, -0.142077926378834722618091e-7, -0.200047621071909498730453e-3),
			 -0.176016349003044679402273e-1),
		     -0.274030424656179760118928e0);

    double zdl = fma(y2,
	             fma(y2,
			 fma(y2, 0.2091140262529164482568557e-3, 0.201562166026937652780575e-1),
			 0.381641414288328849317962e0),
		     0.822091273968539282568011e0);

    // 0.9 <= y <= 1
    double znm = fma(y2,
	             fma(y2,
			 fma(y2, -0.115475878996143396378318e-7, -0.165597043903549960486816e-3),
			 -0.146173047288731678404066e-1),
		     -0.227793870659088295252442e0);

    double zdm = fma(y2,
	             fma(y2,
			 fma(y2, 0.173076050126225961768710e-3, 0.167358775461896562588695e-1),
			 0.317204558977294374244770e0),
		     0.683381611977295894959554e0);

    int c = y < 0.9;
    double zn = c ? znl : znm;
    double zd = c ? zdl : zdm;
    double z = y + y*y2 * MATH_DIVIDE(zn, zd);

    // y > 1
    double p = exp(2.0 * y) + 1.0;
    double zg = 1.0 - 2.0 / p;

    z = y > 1.0 ? zg : z;

    // Other cases
    z = y < 0x1.0p-28 | ax > PINFBITPATT_DP64 ? x : z;

    z = y > large_threshold ? 1.0 : z;

    return as_double(sx | as_ulong(z));
}

