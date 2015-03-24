// ----- float -----
__attribute__((overloadable,weak,always_inline)) float
clamp(float x, float minval, float maxval)
{
    return fmin(fmax(x, minval), maxval);
}

__attribute__((overloadable, weak,always_inline)) float4
clamp(float4 x, float4 minval, float4 maxval)
{
    return fmin(fmax(x, minval), maxval);
}

// ----- double -----
__attribute__((overloadable,weak,always_inline)) double
clamp(double x, double minval, double maxval)
{
    // We think there is a bug in section 9.3.3 and match the float version instead
    return fmin(fmax(x, minval), maxval);
}

// Integer clamp functions
#define ICLAMP(TY) \
__attribute__((overloadable,weak,always_inline)) TY \
clamp(TY x, TY minval, TY maxval) \
{ \
    return min(max(x, minval), maxval); \
}

#define ICLAMPN(T, N) \
__attribute__((overloadable,weak,always_inline)) T##N \
clamp(T##N x, T##N minval, T##N maxval) \
{ \
    return min(max(x, minval), maxval); \
}

#define ICLAMPNL(T, N) \
__attribute__((overloadable, weak, always_inline)) T##N \
clamp(T##N x, T##N minval, T##N maxval) \
{ \
    T##N ret; \
	ret.lo = clamp(x.lo, minval.lo, maxval.lo); \
	ret.hi = clamp(x.hi, minval.hi, maxval.hi); \
    return ret; \
}

// ----- char -----
ICLAMP(char)

// ----- uchar -----
ICLAMP(uchar)

// ----- short -----
ICLAMPNL(short, 16)
ICLAMPNL(short, 8)
ICLAMPN(short, 4)
ICLAMPN(short, 3)
ICLAMPN(short, 2)
ICLAMP(short)

// ----- ushort -----
ICLAMP(ushort)

// ----- int -----
ICLAMPNL(int, 16)
ICLAMPNL(int, 8)
ICLAMPN(int, 4)
ICLAMPN(int, 3)
ICLAMPN(int, 2)
ICLAMP(int)

// ----- uint -----
ICLAMPN(uint, 4)
ICLAMPN(uint, 2)
ICLAMP(uint)

// ----- long -----
ICLAMPNL(long, 16)
ICLAMPNL(long, 8)
ICLAMPNL(long, 4)

__attribute__ ((overloadable, weak, always_inline)) long3
clamp(long3 x, long3 minval, long3 maxval)
{
    long3 ret;
    ret.s01 = clamp(x.s01, minval.s01, maxval.s01);
    ret.s2 = clamp(x.s2, minval.s2, maxval.s2);
    return ret;
}
ICLAMPNL(long, 2)
ICLAMP(long)

// ----- ulong -----
ICLAMP(ulong) 

