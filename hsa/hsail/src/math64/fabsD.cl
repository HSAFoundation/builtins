
#include "math64.h"

#define G(N) \
__attribute__((overloadable, always_inline)) double##N \
fabs(double##N x) \
{ \
    double##N ret; \
    ret.lo = fabs(x.lo); \
    ret.hi = fabs(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)

__attribute__((overloadable, always_inline)) double3
fabs(double3 x)
{
    double3 ret;
    ret.s01 = fabs(x.s01);
    ret.s2 = fabs(x.s2);
    return ret;
}

G(2)

__attribute__((overloadable, always_inline)) double
fabs(double x)
{
    return __amdil_fabs_f64(x);
}

