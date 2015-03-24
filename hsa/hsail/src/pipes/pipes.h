//
// Copyright (c) 2014 Advanced Micro Devices, Inc. All rights reserved.
//

#ifndef _PIPES_H
#define _PIPES_H 1

#pragma OPENCL EXTENSION cl_khr_int64_base_atomics : enable
#pragma OPENCL EXTENSION cl_khr_int64_extended_atomics : enable

struct ul4s {
    ulong x;
    ulong y;
    ulong z;
    ulong w;
};

extern __attribute__((const)) uint __hsail_get_lane_id(void);
extern __attribute__((pure)) uint __hsail_activelaneid_u32(void);
extern __attribute__((pure)) uint __hsail_activelanecount_u32_b1(bool);
extern __attribute__((pure)) uint __hsail_activelaneshuffle_b32(uint src, uint lid, uint ival, bool useival);
extern __attribute__((pure)) ulong __hsail_activelaneshuffle_b64(ulong src, uint lid, ulong ival, bool useival);
extern __attribute__((pure)) struct ul4s __hsail_activelanemask_v4_b64_b1(bool);
extern void __hsail_wavebarrier(void);
 
#define DO_PIPE_INTERNAL_SIZE(F) \
F(1,uchar) \
F(2,ushort) \
F(4,uint) \
F(8,ulong) \
F(16,ulong2) \
F(32,ulong4) \
F(64,ulong8) \
F(128,ulong16)

struct pipeimp {
    atomic_size_t read_idx;
    atomic_size_t write_idx;
    size_t end_idx;
    uchar pad[128 - 3*sizeof(size_t)];
    uchar packets[1];
};

extern void __memcpy_internal_aligned(__generic void *, __generic void *, size_t, size_t);

static inline size_t
reserve(volatile __global atomic_size_t *pidx, size_t lim, size_t n)
{
    size_t idx = atomic_load_explicit(pidx, memory_order_acquire, memory_scope_device);

    for (;;) {
        if (idx + n > lim)
            return ~(size_t)0;

        if (atomic_compare_exchange_strong_explicit(pidx, &idx, idx + n, memory_order_acq_rel, memory_order_acquire, memory_scope_device))
            break;
    }

    return idx;
}

#if 1
static inline size_t
wave_reserve_1(volatile __global atomic_size_t *pidx, size_t lim)
{
    size_t n = (size_t)__hsail_activelanecount_u32_b1(true);
    uint alid = __hsail_activelaneid_u32();
    size_t idx = 0;

    // Make reservation for all active uisng lowest active in wave
    if (alid == 0) {
        idx = atomic_load_explicit(pidx, memory_order_acquire, memory_scope_device);

        for (;;) {
            if (idx + n > lim) {
                idx = ~(size_t)0;
                break;
            }

            if (atomic_compare_exchange_strong_explicit(pidx, &idx, idx + n, memory_order_acq_rel, memory_order_acquire, memory_scope_device))
                break;
        }
    }

    __hsail_wavebarrier();

    // Broadcast the result; the ctz tells us which lane has active lane id 0
    uint lid = (uint)ctz(__hsail_activelanemask_v4_b64_b1(true).x);

#if defined __hsail64__
    idx = __hsail_activelaneshuffle_b64(idx, lid, (ulong)0, false);
#else
    idx = __hsail_activelaneshuffle_b32(idx, lid, (uint)0, false);
#endif

    __hsail_wavebarrier();

    if (idx != ~(size_t)0)
        idx += alid;
    else {
        // The entire group didn't fit, have to handle one by one
        idx = reserve(pidx, lim, (size_t)1);
    }

    return idx;
}
#endif

static inline size_t
wrap(size_t i, size_t n)
{
#if defined __hsail64__
    // Assume end_idx < 2^32
    size_t ret;
    if (as_uint2(i).y == 0U) {
        uint j = (uint)i;
        uint m = (uint)n;
        if (j < m)
            ret = i;
        else
            ret = (ulong)(j % m);
    } else
        ret = i % n;
    return ret;
#else
    return i < n ? i : i % n;
#endif
}

#endif // _PIPES_H

