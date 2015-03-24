#pragma OPENCL EXTENSION cl_khr_subgroups : enable

extern void __hsail_wavebarrier(void);
extern __attribute__((pure)) uint __hsail_activelanecount_wavewidth_u32_b1(bool);

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) int
sub_group_all(int predicate)
{
    uint c = __hsail_activelanecount_wavewidth_u32_b1(predicate != 0);
    uint n = __hsail_activelanecount_wavewidth_u32_b1(true);
    __hsail_wavebarrier();
    return n == c;
}

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) int
sub_group_any(int predicate)
{
    uint c = __hsail_activelanecount_wavewidth_u32_b1(predicate != 0);
    __hsail_wavebarrier();
    return c != 0;
}

