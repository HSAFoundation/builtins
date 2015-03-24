#pragma OPENCL EXTENSION cl_khr_subgroups : enable

extern __attribute__((const)) uint __hsail_workitemid_flat(void);

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) uint
get_sub_group_size(void)
{
    uint wgs = (uint)get_local_size(0) * (uint)get_local_size(1) * (uint)get_local_size(2);
    uint lid = (uint)get_local_linear_id();
    return min(64U, wgs - (lid & ~63U));
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) uint
get_max_sub_group_size(void)
{
    uint wgs = (uint)get_enqueued_local_size(0) * get_enqueued_local_size(1) * get_enqueued_local_size(2);
    return min(64U, wgs);
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) uint
get_num_sub_groups(void)
{
    uint wgs = (uint)get_local_size(0) * (uint)get_local_size(1) * (uint)get_local_size(2);
    return (wgs + 63U) >> 6U;
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) uint
get_enqueued_num_sub_groups(void)
{
    uint wgs = (uint)get_enqueued_local_size(0) * get_enqueued_local_size(1) * get_enqueued_local_size(2);
    return (wgs + 63U) >> 6U;
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) uint
get_sub_group_id(void)
{
    return __hsail_workitemid_flat() >> 6U;
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) uint
get_sub_group_local_id(void)
{
    return __hsail_workitemid_flat() & 0x3fU;
}

