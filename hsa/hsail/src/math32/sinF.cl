#if 1
#include "math32.h"
#include "remainderF_piby2.h"
#include "sincosF_piby4.h"
#endif

__attribute__((overloadable, pure)) float
sin(float x)
{
#if 1
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0, r1;
    int regn = argReductionS(&r0, &r1, dx);

    float ss = sinf_piby4_new(r0, r1);
    float cc = cosf_piby4_new(r0, r1);

    float s = (regn & 1) != 0 ? cc : ss;
    s = as_float(as_int(s) ^ ((regn > 1) << 31) ^ (ix ^ ax));

    s = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : s;

	//Subnormals
	s = x == 0. ? x : s;
    return s;
#else
  // TODO_HSA: Using native_sin for now.
  return native_sin(x);
#endif
}

