
#include "math64.h"

__attribute__((overloadable, always_inline)) double
minmag(double x, double y)
{
    long ix = as_long(x);
    long iy = as_long(y);
    long ax = ix & 0x7fffffffffffffffL;
    long ay = iy & 0x7fffffffffffffffL;
    return as_double((-(ax < ay) & ix) |
	            (-(ay < ax) & iy) |
		    (-(ax == ay) & (ix | iy)));
}

