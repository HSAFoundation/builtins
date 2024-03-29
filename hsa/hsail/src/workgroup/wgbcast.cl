
#if __OPENCL_C_VERSION__ >= 200

#include "wg.h"

#define GEN_BROADCAST(TYPE) \
__attribute__((overloadable,weak,always_inline)) TYPE \
work_group_broadcast(TYPE a, size_t local_id_x) \
{ \
    if (get_num_sub_groups() == 1) \
        return sub_group_broadcast(a, local_id_x); \
 \
    __local TYPE *p = (__local TYPE *)__wg_scratch; \
    if (get_local_id(0) == local_id_x) \
        *p = a; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    a = *p; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    return a; \
} \
\
__attribute__((overloadable,weak,always_inline)) TYPE \
work_group_broadcast(TYPE a, size_t local_id_x, size_t local_id_y) \
{ \
    __local TYPE *p = (__local TYPE *)__wg_scratch; \
    if (get_local_id(0) == local_id_x && get_local_id(1) == local_id_y) \
        *p = a; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    a = *p; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    return a; \
} \
\
__attribute__((overloadable,weak,always_inline)) TYPE \
work_group_broadcast(TYPE a, size_t local_id_x, size_t local_id_y, size_t local_id_z) \
{ \
    __local TYPE *p = (__local TYPE *)__wg_scratch; \
    if (get_local_id(0) == local_id_x && get_local_id(1) == local_id_y && get_local_id(2) == local_id_z) \
        *p = a; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    a = *p; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    return a; \
}

GEN_BROADCAST(uint)
GEN_BROADCAST(int)
GEN_BROADCAST(ulong)
GEN_BROADCAST(long)
GEN_BROADCAST(float)
GEN_BROADCAST(double)

#endif

