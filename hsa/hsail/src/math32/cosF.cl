
#if 1
#include "math32.h"
#include "remainderF_piby2.h"
#include "sincosF_piby4.h"
//#else
//extern __attribute__((pure)) float __amdil_cos_f32(float);
#endif

__attribute__((overloadable, pure)) float
cos(float x)
{
#if 1
    int ix = as_int(x);
    int ax = ix & 0x7fffffff;
    float dx = as_float(ax);

    float r0, r1;
    int regn = argReductionS(&r0, &r1, dx);

    float ss = -sinf_piby4_new(r0, r1);
    float cc =  cosf_piby4_new(r0, r1);

    float c =  (regn & 1) != 0 ? ss : cc;
    c = as_float(as_int(c) ^ ((regn > 1) << 31));

    c = ax >= PINFBITPATT_SP32 ? as_float(QNANBITPATT_SP32) : c;

    return c;
#else
  // TODO_HSA: Using native_cos for now.
  return native_cos(x);
#endif
}

