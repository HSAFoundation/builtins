//
// Copyright (c) 2014 Advanced Micro Devices, Inc. All rights reserved.
//

#include "pipes.h"

#define __READ_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) int \
__read_pipe_internal_##SIZE(__global struct pipeimp* p, STYPE* ptr) \
{ \
    size_t wi = atomic_load_explicit(&p->write_idx, memory_order_relaxed, memory_scope_device); \
    size_t ri = wave_reserve_1(&p->read_idx, wi); \
    if (ri == ~(size_t)0) \
        return -1; \
 \
    size_t pi = wrap(ri, p->end_idx); \
    *ptr = ((__global STYPE *)p->packets)[pi]; \
 \
    if (ri == wi-1) { \
        atomic_store_explicit(&p->write_idx, 0, memory_order_release, memory_scope_device); \
        atomic_store_explicit(&p->read_idx, 0, memory_order_relaxed, memory_scope_device); \
    }\
\
    return 0; \
}

DO_PIPE_INTERNAL_SIZE(__READ_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) int
__read_pipe_internal_user( __global struct pipeimp* p, void* ptr, size_t size, size_t align)
{
    size_t wi = atomic_load_explicit(&p->write_idx, memory_order_relaxed, memory_scope_device);
    size_t ri = wave_reserve_1(&p->read_idx, wi);
    if (ri == ~(size_t)0)
        return -1;

    size_t pi = wrap(ri, p->end_idx);
    __memcpy_internal_aligned(ptr, p->packets + pi*size, size, align);

    if (ri == wi-1) {
        atomic_store_explicit(&p->write_idx, 0, memory_order_release, memory_scope_device);
        atomic_store_explicit(&p->read_idx, 0, memory_order_relaxed, memory_scope_device);
    }

    return 0;
}

#define __READ_PIPE_INDEXED_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) int \
__read_pipe_reserved_internal_##SIZE(__global struct pipeimp* p, size_t rid, uint i, STYPE* ptr)  \
{ \
    rid += i; \
    size_t pi = wrap(rid, p->end_idx); \
    *ptr = ((__global STYPE *)p->packets)[pi]; \
 \
    return 0; \
}

DO_PIPE_INTERNAL_SIZE(__READ_PIPE_INDEXED_INTERNAL_SIZE)

__attribute__((weak, always_inline)) int
__read_pipe_reserved_internal_user(__global struct pipeimp* p, size_t rid, uint i, void *ptr, size_t size, size_t align)
{
    rid += i;
    size_t pi = wrap(rid, p->end_idx);
    __memcpy_internal_aligned(ptr, p->packets + pi*size, size, align);

    return 0;
}

