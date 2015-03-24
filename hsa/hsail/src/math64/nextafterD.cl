
#include "math64.h"

__attribute__((overloadable, always_inline)) double
nextafter(double x, double y)
{
    long ix = as_long(x);
    long ax = ix & 0x7fffffffffffffffL;
    long mx = 0x8000000000000000L - ix;
    mx = ix < 0 ? mx : ix;
    long iy = as_long(y);
    long ay = iy & 0x7fffffffffffffffL;
    long my = 0x8000000000000000L - iy;
    my = iy < 0 ? my : iy;
    long t = mx + (mx < my ? 1 : -1);
    long r = 0x8000000000000000L - t;
    r = t < 0 ? r : t;
    r = ax > 0x7ff0000000000000L ? ix : r;
    r = ay > 0x7ff0000000000000L ? iy : r;
    r = (ax|ay) == 0L | ix == iy ? iy : r;
    return as_double(r);
}

