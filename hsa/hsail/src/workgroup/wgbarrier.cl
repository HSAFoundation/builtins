
#if __OPENCL_C_VERSION__ >= 200

extern void __hsail_barrier(void);

__attribute__((overloadable, weak, always_inline)) void
work_group_barrier(cl_mem_fence_flags flags, memory_scope scope)
{
    if (flags) {
        atomic_work_item_fence(flags, memory_order_release, scope);
        __hsail_barrier();
        atomic_work_item_fence(flags, memory_order_acquire, scope);
    } else
        __hsail_barrier();
}

__attribute__((overloadable, weak, always_inline)) void
work_group_barrier(cl_mem_fence_flags flags)
{
    work_group_barrier(flags, memory_scope_work_group);
}

#endif

