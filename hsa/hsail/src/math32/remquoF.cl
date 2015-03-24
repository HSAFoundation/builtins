
#define COMPILING_REMQUO
#include "remainderF.h"

#if __OPENCL_C_VERSION__ < 200
__attribute__((overloadable, always_inline)) float
remquo(float x, float y, __global int *quo)
{
    int q;
    float r = remquo(x, y, &q);
    *quo = q;
    return r;
}

__attribute__((overloadable, always_inline)) float
remquo(float x, float y, __local int *quo)
{
    int q;
    float r = remquo(x, y, &q);
    *quo = q;
    return r;
}
#endif

