#include "ibuiltins.h"

// ----- (u)char -----

__attribute__((overloadable, always_inline)) ushort
upsample(uchar hi, uchar lo)
{
    return ((ushort)hi << 8) | lo;
}

__attribute__((overloadable, always_inline)) short
upsample(char hi, uchar lo)
{
    return ((short)hi << 8) | lo;
}

// ----- (u)short -----

__attribute__((overloadable, always_inline)) uint
upsample(ushort hi, ushort lo)
{
    return ((uint)hi << 16) | lo;
}

__attribute__((overloadable, always_inline)) int
upsample(short hi, ushort lo)
{
    return ((int)hi << 16) | lo;
}

// ----- (u)int -----

__attribute__((overloadable, always_inline)) ulong
upsample(uint hi, uint lo)
{
    return ((ulong)hi << 32) | lo;
}

__attribute__((overloadable, always_inline)) long
upsample(int hi, uint lo)
{
    return ((long)hi << 32) | lo;
}

