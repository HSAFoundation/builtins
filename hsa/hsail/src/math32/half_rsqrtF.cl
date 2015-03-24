
#include "math32.h"

__attribute__((overloadable, always_inline, weak)) float
half_rsqrt(float x)
{
    return native_rsqrt(x);
}
