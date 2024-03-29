
#include "math64.h"

__attribute__((overloadable)) double
atanh(double x)
{
    double absx = fabs(x);

    double ret = absx == 1.0 ? as_double(PINFBITPATT_DP64) : as_double(QNANBITPATT_DP64);

    // |x| >= 0.5
    // Note that atanh(x) = 0.5 * ln((1+x)/(1-x))
    // For greater accuracy we use
    // ln((1+x)/(1-x)) = ln(1 + 2x/(1-x)) = log1p(2x/(1-x)).
    double r = 0.5 * log1p(2.0 * absx / (1.0 - absx));
    ret = absx < 1.0 ? r : ret;

    r = -ret;
    ret = x < 0.0 ? r : ret;

    // Arguments up to 0.5 in magnitude are
    // approximated by a [5,5] minimax polynomial
    double t = x * x;

    double pn = fma(t,
                    fma(t,
                        fma(t,
                            fma(t,
                                fma(t, -0.10468158892753136958e-3, 0.28728638600548514553e-1),
                                -0.28180210961780814148e0),
                            0.88468142536501647470e0),
                        -0.11028356797846341457e1),
                    0.47482573589747356373e0);

    double pd = fma(t,
                    fma(t,
                        fma(t,
                            fma(t,
                                fma(t, -0.35861554370169537512e-1, 0.49561196555503101989e0),
                                -0.22608883748988489342e1),
                            0.45414700626084508355e1),
                        -0.41631933639693546274e1),
                    0.14244772076924206909e1);

    r = fma(x*t, pn/pd, x);
    ret = absx < 0.5 ? r : ret;

    return ret;
}

