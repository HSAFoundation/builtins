
#include "math32.h"

__attribute__((overloadable, always_inline)) float
rsqrt(float x)
{
    return native_rsqrt(x);
}
