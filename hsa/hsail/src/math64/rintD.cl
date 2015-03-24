
#include "math64.h"

#define G(N) \
__attribute__((overloadable, always_inline)) double##N \
rint(double##N x) \
{ \
    double##N ret; \
    ret.lo = rint(x.lo); \
    ret.hi = rint(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)

__attribute__((overloadable, always_inline)) double3
rint(double3 x)
{
    double3 ret;
    ret.s01 = rint(x.s01);
    ret.s2 = rint(x.s2);
    return ret;
}

G(2)

__attribute__ ((overloadable, always_inline)) double
rint(double x)
{
    return __amdil_round_nearest_f64(x);
}

