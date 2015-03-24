#include "math64.h"


#define MULTIPLIER_DP 53


double  scalb (double x, double exp)
{
	const double VAL_2PMULTIPLIER_DP =  9007199254740992.0;
	const double VAL_2PMMULTIPLIER_DP = 1.1102230246251565404236316680908e-16;

    int exponent;
	int n =(int) clamp(exp, -2101.0, 2101.0);
	ulong ax = as_ulong(x);
    ulong sign = ax & 0x8000000000000000;
    ulong ux = ax & 0x7fffffffffffffff ; /* remove the sign bit */

    exponent = (int)(ux >> 52); /* get the exponent */

	int expzero = (exponent == 0);
	double y = as_double(ux) * VAL_2PMULTIPLIER_DP;/*multiply by 2^53 to bring it to the normal range*/

	int exponent1 = (int)(as_ulong(y) >> 52); /* get the exponent */
	exponent1 = exponent1 + n - MULTIPLIER_DP;


	int exponent2 = exponent1 + MULTIPLIER_DP;
	ulong z = sign | ((ulong)exponent2 << 52) | (as_ulong(y) & 0x000fffffffffffff);

	double res1 = as_double(z) * VAL_2PMMULTIPLIER_DP;
	res1 = (exponent1 < -MULTIPLIER_DP) ? as_double(sign): res1;
	res1 = (exponent1 > 2046) ?  as_double(sign | 0x7ff0000000000000): res1;

	exponent += n;

	int exponent3 = exponent + MULTIPLIER_DP;
	ulong z1 = sign | ((ulong)exponent3 << 52) | (ux & 0x000fffffffffffff);
	double y1 = as_double(z1) * VAL_2PMMULTIPLIER_DP;

    double res = as_double(sign | ((ulong)exponent << 52) | (ux & 0x000fffffffffffff));


    res = (exponent > 2046) ?  as_double(sign | 0x7ff0000000000000) : res;
	res =  exponent < 1 ? y1 : res ; /*x is normal but output is debnormal*/
	res =  exponent < -MULTIPLIER_DP ? as_double(sign) : res;  /*underflow*/
	res =  expzero ? res1 : res;



	res = isnan(x) || isnan(exp)? as_double(ax|0x0008000000000000) : res;
	res = isinf(x) ? x : res;
	res = (ux == 0x0000000000000000) || (n==0) ? x : res;


    return res;
}

