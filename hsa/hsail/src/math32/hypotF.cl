
#include "math32.h"
#if !defined(SUBNORMALS_SUPPORTED)
#include "floattointconversion.h"
#endif //SUBNORMALS_SUPPORTED

// Returns sqrt(x*x + y*y) with no overflow or underflow unless the result warrants it




__attribute__((overloadable, always_inline)) float
hypot(float x, float y)
{
    uint ux = as_uint(x);
    uint aux = ux & EXSIGNBIT_SP32;
    uint uy = as_uint(y);
    uint auy = uy & EXSIGNBIT_SP32;
	float retval;
    int c = aux > auy;
    ux = c ? aux : auy;
    uy = c ? auy : aux;

#if !defined(SUBNORMALS_SUPPORTED)
	if( as_float(uy) > 0.0 && ux < 0x7effffff)
	{
#endif	//SUBNORMALS_SUPPORTED
		int xexp = clamp((int)(ux >> EXPSHIFTBITS_SP32) - EXPBIAS_SP32, -126, 126);
		float fx_exp = as_float((xexp + EXPBIAS_SP32) << EXPSHIFTBITS_SP32);
		float fi_exp = as_float((-xexp + EXPBIAS_SP32) << EXPSHIFTBITS_SP32);
		float fx = as_float(ux) * fi_exp;
		float fy = as_float(uy) * fi_exp;
		retval = MATH_SQRT(mad(fx, fx, fy*fy)) * fx_exp;
#if !defined(SUBNORMALS_SUPPORTED)
	}
	else
	{
		double dy = float_uint_to_double(as_uint(y));
		double dx = float_uint_to_double(as_uint(x));
		double dretval = sqrt(dx*dx + dy*dy);
		retval = as_float(double_to_float_uint(dretval));
	}
#endif //SUBNORMALS_SUPPORTED

    retval = ux > PINFBITPATT_SP32 | uy == 0 ? as_float(ux) : retval;
    retval = ux == PINFBITPATT_SP32 | uy == PINFBITPATT_SP32 ? as_float(PINFBITPATT_SP32) : retval;
    return retval;
}
