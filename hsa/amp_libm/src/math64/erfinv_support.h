static inline double refine_phiinv(double p, double x)
{
   const double  oneoversqrt2 = 0.70710678118654752440,
                                sqrt2pi      = 2.506628274631000502415765,
                                one          = 1.0,
                                half         = 0.5;
   double e;
   if (p < half)
   {
        e = half * erfc(-x*oneoversqrt2) - p;
    }
    else
    {
        e = half * (one - erf(-x*oneoversqrt2)) - p;
    }
    double u;

    if (fabs(x) < 37.65)
    {
        u = e * sqrt2pi * exp(half*x*x);
    }
    else
    {
        double ex = exp(.25*x*x);
        u = (e*sqrt2pi*ex)*ex;
    }
    x -= u; // Newton
//    x -= div(u,(one + half*x*u)); // Halley, as in Acklam's work
    return x;
}


static inline double phiinv(double p,double pprime)
{
   const  double a1 = -3.969683028665376e+01,
                                a2 =  2.209460984245205e+02,
                                a3 = -2.759285104469687e+02,
                                a4 =  1.383577518672690e+02,
                                a5 = -3.066479806614716e+01,
                                a6 =  2.506628277459239e+00;

   const  double b1 = -5.447609879822406e+01,
                                b2 =  1.615858368580409e+02,
                                b3 = -1.556989798598866e+02,
                                b4 =  6.680131188771972e+01,
                                b5 = -1.328068155288572e+01;

    // Why are these numbered backwards?
   const  double c1 = -7.784894002430293e-03,
                                c2 = -3.223964580411365e-01,
                                c3 = -2.400758277161838e+00,
                                c4 = -2.549732539343734e+00,
                                c5 =  4.374664141464968e+00,
                                c6 =  2.938163982698783e+00;

   const  double d1 =  7.784695709041462e-03,
                                d2 =  3.224671290700398e-01,
                                d3 =  2.445134137142996e+00,
                                d4 =  3.754408661907416e+00;

   const  double low_threshold  = .02425,
                                high_threshold = .97575;
   const  double one     =  1.0,
                                half    =  0.5,
                                neg_two = -2.0;
    double retval, q;
    double num, denom;

    if (p < low_threshold) {
        q    = sqrt(neg_two*log(p));

        num = fma(fma(fma(fma(fma(c1,q,c2),q,c3),q,c4),q,c5),q,c6);
        denom = fma(fma(fma(fma(d1,q,d2),q,d3),q,d4),q,one);
    } else if (p < high_threshold) {
        q    = p - half;
        double r    = q*q;
        num = q * fma(fma(fma(fma(fma(a1,r,a2),r,a3),r,a4),r,a5),r,a6);
        denom = fma(fma(fma(fma(fma(b1,r,b2),r,b3),r,b4),r,b5),r,one);
    } else {
        q     = sqrt(neg_two*log(pprime));
        num = -fma(fma(fma(fma(fma(c1,q,c2),q,c3),q,c4),q,c5),q,c6);
        denom = fma(fma(fma(fma(d1,q,d2),q,d3),q,d4),q,one);
    }
    retval = num/denom;

    // If you want to use this function for something other than
    // feeding erfinv, you may want to do more than one refinement step,
    // especially since I'm doing Newton, not Halley.
    // Also, we're not handling special cases here.
    retval = refine_phiinv(p,retval);
    return retval;
}
