
// XXX The runtime computes CL_DEVICE_MAX_WORK_GROUP_SIZE as
// XXX dev->wave_front_size * dev->max_waves_per_simd
// XXX If max_waves_per_simd is ever raised then this code will need to be updated
#define MAX_WAVES_PER_SIMD  4

#pragma OPENCL EXTENSION cl_amd_program_scope_locals : enable
extern __local ulong __wg_scratch[MAX_WAVES_PER_SIMD];

