
#include "ibuiltins.h"

// ----- char -----

__attribute__((overloadable, always_inline)) char
mad_hi(char a, char b, char c)
{
    return (char)(((int)a * (int)b) >> 8) + c;
}

// ----- uchar -----

__attribute__((overloadable, always_inline)) uchar
mad_hi(uchar a, uchar b, uchar c)
{
    return (uchar)(((uint)a * (uint)b) >> 8) + c;
}

// ----- short -----

__attribute__((overloadable, always_inline)) short
mad_hi(short a, short b, short c)
{
    return (short)(((int)a * (int)b) >> 16) + c;
}

// ----- ushort -----

__attribute__((overloadable, always_inline)) ushort
mad_hi(ushort a, ushort b, ushort c)
{
    return (ushort)(((uint)a * (uint)b) >> 16) + c;
}

// ----- int -----

__attribute__((overloadable, always_inline)) int
mad_hi(int a, int b, int c)
{
    return (int)(((long)a * (long)b) >> 32) + c;
}

// ----- uint -----

__attribute__((overloadable, always_inline)) uint
mad_hi(uint a, uint b, uint c)
{
    return (uint)(((ulong)a * (ulong)b) >> 32) + c;
}


// ----- long -----

__attribute__((overloadable, always_inline)) long
mad_hi(long a, long b, long c)
{
    return _gpu_mul_hi_i64(a, b) + c;
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
mad_hi(ulong a, ulong b, ulong c)
{
    return _gpu_mul_hi_u64(a, b) + c;
}

