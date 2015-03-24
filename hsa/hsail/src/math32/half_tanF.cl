
#include "math32.h"
#include "remainderF_piby2.h"
#include "tanF_piby4.h"

__attribute__((overloadable)) float
half_tan(float x)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0, r1;
    int regn = argReductionSmallS(&r0, &r1, dx);

    float t = tanf_piby4_new(r0, regn);
    t = ix != ax ? -t : t;
    t = x == 0.0f ? x : t;
    t = ax > 0x47800000 ? 0.0f : t;
    t = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : t;
    return t;
}

