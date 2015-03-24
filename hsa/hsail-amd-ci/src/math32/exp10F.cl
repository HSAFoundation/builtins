
#include "math32.h"
extern __attribute__((const)) float __hsail_nexp2_f32(float);

__attribute__((overloadable, always_inline)) float
exp10(float x)
{
    float ph, pl;

    if (HAVE_FAST_FMA32()) {
        const float c = 0x1.a934f0p+1f;
        const float cc = 0x1.2f346ep-24f;
        ph = x * c;
        pl = fma(x, cc, fma(x, c, -ph));
    } else {
        const float ch = 0x1.a92000p+1f;
        const float cl = 0x1.4f0978p-11f;
        float xh = as_float(as_int(x) & 0xfffff000);
        float xl = x - xh;
        ph = xh * ch;
        pl = mad(xh, cl, mad(xl, ch, xl*cl));
    }

    float r = __hsail_nexp2_f32(pl) * __hsail_nexp2_f32(ph);

    r = x < -0x1.2f7030p+5f ? 0.0f : r;
    r = x > 0x1.344136p+5f ? INFINITY : r;
    return r;
}

