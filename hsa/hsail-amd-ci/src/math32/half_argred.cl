
#include "math32.h"

__attribute__((always_inline)) int
__hsa_argredhalf_f32(float *r, float x)
{
    const float twobypi = 0x1.45f306p-1f;
    const float pb2_a = 0x1.92p+0f;
    const float pb2_b = 0x1.fap-12f;
    const float pb2_c = 0x1.54p-20f;
    const float pb2_d = 0x1.10p-30f;
    const float pb2_e = 0x1.68p-39f;
    const float pb2_f = 0x1.846988p-48f;

    float fn = rint(x * twobypi);

    *r = mad(fn, -pb2_f,
         mad(fn, -pb2_e,
         mad(fn, -pb2_d,
             mad(fn, -pb2_c,
             mad(fn, -pb2_b,
                 mad(fn, -pb2_a, x))))));
    return (int)fn & 0x3;
}
