
extern float __amdil_double_to_half_f64(double op1);
extern float __amdil_double_to_half_near_f64(double op1);
extern float __amdil_double_to_half_neg_inf_f64(double op1);
extern float __amdil_double_to_half_plus_inf_f64(double op1);

// double -> half rte
__attribute__((always_inline)) ushort
__cvt_f64_to_f16_rte(double a)
{
    return (ushort)as_uint(__amdil_double_to_half_near_f64(a));
}

__attribute__((always_inline)) ushort2
__cvt_2f64_to_2f16_rte(double2 f)
{
    ushort2 ret;
    ret.s0 = __cvt_f64_to_f16_rte(f.s0);
    ret.s1 = __cvt_f64_to_f16_rte(f.s1);
    return ret;
}

__attribute__((always_inline)) ushort3
__cvt_3f64_to_3f16_rte(double3 f)
{
    ushort3 ret;
    ret.lo = __cvt_2f64_to_2f16_rte(f.lo);
    ret.s2 = __cvt_f64_to_f16_rte(f.s2);
    return ret;
}

__attribute__((always_inline)) ushort4
__cvt_4f64_to_4f16_rte(double4 f)
{
    ushort4 ret;
    ret.lo = __cvt_2f64_to_2f16_rte(f.lo);
    ret.hi = __cvt_2f64_to_2f16_rte(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort8
__cvt_8f64_to_8f16_rte(double8 f)
{
    ushort8 ret;
    ret.lo = __cvt_4f64_to_4f16_rte(f.lo);
    ret.hi = __cvt_4f64_to_4f16_rte(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort16
__cvt_16f64_to_16f16_rte(double16 f)
{
    ushort16 ret;
    ret.lo = __cvt_8f64_to_8f16_rte(f.lo);
    ret.hi = __cvt_8f64_to_8f16_rte(f.hi);
    return ret;
}

// double -> half cur
// XXX assumes RTE
__attribute__((always_inline)) ushort
__cvt_f64_to_f16_cur(double f)
{
    return __cvt_f64_to_f16_rte(f);
}

__attribute__((always_inline)) ushort2
__cvt_2f64_to_2f16_cur(double2 f)
{
    return __cvt_2f64_to_2f16_rte(f);
}

__attribute__((always_inline)) ushort3
__cvt_3f64_to_3f16_cur(double3 f)
{
    return __cvt_3f64_to_3f16_rte(f);
}

__attribute__((always_inline)) ushort4
__cvt_4f64_to_4f16_cur(double4 f)
{
    return __cvt_4f64_to_4f16_rte(f);
}

__attribute__((always_inline)) ushort8
__cvt_8f64_to_8f16_cur(double8 f)
{
    return __cvt_8f64_to_8f16_rte(f);
}

__attribute__((always_inline)) ushort16
__cvt_16f64_to_16f16_cur(double16 f)
{
    return __cvt_16f64_to_16f16_rte(f);
}

//double -> half rtp

ushort
__cvt_f64_to_f16_rtp(double a)
{
    return (ushort)as_uint(__amdil_double_to_half_plus_inf_f64(a));
}

__attribute__((always_inline)) ushort2
__cvt_2f64_to_2f16_rtp(double2 f)
{
    ushort2 ret;
    ret.s0 = __cvt_f64_to_f16_rtp(f.s0);
    ret.s1 = __cvt_f64_to_f16_rtp(f.s1);
    return ret;
}

__attribute__((always_inline)) ushort3
__cvt_3f64_to_3f16_rtp(double3 f)
{
    ushort3 ret;
    ret.lo = __cvt_2f64_to_2f16_rtp(f.lo);
    ret.s2 = __cvt_f64_to_f16_rtp(f.s2);
    return ret;
}

__attribute__((always_inline)) ushort4
__cvt_4f64_to_4f16_rtp(double4 f)
{
    ushort4 ret;
    ret.lo = __cvt_2f64_to_2f16_rtp(f.lo);
    ret.hi = __cvt_2f64_to_2f16_rtp(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort8
__cvt_8f64_to_8f16_rtp(double8 f)
{
    ushort8 ret;
    ret.lo = __cvt_4f64_to_4f16_rtp(f.lo);
    ret.hi = __cvt_4f64_to_4f16_rtp(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort16
__cvt_16f64_to_16f16_rtp(double16 f)
{
    ushort16 ret;
    ret.lo = __cvt_8f64_to_8f16_rtp(f.lo);
    ret.hi = __cvt_8f64_to_8f16_rtp(f.hi);
    return ret;
}

// double -> half rtn

ushort
__cvt_f64_to_f16_rtn(double a)
{
    return (ushort)as_uint(__amdil_double_to_half_neg_inf_f64(a));
}

__attribute__((always_inline)) ushort2
__cvt_2f64_to_2f16_rtn(double2 f)
{
    ushort2 ret;
    ret.s0 = __cvt_f64_to_f16_rtn(f.s0);
    ret.s1 = __cvt_f64_to_f16_rtn(f.s1);
    return ret;
}

__attribute__((always_inline)) ushort3
__cvt_3f64_to_3f16_rtn(double3 f)
{
    ushort3 ret;
    ret.lo = __cvt_2f64_to_2f16_rtn(f.lo);
    ret.s2 = __cvt_f64_to_f16_rtn(f.s2);
    return ret;
}

__attribute__((always_inline)) ushort4
__cvt_4f64_to_4f16_rtn(double4 f)
{
    ushort4 ret;
    ret.lo = __cvt_2f64_to_2f16_rtn(f.lo);
    ret.hi = __cvt_2f64_to_2f16_rtn(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort8
__cvt_8f64_to_8f16_rtn(double8 f)
{
    ushort8 ret;
    ret.lo = __cvt_4f64_to_4f16_rtn(f.lo);
    ret.hi = __cvt_4f64_to_4f16_rtn(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort16
__cvt_16f64_to_16f16_rtn(double16 f)
{
    ushort16 ret;
    ret.lo = __cvt_8f64_to_8f16_rtn(f.lo);
    ret.hi = __cvt_8f64_to_8f16_rtn(f.hi);
    return ret;
}

// double -> half rtz

ushort
__cvt_f64_to_f16_rtz(double a)
{
    return (ushort)as_uint(__amdil_double_to_half_f64(a));
}

__attribute__((always_inline)) ushort2
__cvt_2f64_to_2f16_rtz(double2 f)
{
    ushort2 ret;
    ret.s0 = __cvt_f64_to_f16_rtz(f.s0);
    ret.s1 = __cvt_f64_to_f16_rtz(f.s1);
    return ret;
}

__attribute__((always_inline)) ushort3
__cvt_3f64_to_3f16_rtz(double3 f)
{
    ushort3 ret;
    ret.lo = __cvt_2f64_to_2f16_rtz(f.lo);
    ret.s2 = __cvt_f64_to_f16_rtz(f.s2);
    return ret;
}

__attribute__((always_inline)) ushort4
__cvt_4f64_to_4f16_rtz(double4 f)
{
    ushort4 ret;
    ret.lo = __cvt_2f64_to_2f16_rtz(f.lo);
    ret.hi = __cvt_2f64_to_2f16_rtz(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort8
__cvt_8f64_to_8f16_rtz(double8 f)
{
    ushort8 ret;
    ret.lo = __cvt_4f64_to_4f16_rtz(f.lo);
    ret.hi = __cvt_4f64_to_4f16_rtz(f.hi);
    return ret;
}

__attribute__((always_inline)) ushort16
__cvt_16f64_to_16f16_rtz(double16 f)
{
    ushort16 ret;
    ret.lo = __cvt_8f64_to_8f16_rtz(f.lo);
    ret.hi = __cvt_8f64_to_8f16_rtz(f.hi);
    return ret;
}

