
#include "math32.h"

__attribute__((overloadable, always_inline)) float
half_powr(float x, float y)
{
    return powr(x, y);
}

//__attribute__((overloadable, always_inline)) float4
//half_powr(float4 x, float4 y)
//{
//    return powr(x, y);
//}

