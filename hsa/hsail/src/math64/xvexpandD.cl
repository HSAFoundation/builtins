
// XXX this file can be removed when clp is implemented

__attribute__((overloadable, always_inline, weak)) double16
fract(double16 x, double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double16
fract(double16 x, __global double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double16
fract(double16 x, __local double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double8
fract(double8 x, double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double8
fract(double8 x, __global double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double8
fract(double8 x, __local double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double4
fract(double4 x, double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double4
fract(double4 x, __global double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double4
fract(double4 x, __local double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double3
fract(double3 x, double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = fract(x.s01, &a);
    t.s01 = a;
    r.s2 = fract(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double3
fract(double3 x, __global double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = fract(x.s01, &a);
    t.s01 = a;
    r.s2 = fract(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double3
fract(double3 x, __local double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = fract(x.s01, &a);
    t.s01 = a;
    r.s2 = fract(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double2
fract(double2 x, double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double2
fract(double2 x, __global double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double2
fract(double2 x, __local double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = fract(x.lo, &a);
    t.lo = a;
    r.hi = fract(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double16
modf(double16 x, double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double16
modf(double16 x, __global double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double16
modf(double16 x, __local double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double8
modf(double8 x, double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double8
modf(double8 x, __global double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double8
modf(double8 x, __local double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double4
modf(double4 x, double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double4
modf(double4 x, __global double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double4
modf(double4 x, __local double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double3
modf(double3 x, double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = modf(x.s01, &a);
    t.s01 = a;
    r.s2 = modf(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double3
modf(double3 x, __global double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = modf(x.s01, &a);
    t.s01 = a;
    r.s2 = modf(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double3
modf(double3 x, __local double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = modf(x.s01, &a);
    t.s01 = a;
    r.s2 = modf(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double2
modf(double2 x, double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double2
modf(double2 x, __global double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double2
modf(double2 x, __local double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = modf(x.lo, &a);
    t.lo = a;
    r.hi = modf(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double16
sincos(double16 x, double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double16
sincos(double16 x, __global double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double16
sincos(double16 x, __local double16 *p)
{
    double16 r;
    double16 t;
    double8 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double8
sincos(double8 x, double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double8
sincos(double8 x, __global double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double8
sincos(double8 x, __local double8 *p)
{
    double8 r;
    double8 t;
    double4 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double4
sincos(double4 x, double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double4
sincos(double4 x, __global double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double4
sincos(double4 x, __local double4 *p)
{
    double4 r;
    double4 t;
    double2 a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double3
sincos(double3 x, double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = sincos(x.s01, &a);
    t.s01 = a;
    r.s2 = sincos(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double3
sincos(double3 x, __global double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = sincos(x.s01, &a);
    t.s01 = a;
    r.s2 = sincos(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double3
sincos(double3 x, __local double3 *p)
{
    double3 r;
    double3 t;
    double2 a;
    double b;

    r.s01 = sincos(x.s01, &a);
    t.s01 = a;
    r.s2 = sincos(x.s2, &b);
    t.s2 = b;

    *p = t;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) double2
sincos(double2 x, double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double2
sincos(double2 x, __global double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) double2
sincos(double2 x, __local double2 *p)
{
    double2 r;
    double2 t;
    double a;
    

    r.lo = sincos(x.lo, &a);
    t.lo = a;
    r.hi = sincos(x.hi, &a);
    t.hi = a;

    *p = t;
    return r;
}

#endif
