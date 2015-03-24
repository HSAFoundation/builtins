#define G(F,T,N) \
__attribute__((overloadable, always_inline)) T##N \
F(T##N x, T##N y) \
{ \
    T##N ret; \
    ret.lo = F(x.lo, y.lo); \
    ret.hi = F(x.hi, y.hi); \
    return ret; \
}

#define G3(F,T) \
__attribute__((overloadable, always_inline)) T##3 \
F(T##3 x, T##3 y) \
{ \
    T##3 ret; \
    ret.s01 = F(x.s01, y.s01);\
    ret.s2 = F(x.s2, y.s2);\
    return ret; \
}

G(min,float,16)
G(min,float,8)
G(min,float,4)
G3(min, float)
G(min,float,2)

extern __attribute__((const)) float __hsail_min_f32(float,float);

__attribute__((weak, overloadable, always_inline)) float
min(float x, float y)
{
    return __hsail_min_f32(x, y);
}

G(min,double,16)
G(min,double,8)
G(min,double,4)
G3(min, double)
G(min,double,2)

extern __attribute__((const)) double __hsail_min_f64(double,double);

__attribute__((weak, overloadable, always_inline)) double
min(double x, double y)
{
    return __hsail_min_f64(x, y);
}

G(max,float,16)
G(max,float,8)
G(max,float,4)
G3(max, float)
G(max,float,2)

extern __attribute__((const)) float __hsail_max_f32(float,float);

__attribute__((weak, overloadable, always_inline)) float
max(float x, float y)
{
    return __hsail_max_f32(x, y);
}

G(max,double,16)
G(max,double,8)
G(max,double,4)
G3(max, double)
G(max,double,2)

extern __attribute__((const)) double __hsail_max_f64(double,double);

__attribute__((weak, overloadable, always_inline)) double
max(double x, double y)
{
    return __hsail_max_f64(x, y);
}
