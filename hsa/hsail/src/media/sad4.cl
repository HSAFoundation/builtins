
#include "media.h"
#ifdef __clang__
__attribute__((overloadable, always_inline))
#else
__attribute__((always_inline))
#endif
uint amd_sad4(uint4 x, uint4 y, uint z)
{
    uint a = __hsail_sad_u32_u8x4(x.s0,y.s0,z);
    a =  __hsail_sad_u32_u8x4(x.s1,y.s1,a);
    a =  __hsail_sad_u32_u8x4(x.s2,y.s2,a);

    return  __hsail_sad_u32_u8x4(x.s3,y.s3,a);
}

