
#include "ibuiltins.h"

__attribute__((always_inline)) static uint
myclz4(uint x)
{
    uint z =  __hsail_firstbit_u32(x);
    return x == 0U ? 32U : z;
}

// ----- [u]char -----

__attribute__((overloadable, always_inline)) uint
clz(uint x)
{
    return myclz4(x);
}

__attribute__((overloadable, always_inline)) int
clz(int x)
{
    return myclz4((uint)x);
}

__attribute__((overloadable, always_inline)) char
clz(char x)
{
    return myclz4((uint)x & 0xffU) - 24U;
}

__attribute__((overloadable, always_inline)) uchar
clz(uchar x)
{
    return myclz4((uint)x) - 24U;
}

// ----- [u]short -----

__attribute__((overloadable, always_inline)) short
clz(short x)
{
    return myclz4((uint)x & 0xffffU) - 16U;
}

__attribute__((overloadable, always_inline)) ushort
clz(ushort x)
{
    return myclz4((uint)x) - 16U;
}

// ----- [u]int -----


// ----- [u]long -----

__attribute__((always_inline)) static ulong
myclz8(ulong x)
{
    uint xlo = (uint)x;
    uint xhi = (uint)(x >> 32);
    uint zlo = __hsail_firstbit_u32(xlo);
    uint zhi = __hsail_firstbit_u32(xhi);
    uint clo = (xlo == 0 ? 32 : zlo) + 32;
    return xhi == 0 ? clo : zhi;
}


__attribute__((overloadable, always_inline)) ulong
clz(ulong x)
{
    return myclz8(x);
}

__attribute__((overloadable, always_inline)) long
clz(long x)
{
    return myclz8((ulong)x);
}

