//
// Copyright (c) 2014 Advanced Micro Devices, Inc. All rights reserved.
//

#include "pipes.h"

#define __WRITE_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) int \
__write_pipe_internal_##SIZE(__global struct pipeimp* p, const STYPE* ptr) \
{ \
    size_t ri = atomic_load_explicit(&p->read_idx, memory_order_relaxed, memory_scope_device); \
    size_t ei = p->end_idx; \
    size_t wi = wave_reserve_1(&p->write_idx, ri+ei); \
    if (wi == ~(size_t)0) \
        return -1; \
 \
    size_t pi = wrap(wi, ei); \
    ((__global STYPE *)p->packets)[pi] = *ptr; \
    return 0; \
}

DO_PIPE_INTERNAL_SIZE(__WRITE_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) int
__write_pipe_internal_user(__global struct pipeimp* p, const void* ptr, size_t size, size_t align)
{
    size_t ri = atomic_load_explicit(&p->read_idx, memory_order_relaxed, memory_scope_device);
    size_t ei = p->end_idx;
    size_t wi = wave_reserve_1(&p->write_idx, ri+ei);
    if (wi == ~(size_t)0)
        return -1;

    size_t pi = wrap(wi, ei);
    __memcpy_internal_aligned(p->packets + pi*size, ptr, size, align);

    return 0;
}

#define __WRITE_PIPE_INDEXED_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) int \
__write_pipe_reserved_internal_##SIZE(__global struct pipeimp* p, size_t rid, uint i, const STYPE* ptr)  \
{ \
    rid += i; \
    size_t pi = wrap(rid, p->end_idx); \
    ((__global STYPE *)p->packets)[pi] = *ptr; \
    return 0; \
}

DO_PIPE_INTERNAL_SIZE(__WRITE_PIPE_INDEXED_INTERNAL_SIZE)

__attribute__((weak, always_inline)) int
__write_pipe_reserved_internal_user(__global struct pipeimp* p, size_t rid, uint i, const void *ptr, size_t size, size_t align)
{
    rid += i;
    size_t pi = wrap(rid, p->end_idx);
    __memcpy_internal_aligned(p->packets + pi*size, ptr, size, align);

    return 0;
}

