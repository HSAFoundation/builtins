
#include "math32.h"

__attribute__((overloadable, always_inline)) float
half_sqrt(float x)
{
    return native_sqrt(x);
}
