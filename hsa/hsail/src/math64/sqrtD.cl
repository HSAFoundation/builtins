
#include "math64.h"

extern __attribute__((const)) double __hsail_sqrt_f64(double);

__attribute__((overloadable, always_inline, weak)) double
sqrt(double x)
{
    /* Use sqrt_f64 because our nsqrt_f64 does not have necessary precision. */
    return __hsail_sqrt_f64(x);
}
