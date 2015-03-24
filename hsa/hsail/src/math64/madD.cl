
#include "math64.h"

__attribute__((overloadable, always_inline)) double
mad(double x, double y, double z)
{
    return __amdil_mad_f64(x, y, z);
}

