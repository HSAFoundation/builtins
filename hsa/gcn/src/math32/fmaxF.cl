extern __attribute__((const)) float __hsail_mul_ftz_f32(float,float);
extern __attribute__((const)) float __gcn_max_f32(float,float);

__attribute__ ((overloadable, always_inline, weak)) float
fmax(float x, float y)
{
    // The multiplications are for sNAN quieting (required and work only when mode.IEEE=1).
    // These also flush denorms (note that this is *not* required by OpenCL even if
    // CL_FP_DENORMS is not reported for floats). HSAIL min/max_ftz have denorm-flushing
    // overhead, HSAIL min/max without ftz would cause denorm mode switching. GCN min/max
    // do not have any overhead and OK while support for float denorms is not required.
    return __gcn_max_f32(__hsail_mul_ftz_f32(x, 1.0F), __hsail_mul_ftz_f32(y, 1.0F));
}
