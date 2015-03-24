
#include "math32.h"

__attribute__((overloadable, always_inline)) float
log2(float x)
{
    return native_log2(x);
}
