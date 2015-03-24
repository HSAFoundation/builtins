// This refinement currently isn't dealing with subnormals
static inline float refine_phiinvf(float p,float x)
{
    float oneoversqrt2 = 0.70710678118654752440;
    float sqrt2pi      = 2.506628274631000502415765;
    float e;
    if (p < .5)
    {
        e = 0.5 * erfc(-x*oneoversqrt2) - p;
    }
    else
    {
        e = 0.5 * (1. - erf(-x*oneoversqrt2)) - p;
    }
    float u = e * sqrt2pi * exp(.5*x*x);
      x -= u; // Newton
//    x -= u/(1. + .5*x*u); // Halley, as in Acklam's work
    return x;
}

// pprime is 1. - p.  Sometimes caller knows it more accurately
static inline float phiinvf(float p, float pprime)
{
    // Probably could use fewer terms for s.p., but good coefficients
    // seem unreasonably hard to come by
    float a1 = -3.969683028665376e+01;
    float a2 =  2.209460984245205e+02;
    float a3 = -2.759285104469687e+02;
    float a4 =  1.383577518672690e+02;
    float a5 = -3.066479806614716e+01;
    float a6 =  2.506628277459239e+00;

    float b1 = -5.447609879822406e+01;
    float b2 =  1.615858368580409e+02;
    float b3 = -1.556989798598866e+02;
    float b4 =  6.680131188771972e+01;
    float b5 = -1.328068155288572e+01;

    float c1 = -7.784894002430293e-03;
    float c2 = -3.223964580411365e-01;
    float c3 = -2.400758277161838e+00;
    float c4 = -2.549732539343734e+00;
    float c5 =  4.374664141464968e+00;
    float c6 =  2.938163982698783e+00;

    float d1 =  7.784695709041462e-03;
    float d2 =  3.224671290700398e-01;
    float d3 =  2.445134137142996e+00;
    float d4 =  3.754408661907416e+00;

    float q, r, x;
   if (p < .02425)
   {
      q = sqrt(-2.*log(p));

      x = fma(fma(fma(fma(fma(c1,q,c2),q,c3),q,c4),q,c5),q,c6) /
            fma(fma(fma(fma(d1,q,d2),q,d3),q,d4),q,1.0f);
    }
    else if (p < .97575)
    {
      q = p - 0.5;
      r = q*q;
      x = fma(fma(fma(fma(fma(a1,r,a2),r,a3),r,a4),r,a5),r,a6)*q /
           fma(fma(fma(fma(fma(b1,r,b2),r,b3),r,b4),r,b5),r,1.0f);
    }
    else
    {
      q = sqrt(-2.*log(pprime));
      x = -fma(fma(fma(fma(fma(c1,q,c2),q,c3),q,c4),q,c5),q,c6) /
             fma(fma(fma(fma(d1,q,d2),q,d3),q,d4),q,1.0f);
    }
    // If you want to use this function for something other than
    // feeding erfinv, you may want to do more than one refinement step,
    // especially since I'm doing Newton, not Halley.
    if (p > 1.e-15)
    {
        x = refine_phiinvf(p,x);
    }
    return x;
}


static inline  double float_uint_to_double(uint x)
{
    double d;
    float f = as_float(x);

	// Fix up subnormal, if necessary
	uint fmant = x & 0x007fffff;
	float temp = as_float(fmant | 0x3f800000);
	temp -= 1.0;
	d = (float)temp;
	ulong ld = as_ulong(d);
	ld -= 0x07e0000000000000;
	d = as_double(ld);
	d = fmant ? d : 0.0;
	d = x & 0x80000000 ? -d : d;
	d = (f != 0.0) ? (double)f : d;

	return d;

}

static inline uint double_to_float_uint(double d)
{
	uint dlow, dhigh, dsign;
	float f = (float)d;
	uint uf;

	double dabs = (d < 0.) ? -d : d;

	// Fix up subnormal
	ulong ld;
	ld = as_ulong(d);
	dlow = ld;
	dhigh = ld >> 32;
	dsign = dhigh & 0x80000000;

	int dexp = (dhigh >> 20) & 0x7ff;
	int shiftcount = 0x381 - dexp;
	dhigh &= 0x000fffff;
	dhigh |= 0x00100000;
	dhigh = (dhigh << 3) | (dlow >> 29);
	dlow <<= 3;
	uint extrabits = dlow << (32 - shiftcount);
	dlow = (dlow >> shiftcount) | (dhigh << (32 - shiftcount));
	dhigh >>= shiftcount;
	dhigh = ((dlow > 0x80000000u) ||
	((dlow == 0x80000000u) && ((dhigh & 1) | extrabits))) ?
	   dhigh + 1 : dhigh;
	uf = dhigh | dsign;
	uf =  dabs >= 7.0064923216240869000000e-046 ? uf : 0;


	uf = f != 0. ? as_uint(f) : uf;
    return uf;
}