
#include "math64.h"

__attribute__((overloadable, always_inline)) double
fmax(double x, double y)
{
    // The multiplications are for sNAN quieting (required and work only when mode.IEEE=1).
    // HSAIL min/max (no ftz) for doubles guarantee denorms support and expand to V_MIN/MAX.
    return __hsail_max_f64(__hsail_mul_f64(x, 1.0), __hsail_mul_f64(y, 1.0));
}

