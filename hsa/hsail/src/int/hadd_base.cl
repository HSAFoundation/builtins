
// ----- char -----

__attribute__((overloadable, always_inline)) char
hadd(char x, char y)
{
    // compiler automatically casts larger
    return (x + y) >> 1;
}

// ----- uchar -----

__attribute__((overloadable, always_inline)) uchar
hadd(uchar x, uchar y)
{
    // compiler automatically casts larger
    return (x + y) >> 1;
}

// ----- short -----

__attribute__((overloadable, always_inline)) short
hadd(short x, short y)
{
    // compiler automatically casts larger
    return (x + y) >> 1;
}

// ----- ushort -----

__attribute__((overloadable, always_inline)) ushort
hadd(ushort x, ushort y)
{
    // compiler automatically casts larger
    return (x + y) >> 1;
}

// ----- int -----

__attribute__((overloadable, always_inline)) int
hadd(int x, int y)
{
    int cin = (x & 1) & y;
    return (x >> 1) + (y >> 1) + cin;
}

// ----- uint -----

__attribute__((overloadable, always_inline)) uint
hadd(uint x, uint y)
{
    uint cin = (x & 1U) & y;
    return (x >> 1) + (y >> 1) + cin;
}

// ----- long -----

__attribute__((overloadable, always_inline)) long
hadd(long x, long y)
{
    long cin = (x & 1) & y;
    return (x >> 1) + (y >> 1) + cin;
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
hadd(ulong x, ulong y)
{
    ulong cin = (x & 1) & y;
    return (x >> 1) + (y >> 1) + cin;
}

