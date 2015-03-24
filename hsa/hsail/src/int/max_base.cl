#include "ibuiltins.h"

#define G(T,N) \
__attribute__((overloadable, always_inline)) T##N \
max(T##N x, T##N y) \
{ \
    T##N ret; \
    ret.lo = max(x.lo, y.lo); \
    ret.hi = max(x.hi, y.hi); \
    return ret; \
}

#define G3(T) \
__attribute__((overloadable, always_inline)) T##3 \
max(T##3 x, T##3 y) \
{ \
    T##3 ret; \
    ret.s01 = max(x.s01, y.s01);\
    ret.s2 = max(x.s2, y.s2);\
    return ret; \
}

// ----- char -----

G(char, 16)
G(char, 8)
G(char, 4)
G3(char)
G(char, 2)

__attribute__((overloadable, always_inline)) char
max(char x, char y)
{
    return __amdil_imax_i32(x, y);
}

// ----- uchar -----

G(uchar, 16)
G(uchar, 8)
G(uchar, 4)
G3(uchar)
G(uchar, 2)

__attribute__((overloadable, always_inline)) uchar
max(uchar x, uchar y)
{
    return __amdil_umax_u32(x, y);
}

// ----- short -----

G(short, 16)
G(short, 8)
G(short, 4)
G3(short)
G(short, 2)

__attribute__((overloadable, always_inline)) short
max(short x, short y)
{
    return __amdil_imax_i32(x, y);
}

// ----- ushort -----

G(ushort, 16)
G(ushort, 8)
G(ushort, 4)
G3(ushort)
G(ushort, 2)

__attribute__((overloadable, always_inline)) ushort
max(ushort x, ushort y)
{
    return __amdil_umax_u32(x, y);
}

// ----- int -----

G(int, 16)
G(int, 8)
G(int, 4)
G3(int)
G(int, 2)
__attribute__((overloadable, always_inline)) int
max(int x, int y)
{
    return __amdil_imax_i32(x, y);
}

// ----- uint -----
G(uint, 4)
G3(uint)
G(uint, 2)

__attribute__((overloadable, always_inline)) uint
max(uint x, uint y)
{
    return __amdil_umax_u32(x, y);
}

// ----- long -----

// __hsail_ intrinsics which has no __amdil_ equivalents.
extern __attribute__((const)) long  __hsail_max_s64(long,  long);
extern __attribute__((const)) ulong  __hsail_max_u64(ulong,  ulong);

G(long, 16)
G(long, 8)
G(long, 4)
G3(long)
G(long, 2)

__attribute__((overloadable, always_inline)) long
max(long x, long y)
{
    return __hsail_max_s64(x, y);
}

// ----- ulong -----

__attribute__((overloadable, always_inline)) ulong
max(ulong x, ulong y)
{
    return __hsail_max_u64(x, y);
}

