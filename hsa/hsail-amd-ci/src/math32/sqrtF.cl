
#include "math32.h"

__attribute__((overloadable, always_inline)) float
sqrt(float x)
{
    return native_sqrt(x);
}
