
#include "math32.h"

__attribute__((overloadable, always_inline)) float
half_exp(float x)
{
    return native_exp(x);
}

__attribute__((overloadable, always_inline)) float
half_exp2(float x)
{
    return native_exp2(x);
}

__attribute__((overloadable, always_inline)) float
half_exp10(float x)
{
    return native_exp10(x);
}
