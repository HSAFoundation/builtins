
#include "math32.h"

__attribute__((overloadable, always_inline)) float
nextafter(float x, float y)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    int mx = 0x80000000 - ix;
    mx = ix < 0 ? mx : ix;
    int iy = as_int(y);
    int ay = iy & 0x7fffffff;
    int my = 0x80000000 - iy;
    my = iy < 0 ? my : iy;
    int t = mx + (mx < my ? 1 : -1);
    int r = 0x80000000 - t;
    r = t < 0 ? r : t;
    r = ax > 0x7f800000 ? ix : r;
    r = ay > 0x7f800000 ? iy : r;
    r = (ax|ay) == 0 | ix == iy ? iy : r;
    return as_float(r);
}
