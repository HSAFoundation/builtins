#pragma OPENCL EXTENSION cl_khr_subgroups : enable

extern void __hsail_wavebarrier(void);

__attribute__((overloadable,weak,always_inline)) void
sub_group_barrier(cl_mem_fence_flags flags)
{
    sub_group_barrier(flags, memory_scope_sub_group);
}

__attribute__((overloadable,weak,always_inline)) void
sub_group_barrier(cl_mem_fence_flags flags, memory_scope scope)
{
    // What about CLK_IMAGE_MEM_FENCE
    atomic_work_item_fence(flags, memory_order_release, scope);
    __hsail_wavebarrier();
    atomic_work_item_fence(flags, memory_order_acquire, scope);
}

