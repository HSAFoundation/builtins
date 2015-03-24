//
// Copyright (c) 2014 Advanced Micro Devices, Inc. All rights reserved.
//

#include "pipes.h"

#define __COMMIT_READ_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) void \
__commit_read_pipe_internal_##SIZE(__global struct pipeimp* p, size_t rid) \
{ \
}

DO_PIPE_INTERNAL_SIZE(__COMMIT_READ_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) void
__commit_read_pipe_internal_user(__global struct pipeimp* p, size_t rid, size_t size)
{
}

#define __COMMIT_WRITE_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) void \
__commit_write_pipe_internal_##SIZE(__global struct pipeimp* p, size_t rid) \
{ \
}

DO_PIPE_INTERNAL_SIZE(__COMMIT_WRITE_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) void
__commit_write_pipe_internal_user(__global struct pipeimp* p, size_t rid, size_t size)
{
}

// Work group functions

#define __WORK_GROUP_COMMIT_READ_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) void \
__work_group_commit_read_pipe_internal_##SIZE(__global struct pipeimp* p, size_t rid) \
{ \
}

DO_PIPE_INTERNAL_SIZE(__WORK_GROUP_COMMIT_READ_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) void
__work_group_commit_read_pipe_internal_user(__global struct pipeimp* p, size_t rid, size_t size)
{
}

#define __WORK_GROUP_COMMIT_WRITE_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) void \
__work_group_commit_write_pipe_internal_##SIZE(__global struct pipeimp* p, size_t rid) \
{ \
}

DO_PIPE_INTERNAL_SIZE(__WORK_GROUP_COMMIT_WRITE_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) void
__work_group_commit_write_pipe_internal_user(__global struct pipeimp* p, size_t rid, size_t size)
{
}

// sub group functions

#define __SUB_GROUP_COMMIT_READ_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) void \
__sub_group_commit_read_pipe_internal_##SIZE(__global struct pipeimp* p, size_t rid) \
{ \
}

DO_PIPE_INTERNAL_SIZE(__SUB_GROUP_COMMIT_READ_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) void
__sub_group_commit_read_pipe_internal_user(__global struct pipeimp* p, size_t rid, size_t size)
{
}

#define __SUB_GROUP_COMMIT_WRITE_PIPE_INTERNAL_SIZE(SIZE, STYPE) \
__attribute__((weak, always_inline)) void \
__sub_group_commit_write_pipe_internal_##SIZE(__global struct pipeimp* p, size_t rid) \
{ \
}

DO_PIPE_INTERNAL_SIZE(__SUB_GROUP_COMMIT_WRITE_PIPE_INTERNAL_SIZE)

__attribute__((weak, always_inline)) void
__sub_group_commit_write_pipe_internal_user(__global struct pipeimp* p, size_t rid, size_t size)
{
}

