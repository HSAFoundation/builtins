
#include "math32.h"
extern __attribute__((const)) float __hsail_nexp2_f32(float);

__attribute__((overloadable, always_inline)) float
exp2(float x)
{
    return __hsail_nexp2_f32(x);
}
