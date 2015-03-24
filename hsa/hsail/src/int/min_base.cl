
#include "ibuiltins.h"

#define G(T,N) \
__attribute__((overloadable, always_inline)) T##N \
min(T##N x, T##N y) \
{ \
    T##N ret; \
    ret.lo = min(x.lo, y.lo); \
    ret.hi = min(x.hi, y.hi); \
    return ret; \
}

#define G3(T) \
__attribute__((overloadable, always_inline)) T##3 \
min(T##3 x, T##3 y) \
{ \
    T##3 ret; \
    ret.s01 = min(x.s01, y.s01);\
    ret.s2 = min(x.s2, y.s2);\
    return ret; \
}

// ----- char -----

G(char, 4)
G3(char)
G(char, 2)

__attribute__((overloadable, always_inline)) char
min(char x, char y)
{
    return __amdil_imin_i32(x, y);
}

// ----- uchar -----

G(uchar, 16)
G(uchar, 8)
G(uchar, 4)
G3(uchar)
G(uchar, 2)

__attribute__((overloadable, always_inline)) uchar
min(uchar x, uchar y)
{
    return __amdil_umin_u32(x, y);
}

// ----- short -----

G(short, 4)
G3(short)
G(short, 2)

__attribute__((overloadable, always_inline)) short
min(short x, short y)
{
    return __amdil_imin_i32(x, y);
}

// ----- ushort -----
G(ushort, 16)
G(ushort, 8)
G(ushort, 4)
G3(ushort)
G(ushort, 2)
__attribute__((overloadable, always_inline)) ushort
min(ushort x, ushort y)
{
    return __amdil_umin_u32(x, y);
}

// ----- int -----

G(int, 4)
G3(int)
G(int, 2)

__attribute__((overloadable, always_inline)) int
min(int x, int y)
{
    return __amdil_imin_i32(x, y);
}

// ----- uint -----

G(uint, 16)
G(uint, 8)
G(uint, 4)
G3(uint)
G(uint, 2)

__attribute__((overloadable, always_inline)) uint
min(uint x, uint y)
{
    return __amdil_umin_u32(x, y);
}

// ----- long -----

// __hsail_ intrinsics which has no __amdil_ equivalents.
extern __attribute__((const)) long  __hsail_min_s64(long,  long);
extern __attribute__((const)) ulong  __hsail_min_u64(ulong,  ulong);

__attribute__((overloadable, always_inline)) long
min(long x, long y)
{
    return __hsail_min_s64(x, y);
}

// ----- ulong -----

G(ulong, 16)
G(ulong, 8)
G(ulong, 4)
G3(ulong)
G(ulong, 2)
__attribute__((overloadable, always_inline)) ulong
min(ulong x, ulong y)
{
    return __hsail_min_u64(x, y);
}

