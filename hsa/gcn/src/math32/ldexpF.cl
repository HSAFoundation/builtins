extern __attribute__((const)) float __gcn_fldexp_ftz_f32(float, int);

__attribute__((overloadable, always_inline, weak)) float
ldexp(float x, int n)
{
    return __gcn_fldexp_ftz_f32(x, n);
}
