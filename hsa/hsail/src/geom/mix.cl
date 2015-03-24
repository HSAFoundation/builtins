
//extern __attribute__((pure)) float  __amdil_lerp_f32(float,  float,  float);

// TODO_HSA: Validate that fma works for mix
__attribute__((overloadable, weak,always_inline)) float
mix(float x, float y, float a)
{
    //return __amdil_lerp_f32(a, y, x);
    return fma(a, (y - x), x);
}

__attribute__((overloadable, weak,always_inline)) double
mix(double x, double y, double a)
{
    //return x + (y - x) * a;
    return fma(a, (y - x), x);
}

