
#include "math32.h"

__attribute__((overloadable, always_inline, weak)) float
half_sqrt(float x)
{
    return native_sqrt(x);
}
