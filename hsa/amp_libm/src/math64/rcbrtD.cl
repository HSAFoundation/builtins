
#include "math64.h"


double
rcbrt(double x)
{

    USE_TABLE(double, p_inv, CBRT_TBL_INV);
    USE_TABLE(double2, p_rcbrt, RCBRT_TBL);
    USE_TABLE(double2, p_rem,RCBRT_TBL_REM);

    ulong xx = as_ulong(x);
    ulong ux = as_ulong(xx & ~SIGNBIT_DP64);
    ulong sign = xx & SIGNBIT_DP64;
    int m = (as_int2(ux).hi >> 20) - 1023;

    // Treat subnormals
    ulong uxs = as_ulong(as_double(0x3ff0000000000000UL | ux) - 1.0);
    int ms = m + (as_int2(uxs).hi >> 20) - 1022;

    int c = m == -1023;
    ux = c ? uxs : ux;
    m = c ? ms : m;

    int mby3 = m / 3;
    int rem = m - 3*mby3;

    double mf = as_double((ulong)(-mby3 + 1023) << 52);

    ux &= 0x000fffffffffffffUL;
    double Y = as_double(0x3fe0000000000000UL | ux);



    // nearest integer

    int index = as_int2(ux).hi >> 11;
    index = (0x100 | (as_int2(ux).hi  >> 12)) + (index & 1);

    double F = (double)index * 0.001953125;

    double f = Y - F;
    double r = f * p_inv[index-256];

    double z = fma(fma(fma(fma(fma(fma(0x1.C67C9FF9C1CE0p-4,r,-0x1.FF4C33F8FA07Cp-4),
                          r,0x1.26FABB85CB534p-3),
                          r,-0x1.61F9ADD3C0CA4p-3),
                          r,0x1.C71C71C71C71Cp-3),
                          r,-0x1.5555555555555p-2),
                          r,0x1.0000000000000p+0);

    double2 tv = p_rem[rem+2];

    double Rem_h = tv.s0;
    double Rem_t = tv.s1;
    tv = p_rcbrt[index-256];
    double F_h = tv.s0;
    double F_t = tv.s1;



    double b_h = F_h * Rem_h;
    double b_t = fma(Rem_t, F_h, fma(F_t, Rem_h, F_t*Rem_t));

    double ans = fma(z, b_h, z*b_t);
    ans = copysign(ans*mf, x);

    ans = isnan(x) ? x : ans;
	ans = (x == 0) ? as_double(EXPBITS_DP64 | sign ) : ans;
    ans = isinf(x) ? as_double(sign) : ans;
    return ans;


}
