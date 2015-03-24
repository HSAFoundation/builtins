
#include "math32.h"
extern __attribute__((const)) int __hsail_class_f32(float, int);

__attribute__((overloadable, always_inline)) float
log(float x)
{
    float y = native_log2(x);
    float r;

    if (HAVE_FAST_FMA32()) {
        const float c = 0x1.62e42ep-1f;
        const float cc = 0x1.efa39ep-25f; // c + cc is ln(2) to more than 49 bits
        r = y * c;
        r = r + fma(y, cc, fma(y, c, -r));
    } else {
        const float ch = 0x1.62e000p-1f;
        const float ct = 0x1.0bfbe8p-15f; // ch + ct is ln(2) to more than 36 bits
        float yh = as_float(as_int(y) & 0xfffff000);
        float yt = y - yh;
        r = mad(yh, ch, mad(yt, ch, mad(yh, ct, yt*ct)));
    }

    r = __hsail_class_f32(y, SNAN|QNAN|NINF|PINF) != 0 ? y : r;
    return r;
}
