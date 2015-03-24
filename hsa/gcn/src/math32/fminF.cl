extern __attribute__((const)) float __hsail_mul_ftz_f32(float,float);
extern __attribute__((const)) float __gcn_min_f32(float,float);

__attribute__((overloadable, always_inline, weak)) float
fmin(float x, float y)
{
    /// \see comments in float fmax source.
    return __gcn_min_f32(__hsail_mul_ftz_f32(x, 1.0F), __hsail_mul_ftz_f32(y, 1.0F));
}
