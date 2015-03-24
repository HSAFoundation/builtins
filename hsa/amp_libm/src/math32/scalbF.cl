#include "math32.h"


#define MULTIPLIER_SP 24


float scalbf(float x, float exp)
{
	const float VAL_2PMULTIPLIER_SP =  16777216.0F;
	const float VAL_2PMMULTIPLIER_SP = 5.9604645e-8F;

    uint sign;
    int exponent;
	int n = (int) exp;
    uint ax = as_uint(x);
    uint ux = ax & 0x7fffffff; /* remove the sign bit */
    sign = ax & 0x80000000;

    exponent = ux >> 23; /* get the exponent */

	int expzero = exponent == 0;

		float f1 = as_float(ux) * VAL_2PMULTIPLIER_SP;/*multiply by 2^24 to bring it to the normal range*/
		int exponent2 = (as_uint(f1) >> 23); /* get the exponent */
		exponent2 = exponent2 + n - MULTIPLIER_SP;

		int exponent1 =  exponent2 + MULTIPLIER_SP;
		uint z = sign | (exponent1 << 23) | (as_uint(f1) & 0x007fffff);

		f1 = as_float(z) * VAL_2PMMULTIPLIER_SP;
		f1 = exponent2 < -MULTIPLIER_SP ? as_float(sign) :f1; /*underflow*/
		f1 = exponent2 > 254 ? as_float(sign | 0x7f800000) : f1; /*overflow*/


    exponent += n;

	int exponent3 = exponent + MULTIPLIER_SP;
	uint z2 = sign | (exponent3 << 23) | (ux & 0x007fffff);
	float f2 =  (as_float(z2) * VAL_2PMMULTIPLIER_SP);

    float res  = as_float (sign | (exponent << 23) | (ux & 0x007fffff));/*x is normal and output is normal*/


	res = exponent > 254 ? as_float(sign | 0x7f800000):res;
	res = exponent < 1 ? f2 :res;
	res = exponent < -MULTIPLIER_SP ? as_float(sign) : res;
	res = expzero ? f1 : res;


    res = isnan(x) || isnan(exp) ? as_float(ax |0x00400000) : res;
    res = isinf(x)? x : res;
    res = ((ux == 0x00000000) || (n==0)) ? x : res;

    return res;
}


