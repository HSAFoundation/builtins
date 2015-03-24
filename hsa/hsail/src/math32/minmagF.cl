
#include "math32.h"

__attribute__((overloadable, always_inline)) float
minmag(float x, float y)
{
    int ix = as_int(x);
    int iy = as_int(y);
    int ax = ix & 0x7fffffff;
    int ay = iy & 0x7fffffff;
    return as_float((-(ax < ay) & ix) |
	            (-(ay < ax) & iy) |
		    (-(ax == ay) & (ix | iy)));
}

