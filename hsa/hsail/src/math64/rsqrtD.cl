
#include "math64.h"

__attribute__((overloadable, always_inline)) double
rsqrt(double x)
{
    double y0 = __amdil_rsq_f64(x);
    double y1 = 0.5 * y0 * fma(-x*y0, y0, 3.0);
    double y2 = 0.5 * y1 * fma(-x*y1, y1, 3.0);
    return y0 > 0.0 & y0 <= 0x1.fffffffffffffp+1023 ? y2 : y0;
}

