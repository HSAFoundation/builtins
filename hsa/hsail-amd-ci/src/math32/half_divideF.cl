
#include "math32.h"

__attribute__((overloadable, always_inline)) float
half_divide(float x, float y)
{
    int c = fabs(y) > 0x1.0p+96f;
    float s = c ? 0x1.0p-32f : 1.0f;
    y *= s;
    return s * native_divide(x, y);
}
