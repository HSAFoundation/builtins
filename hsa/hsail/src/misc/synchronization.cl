
extern void __hsail_memfence(uint mo, uint gms, uint lms, uint ims);
extern void __hsail_barrier(void);

enum BrigMemoryOrder {
    BRIG_MEMORY_ORDER_NONE = 0,
    BRIG_MEMORY_ORDER_RELAXED = 1,
    BRIG_MEMORY_ORDER_SC_ACQUIRE = 2,
    BRIG_MEMORY_ORDER_SC_RELEASE = 3,
    BRIG_MEMORY_ORDER_SC_ACQUIRE_RELEASE = 4
};

enum BrigMemoryScope {
    BRIG_MEMORY_SCOPE_NONE = 0,
    BRIG_MEMORY_SCOPE_WORKITEM = 1,
    BRIG_MEMORY_SCOPE_WAVEFRONT = 2,
    BRIG_MEMORY_SCOPE_WORKGROUP = 3,
    BRIG_MEMORY_SCOPE_COMPONENT = 4,
    BRIG_MEMORY_SCOPE_SYSTEM = 5
};

void mem_fence_impl(uint val) {
  if (val == CLK_GLOBAL_MEM_FENCE) {
    __hsail_memfence(BRIG_MEMORY_ORDER_SC_ACQUIRE_RELEASE, BRIG_MEMORY_SCOPE_COMPONENT, BRIG_MEMORY_SCOPE_NONE, BRIG_MEMORY_SCOPE_NONE);
  } else if (val == CLK_LOCAL_MEM_FENCE) {
    __hsail_memfence(BRIG_MEMORY_ORDER_SC_ACQUIRE_RELEASE, BRIG_MEMORY_SCOPE_NONE, BRIG_MEMORY_SCOPE_WORKGROUP, BRIG_MEMORY_SCOPE_NONE);
  } else {
    __hsail_memfence(BRIG_MEMORY_ORDER_SC_ACQUIRE_RELEASE, BRIG_MEMORY_SCOPE_COMPONENT, BRIG_MEMORY_SCOPE_WORKGROUP, BRIG_MEMORY_SCOPE_NONE);
  }
}
#ifdef __clang__
__attribute__((overloadable))
#endif
void mem_fence(uint val) {
  mem_fence_impl(val);
}

#ifdef __clang__
__attribute__((overloadable))
#endif
void read_mem_fence(uint val) {
  mem_fence_impl(val);
}

#ifdef __clang__
__attribute__((overloadable))
#endif
void write_mem_fence(uint val) {
  mem_fence_impl(val);
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline))
void barrier(uint flags) {
  __hsail_barrier();
}
