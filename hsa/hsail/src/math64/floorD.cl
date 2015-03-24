
#include "math64.h"

#define G(N) \
__attribute__ ((overloadable, always_inline, weak)) double##N \
floor(double##N x) \
{ \
    double##N ret; \
    ret.lo = floor(x.lo); \
    ret.hi = floor(x.hi); \
    return ret; \
}

G(16)
G(8)
G(4)

__attribute__((overloadable, always_inline, weak)) double3
floor(double3 x)
{
    double3 ret;
    ret.s01 = floor(x.s01);
    ret.s2 = floor(x.s2);
    return ret;
}

G(2)

__attribute__ ((overloadable, always_inline)) double
floor(double x)
{
    return __amdil_round_neginf_f64(x);
}

