#include "math32.h"
#include "erfinvf_support.h"



float erfinvf(float x)
{
    float retval;
    float oneoversqrt2 = 0.7071067811865475244008443621;
    float halfsqrtpi = 0.88622692545275801364908374167;

    float p = fabs(x);

   if (x*halfsqrtpi == 0.)
    {  //Subnormal
 		double dhalfsqrtpi = 0.88622692545275801364908374167;
        double dx = float_uint_to_double(as_uint(x));
        retval = as_float(double_to_float_uint(dx*dhalfsqrtpi));
    }
    else
    {
		retval =  oneoversqrt2 * phiinvf(.5*(p + 1.), .5*(1. - p));

	//  Do Newton iterations directly on erfinv.
		float ftemp = exp(retval*retval);

	   if (p < .5)
	   {
			retval = retval - halfsqrtpi*ftemp*(erf(retval) - p);
			retval = retval - halfsqrtpi*exp(retval*retval)*(erf(retval) - p);
			retval = retval - halfsqrtpi*exp(retval*retval)*(erf(retval) - p);
		}
		else
		{
			retval = retval - halfsqrtpi*ftemp*( (1. - p) - erfc(retval));
			retval = retval - halfsqrtpi*exp(retval*retval)*( (1. - p) - erfc(retval));
			retval = retval - halfsqrtpi*exp(retval*retval)*( (1. - p) - erfc(retval));
		}
		// Unfortunately, the following case returns NaN if we don't do this
		retval = (p == as_float(0x3f7fffffu)) ? 3.8325068569007108 : retval;
		retval = (p ==  1.0) ? as_float(EXPBITS_SP32) : retval;
		retval = (p  >  1.0) ? as_float(QNANBITPATT_SP32) : retval;
		retval = (x < 0.) ? -retval : retval;
		retval = isnan(p) ? p : retval;

	}

    return retval;
}



