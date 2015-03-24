
#include "math64.h"

#define G(N) \
__attribute__ ((overloadable, always_inline, weak)) double##N \
ceil(double##N x) \
{ \
    double##N ret; \
    ret.lo = ceil(x.lo); \
    ret.hi = ceil(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)
G(2)

__attribute__ ((overloadable, always_inline, weak)) double3
ceil(double3 x)
{
    double3 ret;
    ret.s01 = ceil(x.s01);
    ret.s2 = ceil(x.s2);
    return ret;
}

__attribute__ ((overloadable, always_inline)) double
ceil(double x)
{
    return __amdil_round_posinf_f64(x);
}

