
#include "math32.h"

__attribute__((overloadable, always_inline, weak)) float
half_log2(float x)
{
    return native_log2(x);
}

__attribute__((overloadable, always_inline, weak)) float
half_log10(float x)
{
    return native_log10(x);
}

__attribute__((overloadable, always_inline, weak)) float
half_log(float x)
{
    return native_log(x);
}
