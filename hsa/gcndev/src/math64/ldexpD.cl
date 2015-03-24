
#include "math64.h"

__attribute__((overloadable, always_inline)) double
ldexp(double x, int n)
{
    return __amdil_ldexp_f64(x, n);
}

