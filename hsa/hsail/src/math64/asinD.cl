
#include "math64.h"

__attribute__((overloadable)) double
asin(double x)
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

    const double piby2_tail = 6.1232339957367660e-17;  /* 0x3c91a62633145c07 */
    const double hpiby2_head = 7.8539816339744831e-01; /* 0x3fe921fb54442d18 */
    const double piby2 = 1.5707963267948965e+00;       /* 0x3ff921fb54442d18 */

    double y = fabs(x);
    int xneg = as_int2(x).hi < 0;
    int xexp = (as_int2(y).hi >> 20) - EXPBIAS_DP64;

    // abs(x) >= 0.5
    int transform = xexp >= -1;

    double rt = 0.5 * (1.0 - y);
    double y2 = y * y;
    double r = transform ? rt : y2;

    // Use a rational approximation for [0.0, 0.5]

    double un = fma(r,
                    fma(r,
                        fma(r,
                            fma(r,
                                fma(r, 0.0000482901920344786991880522822991,
                                       0.00109242697235074662306043804220),
                                -0.0549989809235685841612020091328),
                            0.275558175256937652532686256258),
                        -0.445017216867635649900123110649),
                    0.227485835556935010735943483075);

    double ud = fma(r,
                    fma(r,
                        fma(r,
                            fma(r, 0.105869422087204370341222318533,
                                   -0.943639137032492685763471240072),
                            2.76568859157270989520376345954),
                        -3.28431505720958658909889444194),
                    1.36491501334161032038194214209);

    double u = r * MATH_DIVIDE(un, ud);

    // Reconstruct asin carefully in transformed region
    double s = sqrt(r);
    double sh = as_double(as_ulong(s) & 0xffffffff00000000UL);
    double c = MATH_DIVIDE(fma(-sh, sh, r), s + sh);
    double p = fma(2.0*s, u, -fma(-2.0, c, piby2_tail));
    double q = fma(-2.0, sh, hpiby2_head);
    double vt = hpiby2_head - (p - q);
    double v = fma(y, u, y);
    v = transform ? vt : v;

    v = xexp < -28 ? y : v;
    v = xexp >= 0 ? as_double(QNANBITPATT_DP64) : v;
    v = y == 1.0 ? piby2 : v;

    return xneg ? -v : v;
}

