
static inline float
tanf_piby4_new(float x, int regn)
{
    // Core Remez [1,2] approximation to tan(x) on the interval [0,pi/4].
    float r = x * x;

    float a = mad(r, -0.0172032480471481694693109f, 0.385296071263995406715129f);

    float b = mad(r,
	          mad(r, 0.01844239256901656082986661f, -0.51396505478854532132342f),
	          1.15588821434688393452299f);

    float t = mad(x*r, __amdil_improved_div_f32(a, b), x);
    float tr = -MATH_RECIP(t);

    return regn & 1 ? tr : t;
}
