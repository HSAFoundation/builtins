// __amdil_ to __gcn_ translation  

#ifdef USE_COUNTER

// GCN intrinsic functions
extern uint __gcn_atomic_append_u32(counter32_t);
extern uint __gcn_atomic_consume_u32(counter32_t);

// __amdil_ counter32 function defs
__attribute__((weak, always_inline))
uint __amdil_append_alloc_i32(counter32_t p) {
  return __gcn_atomic_append_u32(p);
}

__attribute__((weak, always_inline))
uint __amdil_append_consume_i32(counter32_t p) {
  return __gcn_atomic_consume_u32(p);
}

#endif