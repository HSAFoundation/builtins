
#include "ibuiltins.h"

// ----- char -----

__attribute__((overloadable, always_inline)) uchar
abs(char x)
{
    char s = x >> 7;
    return (uchar)((x + s) ^ s);
}


// ----- uchar -----

__attribute__((overloadable, always_inline)) uchar
abs(uchar x)
{
    return x;
}

// ----- short -----

__attribute__((overloadable, always_inline)) ushort
abs(short x)
{
    short s = x >> 15;
    return (ushort)((x + s) ^ s);
}

// ----- ushort -----

__attribute__((overloadable, always_inline)) ushort
abs(ushort x)
{
    return x;
}

// ----- int -----

__attribute__((overloadable, always_inline)) uint
abs(int x)
{
    int s = x >> 31;
    return (uint)((x + s) ^ s);
}

// ----- uint -----

__attribute__((overloadable, always_inline)) uint
abs(uint x)
{
    return x;
}

// ----- long -----

__attribute__((overloadable, always_inline)) ulong
abs(long x)
{
    long s = x >> 63;
    return (ulong)((x + s) ^ s);
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
abs(ulong x)
{
    return x;
}

