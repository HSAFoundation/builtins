
#include "math32.h"
#include "erfinvf_support.h"


float erfcinvf(float p)
{
    float retval, loginc, disc;
    const float
                         oneoversqrt2  = 0.7071067811865475244008443621,
                         halfsqrtpi    = 0.88622692545275801364908374167,
                         loghalfsqrtpi = -0.12078223763524522234551844578165,
                         logtwooverpi  = -0.45158270528945486472619522989488,
                         threshold_1   = 1.e-35,
                         threshold_2   = 1.14e-6,
                         half          = .5;
    const  double

                         dlogtwooverpi = -0.45158270528945486472619522989488,
                         dloghalfsqrtpi = -0.12078223763524522234551844578165;

     if (p < threshold_1)
     { // Smallest normals and subnormals need special care
        double dretval, dloginc;

        double d = float_uint_to_double(as_uint(p));

        double ddisc = dlogtwooverpi - 2.0*log(d);
        dretval = sqrt(.5*(ddisc - log(ddisc)));

        dloginc = dretval*dretval;
        dloginc += log(erfc(dretval) - d);
        dloginc += dloghalfsqrtpi;
        dretval += exp(dloginc);

        retval = (float)dretval;
        retval = (d == 0.0) ?  as_float(EXPBITS_SP32) : retval;
    }
    else
    if (p < threshold_2)
    { // threshold from experimentation
        disc = fma(log(p), -2.0f, logtwooverpi);
        retval = oneoversqrt2*sqrt(disc - log(disc));
        loginc = fma(retval,retval,loghalfsqrtpi) + log(erfc(retval) - p);
        retval += exp(loginc);

        loginc = fma(retval,retval,loghalfsqrtpi) + log(erfc(retval) - p);

        retval += isfinite(loginc) ? exp(loginc) : 0.;
    }
    else
    {
        float fp = (p > 1.0) ? 2.0 - p : p;
        float afp = fabs(fp);
        retval =  oneoversqrt2 * phiinvf((1.0 - half*fp), half*fp);
        float temp = halfsqrtpi *exp(retval*retval);



        if (afp < half)
        {
            retval += temp * (erfc(retval) - fp);
            retval += halfsqrtpi*exp(retval*retval)* (erfc(retval) - fp);
        }
        else if (afp <= 1.)
        {
            retval += temp * ((1.0 - fp) - erf(retval));
        }

        retval = afp == 0.?as_float(EXPBITS_SP32):retval;
		retval = isnan(p) ? as_float(as_uint(p) | 0x00400000u) :retval;
		retval = isinf(p) ? as_float(QNANBITPATT_SP32):retval;
        retval = (p > 1.) ? -retval : retval;

    }
    return retval;
}