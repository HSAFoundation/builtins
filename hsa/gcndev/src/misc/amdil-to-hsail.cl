// __amdil_ to __gcn_ translation  

// GCN intrinsic functions
extern __attribute__((const)) float __gcn_frexp_mant_ftz_f32(float);
extern __attribute__((const)) int   __gcn_frexp_exp_ftz_f32(float);
extern __attribute__((const)) float __gcn_fldexp_ftz_f32(float, int);

extern __attribute__((const)) double __gcn_fldexp_f64(double, int);
extern __attribute__((const)) int    __gcn_frexp_exp_f64(double);
extern __attribute__((const)) double __gcn_frexp_mant_f64(double);
extern __attribute__((const)) double __gcn_trig_preop_f64(double, int);

extern uint __gcn_atomic_append_u32(counter32_t);
extern uint __gcn_atomic_consume_u32(counter32_t);

// GCN media instrinsics
//extern __attribute__((pure)) uint  __gcn_max3_u32(uint, uint, uint);
//extern __attribute__((pure)) int   __gcn_max3_i32(int, int, int);
//extern __attribute__((pure)) float __gcn_max3_f32(float, float, float);
//extern __attribute__((pure)) uint  __gcn_min3_u32(uint, uint, uint);
//extern __attribute__((pure)) int   __gcn_min3_i32(int, int, int);
//extern __attribute__((pure)) float __gcn_min3_f32(float, float, float);
//extern __attribute__((pure)) uint  __gcn_med3_u32(uint, uint, uint);
//extern __attribute__((pure)) int   __gcn_med3_i32(int, int, int);
//extern __attribute__((pure)) float __gcn_med3_f32(float, float, float);
//extern __attribute__((pure)) uint  __gcn_msad_b32(uint, uint, uint);
//extern __attribute__((pure)) ulong __gcn_qsad_b64(ulong, uint, ulong);
//extern __attribute__((pure)) ulong __gcn_mqsad_b64(ulong, uint, ulong);

// __amdil_ math32 function defs
__attribute__((always_inline)) int
__amdil_frexp_exp_f32(float x) {
  return __gcn_frexp_exp_ftz_f32(x);
}

__attribute__((always_inline)) float
__amdil_frexp_mant_f32(float x) {
  return __gcn_frexp_mant_ftz_f32(x);
}

__attribute__((always_inline)) float
__amdil_ldexp_f32(float x, int y) {
  return __gcn_fldexp_ftz_f32(x, y);
}

// __amdil_ math64 function defs
__attribute__((always_inline)) double
__amdil_ldexp_f64(double x, int exp) {
  return __gcn_fldexp_f64(x, exp);
}

__attribute__((always_inline)) int
__amdil_frexp_exp_f64(double x) {
  return __gcn_frexp_exp_f64(x);
}

__attribute__((always_inline)) double
__amdil_frexp_mant_f64(double x) {
  return __gcn_frexp_mant_f64(x);
}

__attribute__((always_inline)) double
__amdil_trig_preop(double x, int y) {
  return __gcn_trig_preop_f64(x, y);
}

// __amdil_ counter32 function defs
__attribute__((always_inline))
uint __amdil_append_alloc_i32(counter32_t p) {
  return __gcn_atomic_append_u32(p);
}

__attribute__((always_inline))
uint __amdil_append_consume_i32(counter32_t p) {
  return __gcn_atomic_consume_u32(p);
}

// GCN media instrinsics
//__attribute__((always_inline)) 
//uint __amdil_max3_u32(uint x, uint y, uint z) {
//  return __gcn_max3_u32(x, y, z);
//}
//
//__attribute__((always_inline)) 
//int __amdil_imax3_i32(int x, int y, int z) {
//  return __gcn_max3_i32(x, y, z);
//}
//
//__attribute__((always_inline)) float 
//__amdil_max3_f32(float x, float y, float z) {
//  return __gcn_max3_f32(x, y, z);
//}
//
//__attribute__((always_inline)) uint 
//__amdil_min3_u32(uint x, uint y, uint z){
//  return __gcn_min3_u32(x, y, z);
//}
//
//__attribute__((always_inline)) 
//int __amdil_imin3_i32(int x, int y, int z) {
//  return __gcn_min3_i32(x, y, z);
//}
//
//__attribute__((always_inline)) 
//float __amdil_min3_f32(float x, float y, float z) {
//  return __gcn_min3_f32(x, y, z);
//}
//
//__attribute__((always_inline)) 
//uint __amdil_med3_u32(uint x, uint y, uint z) {
//  return __gcn_med3_u32(x, y, z);
//}
//
//__attribute__((always_inline)) 
//int __amdil_med3_i32(int x, int y, int z) {
//  return __gcn_med3_i32(x, y, z);
//}
//
//__attribute__((weak,always_inline)) 
//float __amdil_med3_f32(float x, float y, float z) {
//  return __gcn_med3_f32(x, y, z);
//}
//
//__attribute__((weak,always_inline)) 
//uint __amdil_msad_u32(uint x, uint y, uint z) {
//  return __gcn_msad_b32(uint x, uint y, uint z);
//}
//
//__attribute__((weak,always_inline)) 
//ulong __amdil_qsad(ulong x, uint y, ulong z) {
//  return __gcn_qsad_b64(uint x, uint y, uint z);
//}
//
//__attribute__((weak,always_inline)) 
//ulong __amdil_mqsad(ulong x, uint y, ulong z) {
//  return __gcn_mqsad_b64(uint x, uint y, uint z);
//}
//
