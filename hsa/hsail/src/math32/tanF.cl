
#include "math32.h"
#include "remainderF_piby2.h"
#include "tanF_piby4.h"

__attribute__((overloadable)) float
tan(float x)
{
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0, r1;
    int regn = argReductionS(&r0, &r1, dx);

    float t = tanf_piby4_new(r0 + r1, regn);
    t = as_float(as_int(t) ^ (ix ^ ax));

    t = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : t;
	//Take care of subnormals
	t = (x == 0.) ? x : t;
    return t;
}

