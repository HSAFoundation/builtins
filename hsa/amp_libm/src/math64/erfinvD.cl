#include "math64.h"
#include "erfinv_support.h"

double erfinv(double p)
{
    double retval;
    double
          oneoversqrt2 = 0.7071067811865475244008443621,
          halfsqrtpi = 0.88622692545275801364908374167,
          half = 0.5,
          one  = 1.0;

    double dp = fabs(p);

    // Start with scaled inverse normal approximation
    retval =  oneoversqrt2 * phiinv(half*(dp + one), half*(one - dp));

//  Do two Newton iterations directly on erfinv.

    double de = exp(retval*retval);
    if (dp < half)
    {
        retval = retval - halfsqrtpi*de*(erf(retval) - dp);
        retval = retval - halfsqrtpi*exp(retval*retval)*(erf(retval) - dp);
    }
    else
    {

        retval = retval - halfsqrtpi*de*( (one - dp) - erfc(retval));
        retval= retval - halfsqrtpi*exp(retval*retval)*( (one - dp) - erfc(retval));
        // needed near one
        retval= retval - halfsqrtpi*exp(retval*retval)*( (one - dp) - erfc(retval));
    }

    retval = (dp == p) ? retval : -retval;
    retval = (p ==  one) ? as_double(EXPBITS_DP64) : retval;
    retval = (p ==  0.0) ? 0.0 : retval;
    retval = (p == -one) ? as_double(NINFBITPATT_DP64) : retval;
    retval = (p >   one) ? as_double(QNANBITPATT_DP64) : retval;
    retval = (p <  -one) ? as_double(INDEFBITPATT_DP64) : retval;
    retval = isnan(p) ? p : retval;
    return retval;
}


