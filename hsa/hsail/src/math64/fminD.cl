
#include "math64.h"

__attribute__((overloadable, always_inline)) double
fmin(double x, double y)
{
    /// \see comments in double fmax source.
    return __hsail_min_f64(__hsail_mul_f64(x, 1.0), __hsail_mul_f64(y, 1.0));
}

