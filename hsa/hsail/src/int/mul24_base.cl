
#include "ibuiltins.h"

// ----- int -----

__attribute__((overloadable, always_inline)) int
mul24(int x, int y)
{
    return __amdil_imul24_i32(x, y);
}

__attribute__((overloadable, always_inline)) int
mad24(int a, int b, int c)
{
    return __amdil_imad24_i32(a, b, c);
}

// ----- uint -----

__attribute__((overloadable, always_inline)) uint
mul24(uint x, uint y)
{
    return __amdil_umul24_u32(x, y);
}

__attribute__((overloadable, always_inline)) uint
mad24(uint a, uint b, uint c)
{
    return __amdil_umad24_u32(a, b, c);
}
