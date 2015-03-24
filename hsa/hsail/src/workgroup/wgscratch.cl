
#if __OPENCL_C_VERSION >= 200

#include "wg.h"

// Temporary data for work group functions
__local ulong __wg_scratch[MAX_WAVES_PER_SIMD];

#endif
