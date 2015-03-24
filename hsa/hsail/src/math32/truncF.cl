
#include "math32.h"

__attribute__((overloadable, always_inline)) float
trunc(float x)
{
    return __amdil_round_zero_f32(x);
}
