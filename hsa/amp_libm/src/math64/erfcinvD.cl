

#include "math64.h"
#include "erfinv_support.h"


double erfcinv(double p)
{
    double retval;
    double oneoversqrt2 = 0.7071067811865475244008443621;
    double halfsqrtpi = 0.88622692545275801364908374167;
    double logtwooverpi = -0.45158270528945486472619522989488;

    if (p >= 3.e-13)
    {
        double dp = p > 1.0 ? 2.0 - p : p;
        retval =  oneoversqrt2 * phiinv((1.0 - .5*dp), .5*dp);
        if (fabs(dp) < .5)
        {
            retval += halfsqrtpi*exp(retval*retval)*(erfc(retval) - dp);
            retval += halfsqrtpi*exp(retval*retval)*(erfc(retval) - dp);
        }
        else
        {
            retval += halfsqrtpi*exp(retval*retval)*((1.0 - dp) - erf(retval));
            retval += halfsqrtpi*exp(retval*retval)*((1.0 - dp) - erf(retval));
        }
        retval = (p > 1.0) ? -retval : retval;
        retval = (p == 2.0) ? as_double(NINFBITPATT_DP64) : retval;
    } else if (p != 0.0) {
        double disc = logtwooverpi - 2.0*log(p);
        double loghalfsqrtpi = log(halfsqrtpi);
        retval = oneoversqrt2*sqrt(disc - log(disc));
        double loginc = retval*retval + loghalfsqrtpi + log(erfc(retval) - p);
        retval += exp(loginc);

        loginc = retval*retval + loghalfsqrtpi + log(erfc(retval) - p);
        retval += exp(loginc);
        loginc = retval*retval + loghalfsqrtpi + log(erfc(retval) - p);
        retval += isfinite(loginc) ? exp(loginc) : 0.0;
    } else {
        retval =  isnan(p) ? p : as_double(EXPBITS_DP64);
    }
    return retval;
}