
#include "math32.h"

__attribute__((overloadable, always_inline)) float
maxmag(float x, float y)
{
    int ix = as_int(x);
    int iy = as_int(y);
    int ax = ix & 0x7fffffff;
    int ay = iy & 0x7fffffff;
    ax |= -(ax > 0x7f800000);
    ay |= -(ay > 0x7f800000);
    return as_float((-(ax > ay) & ix) |
	            (-(ay > ax) & iy) |
		    (-(ax == ay) & ((ix & iy) | (ax & 0x00400000))));
}

