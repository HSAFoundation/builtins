
#include "math64.h"

__attribute__((overloadable, always_inline)) double
nan(ulong nancode)
{
    return as_double((nancode & 0x000fffffffffffffUL) | 0x7ff8000000000000UL);
}

