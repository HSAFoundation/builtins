#include "math32.h"
extern __attribute__((const)) float __hsail_nexp2_f32(float);

__attribute__((overloadable, always_inline)) float
exp(float x)
{
    float ph, pl;

    if (HAVE_FAST_FMA32()) {
        const float c = 0x1.715476p+0f;
        const float cc = 0x1.4ae0bep-26; // c+cc are 49 bits
        ph = x * c;
        pl = fma(x, cc, fma(x, c, -ph));
    } else {
        const float ch = 0x1.714000p+0f;
        const float cl = 0x1.47652ap-12; // ch + cl are 36 bits
        float xh = as_float(as_int(x) & 0xfffff000);
        float xl = x - xh;
        ph = xh * ch;
        pl = mad(xh, cl, mad(xl, ch, xl*cl));
    }

    float r = __hsail_nexp2_f32(pl) * __hsail_nexp2_f32(ph);

    r = x < -0x1.5d58a0p+6f ? 0.0f : r;
    r = x > 0x1.62e430p+6f ? INFINITY : r;
    return r;
}
