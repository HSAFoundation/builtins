
#include "math64.h"

__attribute__ ((overloadable, always_inline)) double
round(double x)
{
    long l = as_long(x);
    int e = ((int)(l >> 52) & 0x7ff) - 1023;
    long s = (l & 0x8000000000000000L) | (e == -1 ? 0x3ff0000000000000L : 0L);
    long m = 0x000fffffffffffffL >> e;
    long d = 0x0008000000000000L >> e;
    long k = l + (l & m ? d : 0);
    k &= ~m;
    k = e < 0 ? s : k;
    k = e > 51 ? l : k;
    return as_double(k);
}

