#if __OPENCL_C_VERSION__ >= 200

#ifndef NULL
#define NULL 0
#endif

extern __attribute__((const)) uint  __hsail_ld_kernarg_u32(uint);
extern __attribute__((const)) ulong __hsail_ld_kernarg_u64(uint);

#define OFFSET 8

// Atomically reserves space to the printf data buffer and returns a pointer to it
__global char *
__printf_alloc(uint bytes)
{
#if defined __hsail64__
    __global char *ptr = (__global char *)__hsail_ld_kernarg_u64(3*8);
#else
    __global char *ptr = (__global char *)__hsail_ld_kernarg_u32(3*4);
#endif

    uint size = ((__global uint *)ptr)[1];
    uint offset = atomic_load_explicit((__global atomic_uint *)ptr,
                                        memory_order_acquire, memory_scope_device);

    for (;;) {
        if (OFFSET + offset + bytes > size)
            return NULL;

        if (atomic_compare_exchange_strong_explicit((__global atomic_uint *)ptr,
                &offset, offset+bytes, memory_order_acq_rel, memory_order_acquire,
                memory_scope_device))
            break;
    }

    return ptr + OFFSET + offset;
}

#endif
