
#include "math32.h"


float
rcbrtf(float x)
{

    USE_TABLE(uint, p_inv, RCBRT_TBL_INV_F);
    USE_TABLE(uint2, p_rcbrt, RCBRT_TBL_F);
    USE_TABLE(uint2, p_rem,RCBRT_TBL_REM_F);


    uint xi = as_uint(x);
    uint axi = xi & EXSIGNBIT_SP32;
    uint exp = axi >> EXPSHIFTBITS_SP32;

    int m,m1;
    float tx;

    int mby3,mby31;
    tx =  as_float(axi | ONEEXPBITS_SP32) - 1.0;
    tx =  exp  == 0? tx : x;
    uint exp2 = as_uint(tx) >> 23;

    m =  (int)exp2 - 253;
    mby3 =  (int)((exp2+2)/3 - 85);
    m1 = (int)exp - 127;
    mby31 = (int)((exp+2)/3) - 43;

    m =  exp  == 0? m:m1;
    mby3 = exp  == 0? mby3:mby31;

    int rem = m - 3*mby3;

    float mf = as_float((-mby3 + EXPBIAS_SP32) << EXPSHIFTBITS_SP32);
    uint utx = as_uint(tx);

    utx &= 0x007fffff;
    float Y = as_float(utx | 0x3f000000);


    int index = ((int)(utx >> 17) & 1) + ((int)(utx >> 18) | 0x20);

    float F = (float)index * 0.015625;

    float f = (Y - F);

    float r = f * as_float(p_inv[index-32]);

    float z = fma(fma(fma(as_float(0xbe30fcd7), r, as_float(0x3e638e39)), r, as_float(0xbeaaaaab)), r, 0x1.0p0f);


    float2 tv = as_float2(p_rem[rem + 2]);
    float Rem_h = tv.s0;
    float Rem_t = tv.s1;
    tv = as_float2(p_rcbrt[index-32]);
    float F_h = tv.s0;
    float F_t = tv.s1;

    float bH = F_h * Rem_h;
    float bT = fma(Rem_t, F_h,fma(F_t, Rem_h, F_t*Rem_t));

    float ans = fma(z, bH, z*bT);

    ans = copysign(ans*mf, x);
    ans = isnan(x) ? as_float(xi | 0x00400000u) : ans;
    ans = isinf(x) ? as_float(xi & SIGNBIT_SP32): ans;
    ans  = axi == 0 ? as_float(EXPBITS_SP32 | (xi & SIGNBIT_SP32) ) : ans;
    return  ans;

}

