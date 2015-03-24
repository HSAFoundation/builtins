
#include "math64.h"
#include "tanD_piby4.h"
#include "remainderD_piby2.h"

__attribute__((overloadable)) double
tan(double x)
{
    double y = fabs(x);

    double r, rr;
    int regn;

    if (y < 0x1.0p+30)
        remainder_piby2_medium(y, &r, &rr, &regn);
    else 
        remainder_piby2_large(y, &r, &rr, &regn);

    double2 tt = tan_piby4(r, rr);

    int2 t = as_int2(regn & 1 ? tt.y : tt.x);
    t.hi ^= (x < 0.0) << 31;

    return __amdil_class_f64(x, SNAN|QNAN|PINF|NINF) ? as_double(QNANBITPATT_DP64) : as_double(t);
}

