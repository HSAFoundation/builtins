
#include "math64.h"

double nearbyint(double x)
{
    /* Check for input range */
    ulong checkbits,val_2p52;
    ulong sign;
    checkbits= as_ulong(x);

    sign  =  checkbits & SIGNBIT_DP64;
    val_2p52 = sign  | 0x4330000000000000;

    double temp = (x + as_double(val_2p52)) - as_double(val_2p52);

    /*This extra line is to take care of denormals and various rounding modes*/
    val_2p52 = (as_ulong(temp) & 0x7fffffffffffffff) | sign;
	double res = as_double(val_2p52);


    /* Clear the sign bit and check if the value can be rounded(i.e check if exponent less than 52) */
	res = 	(checkbits  & EXSIGNBIT_DP64) > 0x4330000000000000 ? x : res;
	res = isnan(x) ? as_double(checkbits | 0x0008000000000000) : res;

    return res;


}




