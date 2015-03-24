
#include "media.h"

#ifdef __clang__
__attribute__((overloadable, always_inline))
#else
__attribute__((always_inline))
#endif
 uint amd_pack(float4 v)
{
    return __hsail_packcvt_u8x4_f32(v.s0,v.s1,v.s2,v.s3);
}
