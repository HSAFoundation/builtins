
#include "math32.h"

float nearbyintf(float x)
{
    /* Check for input range */
    uint checkbits,sign,val_2p23;
    checkbits= as_uint(x);

    sign =  checkbits & SIGNBIT_SP32;
    val_2p23 = sign | 0x4B000000;
    float temp = (x + as_float(val_2p23)) - as_float(val_2p23);
    /*This extra line is to take care of denormals and various rounding modes*/
    val_2p23 = (as_uint(temp) & 0x7fffffff) | sign;

	float res = as_float(val_2p23);
    /* Clear the sign bit and check if the value can be rounded(i.e check if exponent less than 23) */
	res = 	(checkbits & EXSIGNBIT_SP32) > 0x4B000000 ? x : res;
	res = isnan(x) ? as_float(checkbits |0x00400000) : res;

    return res;
}


