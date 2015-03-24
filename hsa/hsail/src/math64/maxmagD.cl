
#include "math64.h"

__attribute__((overloadable, always_inline)) double
maxmag(double x, double y)
{
    long ix = as_long(x);
    long iy = as_long(y);
    long ax = ix & 0x7fffffffffffffffL;
    long ay = iy & 0x7fffffffffffffffL;
    ax |= -(ax > 0x7ff0000000000000L);
    ay |= -(ay > 0x7ff0000000000000L);
    return as_double((-(ax > ay) & ix) |
	             (-(ay > ax) & iy) |
		     (-(ax == ay) & ((ix & iy) | (ax & 0x0008000000000000L))));
}

