
#include "math32.h"

__attribute__((overloadable, always_inline)) int
ilogb(float x)
{
    uint ux = as_uint(x);
    uint ax = ux & EXSIGNBIT_SP32;
    int rs = -118 - (int)clz(ux & MANTBITS_SP32);
    int r = (int)(ax >> EXPSHIFTBITS_SP32) - EXPBIAS_SP32;
    r = ax < 0x00800000U ? rs : r;
    r = ax > EXPBITS_SP32 | ax == 0 ? 0x80000000 : r;
    r = ax == EXPBITS_SP32 ? 0x7fffffff : r;
    return r;
}

