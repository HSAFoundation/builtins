extern __attribute__((const)) double __gcn_fldexp_f64(double, int);

__attribute__((overloadable, always_inline, weak)) double
ldexp(double x, int n)
{
    return __gcn_fldexp_f64(x, n);
}
