
#include "math32.h"

__attribute__((overloadable, always_inline)) float
logb(float x)
{
    int ax = as_int(x) & EXSIGNBIT_SP32;
    float s = -118 - clz(ax);
    float r = (ax >> EXPSHIFTBITS_SP32) - EXPBIAS_SP32;
    r = ax >= PINFBITPATT_SP32 ? as_float(ax) : r;
    r = ax < 0x00800000 ? s : r;
    r = ax == 0 ? as_float(NINFBITPATT_SP32) : r;
    return r;
}
