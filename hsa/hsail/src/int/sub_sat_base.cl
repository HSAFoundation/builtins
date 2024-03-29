
// ----- char -----

__attribute__((overloadable, always_inline)) char
sub_sat(char x, char y)
{
    int s = (int)x - (int) y;
    return max(-128, min(127, s));
}

// ----- uchar -----

__attribute__((overloadable, always_inline)) uchar
sub_sat(uchar x, uchar y)
{
    int s = (int)x - (int)y;
    return (uchar)max(s, 0);
}

// ----- short -----

__attribute__((overloadable, always_inline)) short
sub_sat(short x, short y)
{
    int s = (int)x - (int) y;
    return max(-32768, min(32767, s));
}

// ----- ushort -----

__attribute__((overloadable, always_inline)) ushort
sub_sat(ushort x, ushort y)
{
    int s = (int)x - (int)y;
    return (ushort)max(s, 0);
}

// ----- int -----

__attribute__((overloadable, always_inline)) int
sub_sat(int x, int y)
{
    int s = x - y;
    s = y < 1 & 0x7fffffff + y < x ? 0x7fffffff : s;
    s = y > 0 & (int)0x80000000 + y > x ? (int)0x80000000 : s;
    return s;
}

// ----- uint -----

__attribute__((overloadable, always_inline)) uint
sub_sat(uint x, uint y)
{
    uint s = x - y;
    return y > x ? 0U : s;
}

// ----- long -----

__attribute__((overloadable, always_inline)) long
sub_sat(long x, long y)
{
    long s = x - y;
    s = y < 1 & 0x7fffffffffffffffL + y < x ? 0x7fffffffffffffffL : s;
    s = y > 0 & (long)0x8000000000000000L + y > x ? (long)0x8000000000000000L : s;
    return s;
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
sub_sat(ulong x, ulong y)
{
    ulong s = x - y;
    return y > x ? 0UL : s;
}

