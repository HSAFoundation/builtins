
#ifdef USE_COUNTER

#pragma OPENCL EXTENSION cl_amd_atomic_counters32 : enable

extern uint __amdil_append_alloc_i32(counter32_t);
extern uint __amdil_append_consume_i32(counter32_t);

__attribute__((overloadable, always_inline)) uint
atomic_inc(counter32_t p)
{
    return __amdil_append_alloc_i32(p);
}

__attribute__((overloadable, always_inline)) uint
atomic_dec(counter32_t p)
{
    // The instruction returns the updated value
    return __amdil_append_consume_i32(p) + 1U;
}

#endif

