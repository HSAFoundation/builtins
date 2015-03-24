
#if __OPENCL_C_VERSION__ >= 200

#include "wg.h"

#define GEN_AA(SUF,ID) \
__attribute__((overloadable, always_inline)) int \
work_group_##SUF(int predicate) \
{ \
    uint n = get_num_sub_groups(); \
    int a = sub_group_##SUF(predicate); \
    if (n == 1) \
	return a; \
 \
    __local int *p = (__local int *)__wg_scratch; \
    uint l = get_sub_group_local_id(); \
    uint i = get_sub_group_id(); \
 \
    if (l == 0) \
	p[i] = a; \
 \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    if (i == 0) { \
	a = l < n ? p[l] : ID; \
	a = sub_group_##SUF(a); \
	if (l == 0) \
	    p[0] = a; \
    } \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
    a = p[0]; \
    work_group_barrier(CLK_LOCAL_MEM_FENCE); \
 \
    return a; \
}

GEN_AA(all, 1U)
GEN_AA(any, 0U);

#endif

