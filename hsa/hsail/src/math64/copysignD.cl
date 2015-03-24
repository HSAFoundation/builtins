
#include "math64.h"

// __hsail_ intrinsic which has no __amdil_ equivalent.
extern __attribute__((const)) double  __hsail_copysign_f64(double, double);


#define G(N) \
__attribute__((overloadable, always_inline)) double##N \
copysign(double##N x, double##N y) \
{ \
    double##N ret; \
    ret.lo = copysign(x.lo, y.lo); \
    ret.hi = copysign(x.hi, y.hi); \
    return ret; \
}

G(4)

__attribute__((overloadable, always_inline)) double3
copysign(double3 x, double3 y)
{
    double3 ret;
    ret.s01 = copysign(x.s01, y.s01);
    ret.s2 = copysign(x.s2, y.s2);
    return ret;
}

G(2)

__attribute__((overloadable, always_inline)) double
copysign(double x, double y)
{
    return __hsail_copysign_f64(x, y);
}

