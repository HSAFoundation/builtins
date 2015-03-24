

// ----- char -----

__attribute__((overloadable, always_inline)) char
rhadd(char x, char y)
{
    // compiler automatically casts larger
    return (x + y + 1) >> 1;
}

// ----- uchar -----

__attribute__((overloadable, always_inline)) uchar
rhadd(uchar x, uchar y)
{
    // compiler automatically casts larger
    return (x + y + 1U) >> 1;
}

// ----- short -----

__attribute__((overloadable, always_inline)) short
rhadd(short x, short y)
{
    // compiler automatically casts larger
    return (x + y + 1) >> 1;
}

// ----- ushort -----

__attribute__((overloadable, always_inline)) ushort
rhadd(ushort x, ushort y)
{
    // compiler automatically casts larger
    return (x + y + 1U) >> 1;
}

// ----- int -----

__attribute__((overloadable, always_inline)) int
rhadd(int x, int y)
{
    int cin = (x | y) & 1;
    return (x >> 1) + (y >> 1) + cin;
}

// ----- uint -----
__attribute__((overloadable, always_inline)) uint
rhadd(uint x, uint y)
{
    uint cin = (x | y) & 1;
    return (x >> 1) + (y >> 1) + cin;
}

// ----- long -----
__attribute__((overloadable, always_inline)) long
rhadd(long x, long y)
{
    long cin = (x | y) & 1;
    return (x >> 1) + (y >> 1) + cin;
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
rhadd(ulong x, ulong y)
{
    ulong cin = (x | y) & 1;
    return (x >> 1) + (y >> 1) + cin;
}

