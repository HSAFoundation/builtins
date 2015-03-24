
// ----- char -----

__attribute__((overloadable, always_inline)) uchar
abs_diff(char x, char y)
{
    int ix = x;
    int iy = y;
    int d = max(ix,iy) - min(ix,iy);
    return (uchar)d;
}

// ----- uchar -----

__attribute__((overloadable, always_inline)) uchar
abs_diff(uchar x, uchar y)
{
    uint ux = x;
    uint uy = y;
    uint d = max(ux,uy) - min(ux,uy);
    return (uchar)d;
}

// ----- short -----

__attribute__((overloadable, always_inline)) ushort
abs_diff(short x, short y)
{
    int ix = x;
    int iy = y;
    int d = max(ix,iy) - min(ix,iy);
    return (ushort)d;
}

// ----- ushort -----

__attribute__((overloadable, always_inline)) ushort
abs_diff(ushort x, ushort y)
{
    uint ux = x;
    uint uy = y;
    uint d = max(ux,uy) - min(ux,uy);
    return (ushort)d;
}

// ----- int -----

__attribute__((overloadable, always_inline)) uint
abs_diff(int x, int y)
{
    return (uint)(max(x,y) - min(x,y));
}

// ----- uint -----

__attribute__((overloadable, always_inline)) uint
abs_diff(uint x, uint y)
{
    return max(x,y) - min(x,y);
}

// ----- long -----

__attribute__((overloadable, always_inline)) ulong
abs_diff(long x, long y)
{
    long xmy = x - y;
    long ymx = y - x;
    return (ulong)(x > y ? xmy : ymx);
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
abs_diff(ulong x, ulong y)
{
    ulong xmy = x - y;
    ulong ymx = y - x;
    return x > y ? xmy : ymx;
}

