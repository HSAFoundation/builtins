extern __attribute__((const)) float __gcn_min_f32(float,float);

__attribute__((overloadable, always_inline)) float
min(float x, float y)
{
    return __gcn_min_f32(x, y);
}

extern __attribute__((const)) double __gcn_min_f64(double,double);

__attribute__((overloadable, always_inline)) double
min(double x, double y)
{
    return __gcn_min_f64(x, y);
}

extern __attribute__((const)) float __gcn_max_f32(float,float);

__attribute__((overloadable, always_inline)) float
max(float x, float y)
{
    return __gcn_max_f32(x, y);
}

extern __attribute__((const)) double __gcn_max_f64(double,double);

__attribute__((overloadable, always_inline)) double
max(double x, double y)
{
    return __gcn_max_f64(x, y);
}
