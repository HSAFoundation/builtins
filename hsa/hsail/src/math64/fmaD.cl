
#include "math64.h"

__attribute__((overloadable, always_inline)) double
fma(double x, double y, double z)
{
    return __amdil_fma_f64(x, y, z);
}

