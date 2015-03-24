
extern __attribute__((const)) uint __hsail_get_global_size(uint);
extern __attribute__((const)) uint __hsail_get_global_id(uint);
extern __attribute__((const)) uint __hsail_workgroup_size(uint);
extern __attribute__((const)) uint __hsail_currentworkgroup_size(uint);
extern __attribute__((const)) uint __hsail_get_local_id(uint);
extern __attribute__((const)) uint __hsail_get_num_groups(uint);
extern __attribute__((const)) uint __hsail_get_group_id(uint);
extern __attribute__((const)) uint   __hsail_get_work_dim(void);
extern __attribute__((const)) uint  __hsail_ld_kernarg_u32(uint);
extern __attribute__((const)) ulong __hsail_ld_kernarg_u64(uint);
extern __attribute__((const)) uint __hsail_workitemid_flat(void);

// FIXME - this will change to ulong soon
extern __attribute__((const)) uint __hsail_workitemid_flatabs(void);

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_global_offset(uint d)
{
#if defined __hsail64__
    switch(d) {
    case 0:
        return __hsail_ld_kernarg_u64(0*8);
    case 1:
        return __hsail_ld_kernarg_u64(1*8);
    case 2:
        return __hsail_ld_kernarg_u64(2*8);
    default:
        return 0;
    }
#else
    switch(d) {
    case 0:
        return __hsail_ld_kernarg_u32(0*4);
    case 1:
        return __hsail_ld_kernarg_u32(1*4);
    case 2:
        return __hsail_ld_kernarg_u32(2*4);
    default:
        return 0;
    }
#endif
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_global_id(uint d)
{
    size_t id;

    switch(d) {
    case 0:
        id = __hsail_get_global_id(0);
        break;
    case 1:
        id = __hsail_get_global_id(1);
        break;
    case 2:
        id = __hsail_get_global_id(2);
        break;
    default:
        id = 0;
        break;
    }

    return id;
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_local_id(uint d)
{
    switch(d) {
    case 0:
        return __hsail_get_local_id(0);
    case 1:
        return __hsail_get_local_id(1);
    case 2:
        return __hsail_get_local_id(2);
    default:
        return 0;
    }
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_group_id(uint d)
{
    switch(d) {
    case 0:
        return __hsail_get_group_id(0);
    case 1:
        return __hsail_get_group_id(1);
    case 2:
        return __hsail_get_group_id(2);
    default:
        return 0;
    }
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_global_size(uint d)
{
    switch(d) {
    case 0:
        return __hsail_get_global_size(0);
    case 1:
        return __hsail_get_global_size(1);
    case 2:
        return __hsail_get_global_size(2);
    default:
        return 1;
    }
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_local_size(uint d)
{
    switch(d) {
    case 0:
        return __hsail_currentworkgroup_size(0);
    case 1:
        return __hsail_currentworkgroup_size(1);
    case 2:
        return __hsail_currentworkgroup_size(2);
    default:
        return 1;
    }
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_num_groups(uint d)
{
    switch(d) {
    case 0:
        return __hsail_get_num_groups(0);
    case 1:
        return __hsail_get_num_groups(1);
    case 2:
        return __hsail_get_num_groups(2);
    default:
        return 1;
    }
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
uint get_work_dim(void) {
  return __hsail_get_work_dim();
}

#if __OPENCL_C_VERSION__ >= 200
#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_enqueued_local_size(uint d)
{
    switch(d) {
    case 0:
        return __hsail_workgroup_size(0);
    case 1:
        return __hsail_workgroup_size(1);
    case 2:
        return __hsail_workgroup_size(2);
    default:
        return 1;
    }
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_global_linear_id(void)
{
#if defined NO_WORKITEM_FLATABS
    return (__hsail_get_global_id(2) * __hsail_get_global_size(1) +
            __hsail_get_global_id(1)) * __hsail_get_global_size(0) +
	    __hsail_get_global_id(0);
#else
    return __hsail_workitemid_flatabs();
#endif
}

#ifdef __clang__
    __attribute__((always_inline, overloadable))
#else
__attribute__((always_inline))
#endif
size_t
get_local_linear_id(void)
{
    return __hsail_workitemid_flat();
}

#endif

