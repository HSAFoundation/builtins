
#include "math32.h"

__attribute__((overloadable, always_inline)) float
mad(float x, float y, float z)
{
    return __amdil_mad_f32(x, y, z);
}
