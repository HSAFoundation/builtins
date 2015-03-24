
#include "math64.h"

__attribute__ ((overloadable, always_inline)) double
trunc(double x)
{
    return __amdil_round_zero_f64(x);
}

