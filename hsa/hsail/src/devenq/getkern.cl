
#if __OPENCL_C_VERSION__ >= 200

#include "devenq.h"

// Currently we have no information about the block with 
// which to make block specific decisions.  Therefore these
// library calls corresponding to all of the possible
// get_kernel_* built in functions have no argument at all
// and return a reasonable constant

__attribute__((always_inline)) uint
__get_kernel_work_group_size_internal(void)
{
    return (uint)CL_DEVICE_MAX_WORK_GROUP_SIZE;
}

__attribute__((always_inline)) uint
__get_kernel_preferred_work_group_size_multiple_internal(void)
{
    return 64U;
}

#endif

