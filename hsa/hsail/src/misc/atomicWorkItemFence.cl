#if __OPENCL_C_VERSION__ >= 200

extern void __hsail_memfence(uint mo, uint gms, uint lms, uint ims);

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

static inline uint get_brig_memory_order(memory_order mo) {
  switch(mo) {
    default : return BRIG_MEMORY_ORDER_NONE;
    case memory_order_relaxed : return BRIG_MEMORY_ORDER_RELAXED;
    case memory_order_release : return BRIG_MEMORY_ORDER_SC_RELEASE;
    case memory_order_acquire : return BRIG_MEMORY_ORDER_SC_ACQUIRE;
    case memory_order_acq_rel :
    case memory_order_seq_cst : return BRIG_MEMORY_ORDER_SC_ACQUIRE_RELEASE;
  }
}

static inline uint get_brig_scope(memory_scope msc) {
  switch(msc) {
    default :  return BRIG_MEMORY_SCOPE_NONE;
    case memory_scope_work_group : return BRIG_MEMORY_SCOPE_WORKGROUP;
    case memory_scope_device : return BRIG_MEMORY_SCOPE_COMPONENT;
    case memory_scope_all_svm_devices : return BRIG_MEMORY_SCOPE_SYSTEM;
    case memory_scope_sub_group : return BRIG_MEMORY_SCOPE_WAVEFRONT;
    case memory_scope_work_item : return BRIG_MEMORY_SCOPE_WORKITEM;
  }
}

static inline uint clamp_brig_scope(uint brig_scope, bool flag, uint min_scope, uint max_scope) {
  if (!flag || brig_scope < min_scope) {
    return BRIG_MEMORY_SCOPE_NONE;
  } else if (brig_scope > max_scope) {
    return max_scope;
  } else {
    return brig_scope;
  }
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) void
atomic_work_item_fence(/*cl_mem_fence_flags*/ unsigned flag, memory_order mo, memory_scope msc) {
  if (mo == memory_order_relaxed) return;

  uint brig_scope = get_brig_scope(msc);
  uint brig_order = get_brig_memory_order(mo);

  uint global_scope = clamp_brig_scope(brig_scope,
                                       flag & CLK_GLOBAL_MEM_FENCE,
                                       BRIG_MEMORY_SCOPE_WAVEFRONT,
                                       BRIG_MEMORY_SCOPE_SYSTEM);

  uint group_scope  = clamp_brig_scope(brig_scope,
                                       flag & CLK_LOCAL_MEM_FENCE,
                                       BRIG_MEMORY_SCOPE_WAVEFRONT,
                                       BRIG_MEMORY_SCOPE_WORKGROUP);

  uint image_scope  = clamp_brig_scope(brig_scope,
                                       flag & CLK_IMAGE_MEM_FENCE,
                                       BRIG_MEMORY_SCOPE_WORKITEM,
                                       BRIG_MEMORY_SCOPE_WORKGROUP);

  if (image_scope != BRIG_MEMORY_SCOPE_NONE) {
    // HSAIL does not allow an image fence to be combined with a global or group fence,
    // so we emit a separate memfence intrinsic
    __hsail_memfence(brig_order, BRIG_MEMORY_SCOPE_NONE, BRIG_MEMORY_SCOPE_NONE, image_scope);
  }

  if (global_scope != BRIG_MEMORY_SCOPE_NONE || group_scope != BRIG_MEMORY_SCOPE_NONE) {
    __hsail_memfence(brig_order, global_scope, group_scope, BRIG_MEMORY_SCOPE_NONE);
  }
}
#endif // __OPENCL_C_VERSION__ >= 200
