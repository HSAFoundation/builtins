
//
// Copyright (c) 2014 Advanced Micro Devices, Inc. All rights reserved.
//

#include "pipes.h"

#define __GET_PIPE_NUM_PACKETS_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) uint \
__get_pipe_num_packets_internal_##SIZE(__global struct pipeimp* p) \
{ \
    size_t ri = atomic_load_explicit(&p->read_idx, memory_order_relaxed, memory_scope_device); \
    size_t wi = atomic_load_explicit(&p->write_idx, memory_order_relaxed, memory_scope_device); \
    return (uint)(wi - ri); \
}

DO_PIPE_INTERNAL_SIZE(__GET_PIPE_NUM_PACKETS_INTERNAL_SIZE)

__attribute__((weak, always_inline)) uint
__get_pipe_num_packets_internal_user(__global struct pipeimp* p, size_t size)
{
    size_t ri = atomic_load_explicit(&p->read_idx, memory_order_relaxed, memory_scope_device);
    size_t wi = atomic_load_explicit(&p->write_idx, memory_order_relaxed, memory_scope_device);
    return (uint)(wi - ri);
}

#define __GET_PIPE_MAX_PACKETS_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) uint \
__get_pipe_max_packets_internal_##SIZE(__global struct pipeimp* p) \
{ \
    return (uint)p->end_idx; \
}

DO_PIPE_INTERNAL_SIZE(__GET_PIPE_MAX_PACKETS_INTERNAL_SIZE)

__attribute__((weak, always_inline)) uint
__get_pipe_max_packets_internal_user(__global struct pipeimp* p, size_t size)
{
    return (uint)p->end_idx;
}

