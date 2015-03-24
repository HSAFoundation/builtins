#include "math32.h"

__attribute__((overloadable, always_inline)) float
ldexp(float x, int n)
{
    return __amdil_ldexp_f32(x, n);
}
