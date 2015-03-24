
#include "math32.h"
#include "remainderF_piby2.h"
#include "sincosF_piby4.h"

__attribute__((overloadable, always_inline, weak)) float
half_cos(float x)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0, r1;
    int regn = argReductionSmallS(&r0, &r1, dx);

    float ss = -sinf_piby4_new(r0, r1);
    float cc =  cosf_piby4_new(r0, r1);
    float c = (regn & 1) != 0 ? ss : cc;
    c = as_float(as_int(c) ^ ((regn > 1) <<31));

    c = ax > 0x47800000 ? 1.0f : c;
    c = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : c;
    return c;
}

