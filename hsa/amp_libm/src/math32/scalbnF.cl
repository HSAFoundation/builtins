#include "math32.h"


float scalbnf(float x, int n)
{
	/* supports denormal values */
	const int multiplier = 24;
	float val_f;
	uint val_ui;
	uint sign;
	int exponent;
	val_ui = as_uint(x);
	sign = val_ui & 0x80000000;
	val_ui = val_ui & 0x7fffffff;/* remove the sign bit */
	int val_x = val_ui;

	exponent = val_ui >> 23; /* get the exponent */
	int dexp = exponent;


	/* denormal support */
	int fbh = 127 - (as_uint((float)(as_float(val_ui | 0x3f800000) - 1.0)) >> 23);
	int dexponent = 25 - fbh;
	uint dval_ui = (( (val_ui << fbh) & 0x007fffff) | (dexponent << 23));
	int ex = dexponent + n - multiplier;
	dexponent = ex;
	uint val = sign | (ex << 23) | (dval_ui & 0x007fffff);
	int ex1 = dexponent + multiplier;
	ex1 = -ex1 +25;
	dval_ui = (((dval_ui & 0x007fffff )| 0x800000) >> ex1);
	dval_ui = dexponent > 0 ? val :dval_ui;
	dval_ui = dexponent > 254 ? 0x7f800000 :dval_ui;  /*overflow*/
	dval_ui = dexponent < -multiplier ? 0 : dval_ui;  /*underflow*/
	dval_ui = dval_ui | sign;
	val_f = as_float(dval_ui);

	exponent += n;

	val = sign | (exponent << 23) | (val_ui & 0x007fffff);
	ex1 = exponent + multiplier;
	ex1 = -ex1 +25;
	val_ui = (((val_ui & 0x007fffff )| 0x800000) >> ex1);
	val_ui = exponent > 0 ? val :val_ui;
	val_ui = exponent > 254 ? 0x7f800000 :val_ui;  /*overflow*/
	val_ui = exponent < -multiplier ? 0 : val_ui;  /*underflow*/
	val_ui = val_ui | sign;

	val_ui = dexp == 0? dval_ui : val_ui;
	val_f = as_float(val_ui);


	val_f = isnan(x) | isinf(x) | val_x == 0 ? x : val_f;
	return val_f;
}


