
#include "math32.h"
#include "remainderF_piby2.h"
#include "sincosF_piby4.h"

__attribute__((overloadable, weak)) float
half_sin(float x)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;

    float dx = as_float(ax);

    float r0, r1;
    int regn = argReductionSmallS(&r0, &r1, dx);

    float ss = sinf_piby4_new(r0, r1);
    float cc = cosf_piby4_new(r0, r1);
    float s = (regn & 1) != 0 ? cc : ss;
    s = as_float(as_int(s) ^ ((regn > 1) << 31));

    s = ax > 0x47800000 ? 1.0f : s;
    s = as_float(as_int(s) ^ (ix ^ ax));
    s = x == 0.0f ? x : s;
    s = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : s;
    return s;
}

