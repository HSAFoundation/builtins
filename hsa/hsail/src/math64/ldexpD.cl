
#include "math64.h"

__attribute__((overloadable, always_inline, weak)) double
ldexp(double x, int n)
{
	long l = as_ulong(x);
	int e = (l >> 52) & 0x7ff;
	long s = l & 0x8000000000000000;

	ulong ux = as_ulong(x * 0x1.0p+53);
	int de = ((int)(ux >> 52) & 0x7ff) - 53;
	int c = e == 0;
	e = c ? de: e;

	ux = c ? ux : l;

	int v = e + n;
	v = clamp(v, -0x7ff, 0x7ff);

	ux &= ~EXPBITS_DP64;

	double mr = as_double(ux | ((ulong)(v+53) << 52));
	mr = mr * 0x1.0p-53;

	mr = v > 0  ? as_double(ux | ((ulong)v << 52)) : mr;

	mr = v == 0x7ff ? as_double(s | PINFBITPATT_DP64)  : mr;
	mr = v < -53 ? as_double(s) : mr;

	mr  = (n == 0) | isinf(x) | (x == 0) ? x : mr;
	return mr;
}
