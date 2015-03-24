
#include "math32.h"
extern __attribute__((const)) int __hsail_class_f32(float, int);

__attribute__((overloadable, always_inline)) float
log10(float x)
{
    float y = native_log2(x);
    float r;

    if (HAVE_FAST_FMA32()) {
        const float c = 0x1.344134p-2f;
        const float cc = 0x1.09f79ep-26f; // c+cc are ln(2)/ln(10) to more than 49 bits
        r = y * c;
        r = r + fma(y, cc, fma(y, c, -r));
    } else {
        const float ch = 0x1.344000p-2f;
        const float ct = 0x1.3509f6p-18f; // ch+ct is ln(2)/ln(10) to more than 36 bits
        float yh = as_float(as_int(y) & 0xfffff000);
        float yt = y - yh;
        r = mad(yh, ch, mad(yt, ch, mad(yh, ct, yt*ct)));
    }

    r = __hsail_class_f32(y, SNAN|QNAN|NINF|PINF) != 0 ? y : r;
    return r;
}

