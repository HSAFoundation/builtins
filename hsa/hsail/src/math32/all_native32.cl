// HSAIL versions of native built-ins

// HSAIL intrinsic functions
extern __attribute__((const)) float __hsail_ncos_f32(float);
extern __attribute__((const)) float __hsail_nexp2_f32(float);
extern __attribute__((const)) float __hsail_nlog2_f32(float);
extern __attribute__((const)) float __hsail_nrcp_f32(float);
extern __attribute__((const)) float __hsail_nrsqrt_f32(float);
extern __attribute__((const)) float __hsail_nsin_f32(float);
extern __attribute__((const)) float __hsail_nsqrt_f32(float);

// Value of log2(10)
#define M_LOG2_10_F  3.32192809488736f
// Value of 1 / log2(10)
#define M_RLOG2_10_F 0.30102999566398f
// Value of 1 / M_LOG2E_F = 1 / log2(e)
#define M_RLOG2_E_F  0.69314718055995f


__attribute__((overloadable, always_inline)) float
native_cos(float x) {
    return __hsail_ncos_f32(x);
}

__attribute__((overloadable, always_inline)) float
native_divide(float x, float y) {
    return native_recip(y)*x;
}

__attribute__((overloadable, always_inline)) float
native_exp2(float x) {
    return __hsail_nexp2_f32(x);
}

__attribute__((overloadable,weak,always_inline)) float
native_exp(float f) {
  // There is no native exp in HSAIL, but we have exp2 instruction.
  return __hsail_nexp2_f32(M_LOG2E_F*f);
}

__attribute__((overloadable,weak,always_inline)) float
native_exp10(float f) {
  // There is no native exp10 in HSAIL, but we have exp2 instruction.
  return __hsail_nexp2_f32(M_LOG2_10_F*f);
}

__attribute__((overloadable, always_inline)) float
native_log2(float x) {
    return __hsail_nlog2_f32(x);
}

__attribute__((overloadable,weak,always_inline)) float
native_log(float f) {
  // There is no native log in HSAIL, but we have log2 instruction.
  return __hsail_nlog2_f32(f)*M_RLOG2_E_F;
}

__attribute__((overloadable,weak,always_inline)) float
native_log10(float f) {
  // There is no native log10 in HSAIL, but we have log2 instruction.
  return __hsail_nlog2_f32(f)*M_RLOG2_10_F;
}

__attribute__((overloadable, always_inline)) float
native_powr(float x, float y)
{
    return native_exp2(native_log2(x)*y);
}

__attribute__((overloadable, always_inline)) float
native_recip(float x) {
    return __hsail_nrcp_f32(x);
}

__attribute__((overloadable, always_inline)) float
native_rsqrt(float x)
{
    return __hsail_nrsqrt_f32(x);
}

__attribute__((overloadable, always_inline)) float
native_sin(float x) {
    return __hsail_nsin_f32(x);
}

__attribute__((overloadable, always_inline)) float
native_sqrt(float x) {
    return __hsail_nsqrt_f32(x);
}

extern __attribute__((pure)) float __amdil_tan_f32(float,float);
__attribute__((overloadable, always_inline)) float
native_tan(float x)
{
    return native_sin(x)*native_recip(native_cos(x));
}
