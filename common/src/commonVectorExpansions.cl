
#if defined USE_APPLE

#ifdef USE_POPCNT
#pragma OPENCL EXTENSION cl_amd_popcnt : enable
#endif

#define UnaryMathInOut(oty, ity, fun) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(ity##16 a) \
{ \
    oty##16 c; \
    c.lo = fun(a.lo); \
    c.hi = fun(a.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(ity##8 a) \
{ \
    oty##8 c; \
    c.lo = fun(a.lo); \
    c.hi = fun(a.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(ity##4 a) \
{ \
    oty##4 c; \
    c.lo = fun(a.lo); \
    c.hi = fun(a.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(ity##3 a) \
{ \
    oty##3 c; \
    c.xy = fun(a.xy); \
    c.z = fun(a.z); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(ity##2 a) \
{ \
    oty##2 c; \
    c.lo = fun(a.lo); \
    c.hi = fun(a.hi); \
    return c; \
}

#define UnaryMath(ty, fun)  \
UnaryMathInOut(ty, ty, fun)

#define BinaryMathAllDiffSingle(oty, ity1, ity2, fun) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(ity1##16 a, ity2##16 b) \
{ \
    oty##16 c; \
    c.lo = fun(a.lo, b.lo); \
    c.hi = fun(a.hi, b.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(ity1##8 a, ity2##8 b) \
{ \
    oty##8 c; \
    c.lo = fun(a.lo, b.lo); \
    c.hi = fun(a.hi, b.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(ity1##4 a, ity2##4 b) \
{ \
    oty##4 d; \
    d.lo = fun(a.lo, b.lo); \
    d.hi = fun(a.hi, b.hi); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(ity1##3 a, ity2##3 b) \
{ \
    oty##3 d; \
    d.xy = fun(a.xy, b.xy); \
    d.z = fun(a.z, b.z); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(ity1##2 a, ity2##2 b) \
{ \
    oty##2 d; \
    d.lo = fun(a.lo, b.lo); \
    d.hi = fun(a.hi, b.hi); \
    return d; \
}

#define BinaryMathAllDiff(oty, ity1, ity2, fun) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(ity1##16 a, ity2##16 b) \
{ \
    oty##16 c; \
    c.lo = fun(a.lo, b.lo); \
    c.hi = fun(a.hi, b.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(ity1##8 a, ity2##8 b) \
{ \
    oty##8 c; \
    c.lo = fun(a.lo, b.lo); \
    c.hi = fun(a.hi, b.hi); \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(ity1##4 a, ity2##4 b) \
{ \
    oty##4 d; \
    d.lo = fun(a.lo, b.lo); \
    d.hi = fun(a.hi, b.hi); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(ity1##3 a, ity2##3 b) \
{ \
    oty##3 d; \
    d.xy = fun(a.xy, b.xy); \
    d.z = fun(a.z, b.z); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(ity1##2 a, ity2##2 b) \
{ \
    oty##2 d; \
    d.lo = fun(a.lo, b.lo); \
    d.hi = fun(a.hi, b.hi); \
    return d; \
}

#define BinaryMath(ty, fun) \
BinaryMathAllDiffSingle(ty, ty, ty, fun)

#define BinaryMathInOut(oty, ity, fun) \
BinaryMathAllDiff(oty, ity, ity, fun)

#define BinaryPtrMathDiff(oty, pty, fun, spc) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(oty##16 a, spc pty##16* b) \
{ \
    oty##16 c; \
    pty##8 d;  \
    pty##16 t; \
    c.lo = fun(a.lo, &d);  \
    t.lo = d; \
    c.hi = fun(a.hi, &d);  \
    t.hi = d; \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(oty##8 a, spc pty##8* b) \
{ \
    oty##8 c; \
    pty##4 d; \
    pty##8 t; \
    c.lo = fun(a.lo, &d); \
    t.lo = d; \
    c.hi = fun(a.hi, &d); \
    t.hi = d; \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(oty##4 a, spc pty##4* b) \
{ \
    oty##4 c; \
    pty##2 d; \
    pty##4 t; \
    c.lo = fun(a.lo, &d); \
    t.lo = d; \
    c.hi = fun(a.hi, &d); \
    t.hi = d; \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(oty##3 a, spc pty##3* b) \
{ \
    oty##3 c; \
    pty##2 d2; \
    pty d;  \
    pty##3 t; \
    c.xy = fun(a.xy, &d2);  \
    t.xy = d2;  \
    c.z = fun(a.z, &d);  \
    t.z = d;  \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(oty##2 a, spc pty##2* b) \
{ \
    oty##2 c; \
    pty d; \
    pty##2 t; \
    c.lo = fun(a.lo, &d);  \
    t.lo = d;  \
    c.hi = fun(a.hi, &d);  \
    t.hi = d;  \
    *b = t; \
    return c; \
}

#define BinaryPtrMath(oty, pty, fun, spc) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(oty##16 a, spc pty##16* b) \
{ \
    oty##16 c; \
    pty##8 d; \
    pty##16 t; \
    c.lo = fun(a.lo, &d);  \
    t.lo = d;  \
    c.hi = fun(a.hi, &d);  \
    t.hi = d;  \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(oty##8 a, spc pty##8* b) \
{ \
    oty##8 c; \
    pty##4 d; \
    pty##8 t; \
    c.lo = fun(a.lo, &d); \
    t.lo = d;  \
    c.hi = fun(a.hi, &d); \
    t.hi = d;  \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(oty##4 a, spc pty##4* b) \
{ \
    oty##4 c; \
    pty##2 d; \
    pty##4 t; \
    c.lo = fun(a.lo, &d);  \
    t.lo = d;  \
    c.hi = fun(a.hi, &d);  \
    t.hi = d;  \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(oty##3 a, spc pty##3* b) \
{ \
    oty##3 c; \
    pty##2 d2; \
    pty d; \
    pty##3 t; \
    c.xy = fun(a.xy, &d2);  \
    t.xy = d2;  \
    c.z = fun(a.z, &d);  \
    t.z = d;  \
    *b = t; \
    return c; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(oty##2 a, spc pty##2* b) \
{ \
    oty##2 c; \
    pty d; \
    pty##2 t; \
    c.lo = fun(a.lo, &d);  \
    t.lo = d;  \
    c.hi = fun(a.hi, &d);  \
    t.hi = d;  \
    *b = t; \
    return c; \
}

#define BinaryScalarMath(ty, Scalar, fun) \
BinaryMathAllDiff(ty, ty, Scalar, fun)

#define TernaryMathAllDiff(oty, ity1, ity2, ity3, fun) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(ity1##16 a, ity2##16 b, ity3##16 c) \
{ \
    oty##16 d; \
    d.lo = fun(a.lo, b.lo, c.lo); \
    d.hi = fun(a.hi, b.hi, c.hi); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(ity1##8 a, ity2##8 b, ity3##8 c) \
{ \
    oty##8 d; \
    d.lo = fun(a.lo, b.lo, c.lo); \
    d.hi = fun(a.hi, b.hi, c.hi); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(ity1##4 a, ity2##4 b, ity3##4 c) \
{ \
    oty##4 d; \
    d.lo = fun(a.lo, b.lo, c.lo); \
    d.hi = fun(a.hi, b.hi, c.hi); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(ity1##3 a, ity2##3 b, ity3##3 c) \
{ \
    oty##3 d; \
    d.xy = fun(a.xy, b.xy, c.xy); \
    d.z = fun(a.z, b.z, c.z); \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(ity1##2 a, ity2##2 b, ity3##2 c) \
{ \
    oty##2 d; \
    d.lo = fun(a.lo, b.lo, c.lo); \
    d.hi = fun(a.hi, b.hi, c.hi); \
    return d; \
}

#define TernaryMath(ty, fun) \
TernaryMathAllDiff(ty, ty, ty, ty, fun)

#define TernaryPtrMath(oty, pty, fun, spc) \
__attribute__((overloadable, always_inline, weak)) oty##16 \
fun(oty##16 a, oty##16 b, spc pty##16* c) \
{ \
    oty##16 d; \
    pty##8 e; \
    pty##16 t; \
    d.lo = fun(a.lo, b.lo, &e); \
    t.lo = e;  \
    d.hi = fun(a.hi, b.hi, &e); \
    t.hi = e;  \
    *c = t; \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##8 \
fun(oty##8 a, oty##8 b, spc pty##8* c) \
{ \
    oty##8 d; \
    pty##4 e; \
    pty##8 t; \
    d.lo = fun(a.lo, b.lo, &e); \
    t.lo = e; \
    d.hi = fun(a.hi, b.hi, &e); \
    t.hi = e; \
    *c = t; \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##4 \
fun(oty##4 a, oty##4 b, spc pty##4* c) \
{ \
    oty##4 d; \
    pty##2 e; \
    pty##4 t; \
    d.lo = fun(a.lo, b.lo, &e); \
    t.lo = e;  \
    d.hi = fun(a.hi, b.hi, &e); \
    t.hi = e;  \
    *c = t; \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##3 \
fun(oty##3 a, oty##3 b, spc pty##3* c) \
{ \
    oty##3 d; \
    pty##2 e2; \
    pty e; \
    pty##3 t; \
    d.xy = fun(a.xy, b.xy, &e2); \
    t.xy = e2;  \
    d.z = fun(a.z, b.z, &e); \
    t.z = e;  \
    *c = t; \
    return d; \
} \
__attribute__((overloadable, always_inline, weak)) oty##2 \
fun(oty##2 a, oty##2 b, spc pty##2* c) \
{ \
    oty##2 d; \
    pty e; \
    pty##2 t; \
    d.lo = fun(a.lo, b.lo, &e); \
    t.lo = e;  \
    d.hi = fun(a.hi, b.hi, &e); \
    t.hi = e;  \
    *c = t; \
    return d; \
}

// Multi-definition macro's	
#define UnaryMathIntGeneric(fun) \
UnaryMath(char, fun) \
UnaryMath(uchar, fun) \
UnaryMath(short, fun) \
UnaryMath(ushort, fun) \
UnaryMath(int, fun) \
UnaryMath(uint, fun) \
UnaryMath(long, fun) \
UnaryMath(ulong, fun)

#define UnaryMathURetGeneric(fun) \
UnaryMathInOut(uchar, char, fun) \
UnaryMathInOut(ushort, short, fun) \
UnaryMathInOut(uint, int, fun) \
UnaryMathInOut(ulong, long, fun) \
UnaryMathInOut(uchar, uchar, fun) \
UnaryMathInOut(ushort, ushort, fun) \
UnaryMathInOut(uint, uint, fun) \
UnaryMathInOut(ulong, ulong, fun)

#define BinaryMathIntGeneric(fun) \
BinaryMath(char, fun) \
BinaryMath(uchar, fun) \
BinaryMath(short, fun) \
BinaryMath(ushort, fun) \
BinaryMath(int, fun) \
BinaryMath(uint, fun) \
BinaryMath(long, fun) \
BinaryMath(ulong, fun)

#define BinaryMathURetGeneric(fun) \
BinaryMathAllDiffSingle(uchar, char, char, fun) \
BinaryMathAllDiffSingle(uchar, uchar, uchar, fun) \
BinaryMathAllDiffSingle(ushort, short, short, fun) \
BinaryMathAllDiffSingle(ushort, ushort, ushort, fun) \
BinaryMathAllDiffSingle(uint, int, int, fun) \
BinaryMathAllDiffSingle(uint, uint, uint, fun) \
BinaryMathAllDiffSingle(ulong, long, long, fun) \
BinaryMathAllDiffSingle(ulong, ulong, ulong, fun)

#define BinaryMathGeneric(fun) \
BinaryMathIntGeneric(fun) \
BinaryMath(float, fun) \
BinaryMath(double, fun)

#define TernaryMathIntGeneric(fun) \
TernaryMath(char, fun) \
TernaryMath(uchar, fun) \
TernaryMath(short, fun) \
TernaryMath(ushort, fun) \
TernaryMath(int, fun) \
TernaryMath(uint, fun) \
TernaryMath(long, fun) \
TernaryMath(ulong, fun)
UnaryMath(float, acos)
UnaryMath(float, acosh)
UnaryMath(float, acospi)
UnaryMath(float, asin)
UnaryMath(float, asinh)
UnaryMath(float, asinpi)
UnaryMath(float, atan)
UnaryMath(float, atanpi)
UnaryMath(float, atanh)
UnaryMath(float, cos)
UnaryMath(float, cosh)
UnaryMath(float, cospi)
UnaryMath(float, sin)
UnaryMath(float, sinh)
UnaryMath(float, sinpi)
UnaryMath(float, tan)
UnaryMath(float, tanh)
UnaryMath(float, tanpi)
UnaryMath(float, cbrt)
UnaryMath(float, ceil)

UnaryMath(double, acos)
UnaryMath(double, acosh)
UnaryMath(double, acospi)
UnaryMath(double, asin)
UnaryMath(double, asinh)
UnaryMath(double, asinpi)
UnaryMath(double, atan)
UnaryMath(double, atanpi)
UnaryMath(double, atanh)
UnaryMath(double, cos)
UnaryMath(double, cosh)
UnaryMath(double, cospi)
UnaryMath(double, sin)
UnaryMath(double, sinh)
UnaryMath(double, sinpi)
UnaryMath(double, tan)
UnaryMath(double, tanh)
UnaryMath(double, tanpi)
UnaryMath(double, cbrt)
UnaryMath(double, ceil)

UnaryMath(float, erf)
UnaryMath(float, erfc)
UnaryMath(float, exp)
UnaryMath(float, exp2)
UnaryMath(float, exp10)
UnaryMath(float, expm1)
UnaryMath(float, fabs)
UnaryMath(float, floor)
UnaryMath(float, lgamma)
UnaryMath(float, log)
UnaryMath(float, log2)
UnaryMath(float, log10)
UnaryMath(float, log1p)
UnaryMath(float, logb)
UnaryMath(float, rint)
UnaryMath(float, round)
UnaryMath(float, rsqrt)
UnaryMath(float, sqrt)
UnaryMath(float, trunc)

UnaryMath(double, erf)
UnaryMath(double, erfc)
UnaryMath(double, exp)
UnaryMath(double, exp2)
UnaryMath(double, exp10)
UnaryMath(double, expm1)
UnaryMath(double, fabs)
UnaryMath(double, floor)
UnaryMath(double, lgamma)
UnaryMath(double, log)
UnaryMath(double, log2)
UnaryMath(double, log10)
UnaryMath(double, log1p)
UnaryMath(double, logb)
UnaryMath(double, rint)
UnaryMath(double, round)
UnaryMath(double, rsqrt)
UnaryMath(double, sqrt)
UnaryMath(double, trunc)

UnaryMath(float, tgamma)

UnaryMath(float, half_cos)
UnaryMath(float, half_exp)
UnaryMath(float, half_exp2)
UnaryMath(float, half_exp10)
UnaryMath(float, half_log)
UnaryMath(float, half_log2)
UnaryMath(float, half_log10)
UnaryMath(float, half_recip)
UnaryMath(float, half_rsqrt)
UnaryMath(float, half_sin)
UnaryMath(float, half_sqrt)
UnaryMath(float, half_tan)
UnaryMath(float, native_cos)
UnaryMath(float, native_exp)
UnaryMath(float, native_exp2)
UnaryMath(float, native_exp10)
UnaryMath(float, native_log)
UnaryMath(float, native_log2)
UnaryMath(float, native_log10)
UnaryMath(float, native_recip)
UnaryMath(float, native_rsqrt)
UnaryMath(float, native_sin)
UnaryMath(float, native_sqrt)
UnaryMath(float, native_tan)

BinaryMath(float, half_divide)
BinaryMath(float, half_powr)
BinaryMath(float, native_divide)
BinaryMath(float, native_powr)

UnaryMath(float, sign)
UnaryMath(float, degrees)
UnaryMath(float, radians)

UnaryMath(double, sign)
UnaryMath(double, degrees)
UnaryMath(double, radians)

UnaryMathInOut(float, uint, nan)
UnaryMathInOut(double, ulong, nan)

UnaryMathIntGeneric(clz)

#if __OPENCL_C_VERSION__ >= 200
UnaryMathIntGeneric(ctz)
#endif

#ifdef USE_POPCNT
UnaryMathIntGeneric(popcnt)
#endif

UnaryMathIntGeneric(popcount)

UnaryMathURetGeneric(abs)

UnaryMathInOut(int, float, ilogb)
UnaryMathInOut(int, double, ilogb)

BinaryMath(float, atan2)
BinaryMath(float, atan2pi)
BinaryMath(float, copysign)
BinaryMath(float, fdim)
BinaryMath(float, fmax)
BinaryMath(float, fmin)
BinaryMath(float, fmod)
BinaryMath(float, hypot)
BinaryMath(float, nextafter)
BinaryMath(float, pow)
BinaryMath(float, powr)
BinaryMath(float, remainder)

BinaryMath(double, atan2)
BinaryMath(double, atan2pi)
BinaryMath(double, copysign)
BinaryMath(double, fdim)
BinaryMath(double, fmax)
BinaryMath(double, fmin)
BinaryMath(double, fmod)
BinaryMath(double, hypot)
BinaryMath(double, nextafter)
BinaryMath(double, pow)
BinaryMath(double, powr)
BinaryMath(double, remainder)

BinaryMath(int, mul24)
BinaryMath(uint, mul24)

BinaryMathAllDiff(short, char, uchar, upsample)
BinaryMathInOut(ushort, uchar, upsample)
BinaryMathAllDiff(int, short, ushort, upsample)
BinaryMathInOut(uint, ushort, upsample)
BinaryMathAllDiff(long, int, uint, upsample)
BinaryMathInOut(ulong, uint, upsample)

BinaryMathAllDiff(float, float, int, rootn)
BinaryMathAllDiff(double, double, int, rootn)

BinaryScalarMath(float, int, ldexp)
BinaryScalarMath(double, int, ldexp)

BinaryScalarMath(float, int, pown)
BinaryScalarMath(double, int, pown)

BinaryMathGeneric(max)
BinaryMathGeneric(min)
BinaryMathIntGeneric(add_sat)
BinaryMathIntGeneric(hadd)
BinaryMathIntGeneric(rhadd)
BinaryMathIntGeneric(mul_hi)
BinaryMathIntGeneric(sub_sat)
BinaryMathIntGeneric(rotate)
BinaryMathURetGeneric(abs_diff)

TernaryMath(float, fma)
TernaryMath(float, mad)

TernaryMath(double, fma)
TernaryMath(double, mad)

TernaryMathIntGeneric(mad_hi)
TernaryMathIntGeneric(mad_sat)
TernaryMath(int, mad24)
TernaryMath(uint, mad24)


TernaryMath(float, clamp)
TernaryMath(float, mix)
BinaryMath(float, step)
TernaryMath(float, smoothstep)

TernaryMath(double, clamp)
TernaryMath(double, mix)
BinaryMath(double, step)
TernaryMath(double, smoothstep)

BinaryMath(float, maxmag)
BinaryMath(float, minmag)

BinaryMath(double, maxmag)
BinaryMath(double, minmag)

TernaryMathIntGeneric(clamp)
#endif // USE_APPLE

