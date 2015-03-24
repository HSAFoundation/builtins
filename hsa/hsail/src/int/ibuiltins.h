
extern __attribute__((pure)) int   __amdil_count_bits_i32(int);
extern __attribute__((const)) int   __hsail_firstbit_u32(uint);
extern __attribute__((const)) int   __hsail_lastbit_u32(uint);

extern __attribute__((pure)) int   __amdil_imad24_i32(int, int, int);
extern __attribute__((pure)) uint  __amdil_umad24_u32(uint, uint, uint);
extern __attribute__((pure)) int   __amdil_imul24_i32(int, int);
extern __attribute__((pure)) uint  __amdil_umul24_u32(uint, uint);

extern __attribute__((pure)) int   __amdil_imin_i32(int,  int);
extern __attribute__((pure)) int   __amdil_imax_i32(int,  int);
extern __attribute__((pure)) uint  __amdil_umin_u32(uint,  uint);
extern __attribute__((pure)) uint  __amdil_umax_u32(uint,  uint);

extern __attribute__((pure)) long  __amdil_imin_i64(long,  long);
extern __attribute__((pure)) long  __amdil_imax_i64(long,  long);
extern __attribute__((pure)) ulong __amdil_umin_u64(ulong,  ulong);
extern __attribute__((pure)) ulong __amdil_umax_u64(ulong,  ulong);

extern __attribute__((pure)) int   __amdil_imul_high_i32(int,  int);
extern __attribute__((pure)) uint  __amdil_umul_high_u32(uint,  uint);

static inline long
_gpu_mul_hi_i64(long x, long y)
{
    ulong x0 = (ulong)x & 0xffffffffUL;
    long x1 = x >> 32;
    ulong y0 = (ulong)y & 0xffffffffUL;
    long y1 = y >> 32;
    ulong z0 = x0*y0;
    long t = x1*y0 + (z0 >> 32);
    long z1 = t & 0xffffffffL;
    long z2 = t >> 32;
    z1 = x0*y1 + z1;
    return x1*y1 + z2 + (z1 >> 32);
}

static inline ulong
_gpu_mul_hi_u64(ulong x, ulong y)
{
    ulong x0 = x & 0xffffffffUL;
    ulong x1 = x >> 32;
    ulong y0 = y & 0xffffffffUL;
    ulong y1 = y >> 32;
    ulong z0 = x0*y0;
    ulong t = x1*y0 + (z0 >> 32);
    ulong z1 = t & 0xffffffffUL;
    ulong z2 = t >> 32;
    z1 = x0*y1 + z1;
    return x1*y1 + z2 + (z1 >> 32);
}

