// AMP precise_math functions
// This is a prototype. This is meant to simulate Precise math functions
// in the AMP Precise_math namespace.

#define UnaryAmpPreciseMathProto(Func,Ty,ArgTy,Suf) Ty __amd_amp_P##Func##Suf(ArgTy x)
#define BinaryAmpPreciseMathProto(Func,Ty,ArgTy1,ArgTy2,Suf) Ty __amd_amp_P##Func##Suf(ArgTy1 x, ArgTy2 y)
#define TernaryAmpPreciseMathProto(Func,Ty,ArgTy1,ArgTy2,ArgTy3,Suf) Ty __amd_amp_P##Func##Suf(ArgTy1 x, ArgTy2 y, ArgTy3 z)

extern float rcbrtf(float x);
extern double rcbrt(double x);
extern float erfinvf(float x);
extern double erfinv(double x);
extern float erfcinvf(float x);
extern double erfcinv(double x);
extern int fpclassifyf(float x);
extern int fpclassify(double x);
extern float scalbnf(float x, int n);
extern float scalbf(float x, float exp);
extern double scalbn(double x, int n);
extern double scalb(double x, double exp);
extern double nearbyint(double x);
extern float nearbyintf(float x);
extern float hsa_fmaf(float a, float b, float c);

UnaryAmpPreciseMathProto(acos,float,float,_f32);
UnaryAmpPreciseMathProto(acos,double,double,_f64);

UnaryAmpPreciseMathProto(acosh,float,float,_f32);
UnaryAmpPreciseMathProto(acosh,double,double,_f64);

UnaryAmpPreciseMathProto(asin,float,float,_f32);
UnaryAmpPreciseMathProto(asin,double,double,_f64);

UnaryAmpPreciseMathProto(asinh,float,float,_f32);
UnaryAmpPreciseMathProto(asinh,double,double,_f64);

UnaryAmpPreciseMathProto(atan,float,float,_f32);
UnaryAmpPreciseMathProto(atan,double,double,_f64);

BinaryAmpPreciseMathProto(atan2,float,float,float,_f32);
BinaryAmpPreciseMathProto(atan2,double,double,double,_f64);

UnaryAmpPreciseMathProto(atanh,float,float,_f32);
UnaryAmpPreciseMathProto(atanh,double,double,_f64);

UnaryAmpPreciseMathProto(cbrt,float,float,_f32);
UnaryAmpPreciseMathProto(cbrt,double,double,_f64);

UnaryAmpPreciseMathProto(ceil,float,float,_f32);
UnaryAmpPreciseMathProto(ceil,double,double,_f64);

BinaryAmpPreciseMathProto(copysign,float,float,float,_f32);
BinaryAmpPreciseMathProto(copysign,double,double,double,_f64);

UnaryAmpPreciseMathProto(cos,float,float,_f32);
UnaryAmpPreciseMathProto(cos,double,double,_f64);

UnaryAmpPreciseMathProto(cosh,float,float,_f32);
UnaryAmpPreciseMathProto(cosh,double,double,_f64);

UnaryAmpPreciseMathProto(cospi,float,float,_f32);
UnaryAmpPreciseMathProto(cospi,double,double,_f64);

UnaryAmpPreciseMathProto(erf,float,float,_f32);
UnaryAmpPreciseMathProto(erf,double,double,_f64);

UnaryAmpPreciseMathProto(erfc,float,float,_f32);
UnaryAmpPreciseMathProto(erfc,double,double,_f64);

UnaryAmpPreciseMathProto(erfcinv,float,float,_f32);
UnaryAmpPreciseMathProto(erfcinv,double,double,_f64);

UnaryAmpPreciseMathProto(erfinv,float,float,_f32);
UnaryAmpPreciseMathProto(erfinv,double,double,_f64);

UnaryAmpPreciseMathProto(exp,float,float,_f32);
UnaryAmpPreciseMathProto(exp,double,double,_f64);

UnaryAmpPreciseMathProto(exp2,float,float,_f32);
UnaryAmpPreciseMathProto(exp2,double,double,_f64);

UnaryAmpPreciseMathProto(exp10,float,float,_f32);
UnaryAmpPreciseMathProto(exp10,double,double,_f64);

UnaryAmpPreciseMathProto(expm1,float,float,_f32);
UnaryAmpPreciseMathProto(expm1,double,double,_f64);

UnaryAmpPreciseMathProto(fabs,float,float,_f32);
UnaryAmpPreciseMathProto(fabs,double,double,_f64);

BinaryAmpPreciseMathProto(fdim,float,float,float,_f32);
BinaryAmpPreciseMathProto(fdim,double,double,double,_f64);

UnaryAmpPreciseMathProto(floor,float,float,_f32);
UnaryAmpPreciseMathProto(floor,double,double,_f64);

TernaryAmpPreciseMathProto(fma,float,float,float,float,_f32);
TernaryAmpPreciseMathProto(fma,double,double,double,double,_f64);

BinaryAmpPreciseMathProto(fmax,float,float,float,_f32);
BinaryAmpPreciseMathProto(fmax,double,double,double,_f64);

BinaryAmpPreciseMathProto(fmin,float,float,float,_f32);
BinaryAmpPreciseMathProto(fmin,double,double,double,_f64);

BinaryAmpPreciseMathProto(fmod,float,float,float,_f32);
BinaryAmpPreciseMathProto(fmod,double,double,double,_f64);

UnaryAmpPreciseMathProto(fpclassify,int,float,_f32);
UnaryAmpPreciseMathProto(fpclassify,int,double,_f64);

BinaryAmpPreciseMathProto(frexp,float,float,int*,_f32);
BinaryAmpPreciseMathProto(frexp,double,double,int*,_f64);

BinaryAmpPreciseMathProto(hypot,float,float,float,_f32);
BinaryAmpPreciseMathProto(hypot,double,double,double,_f64);

UnaryAmpPreciseMathProto(ilogb,int,float,_f32);
UnaryAmpPreciseMathProto(ilogb,int,double,_f64);

UnaryAmpPreciseMathProto(isfinite,int,float,_f32);
UnaryAmpPreciseMathProto(isfinite,int,double,_f64);

UnaryAmpPreciseMathProto(isinf,int,float,_f32);
UnaryAmpPreciseMathProto(isinf,int,double,_f64);

UnaryAmpPreciseMathProto(isnan,int,float,_f32);
UnaryAmpPreciseMathProto(isnan,int,double,_f64);

UnaryAmpPreciseMathProto(isnormal,int,float,_f32);
UnaryAmpPreciseMathProto(isnormal,int,double,_f64);


BinaryAmpPreciseMathProto(ldexp,float,float,int,_f32);
BinaryAmpPreciseMathProto(ldexp,double,double,int,_f64);

BinaryAmpPreciseMathProto(lgamma,float,float,int*,_f32);
BinaryAmpPreciseMathProto(lgamma,double,double,int*,_f64);


UnaryAmpPreciseMathProto(log,float,float,_f32);
UnaryAmpPreciseMathProto(log,double,double,_f64);

UnaryAmpPreciseMathProto(log10,float,float,_f32);
UnaryAmpPreciseMathProto(log10,double,double,_f64);

UnaryAmpPreciseMathProto(log1p,float,float,_f32);
UnaryAmpPreciseMathProto(log1p,double,double,_f64);


UnaryAmpPreciseMathProto(log2,float,float,_f32);
UnaryAmpPreciseMathProto(log2,double,double,_f64);

UnaryAmpPreciseMathProto(logb,float,float,_f32);
UnaryAmpPreciseMathProto(logb,double,double,_f64);


BinaryAmpPreciseMathProto(modf,float,float,float*,_f32);
BinaryAmpPreciseMathProto(modf,double,double,double*,_f64);

UnaryAmpPreciseMathProto(nan,float,int,_f32);
UnaryAmpPreciseMathProto(nan,double,int,_f64);

UnaryAmpPreciseMathProto(nearbyint,float,float,_f32);
UnaryAmpPreciseMathProto(nearbyint,double,double,_f64);

BinaryAmpPreciseMathProto(nextafter,float,float,float,_f32);
BinaryAmpPreciseMathProto(nextafter,double,double,double,_f64);


BinaryAmpPreciseMathProto(pow,float,float,float,_f32);
BinaryAmpPreciseMathProto(pow,double,double,double,_f64);

UnaryAmpPreciseMathProto(rcbrt,float,float, _f32);
UnaryAmpPreciseMathProto(rcbrt,double,double,_f64);


BinaryAmpPreciseMathProto(remainder,float,float,float,_f32);
BinaryAmpPreciseMathProto(remainder,double,double,double,_f64);

TernaryAmpPreciseMathProto(remquo,float,float,float,int *,_f32);
TernaryAmpPreciseMathProto(remquo,double,double,double,int*,_f64);


UnaryAmpPreciseMathProto(round,float,float,_f32);
UnaryAmpPreciseMathProto(round,double,double,_f64);


UnaryAmpPreciseMathProto(rsqrt,float,float,_f32);
UnaryAmpPreciseMathProto(rsqrt,double,double,_f64);

BinaryAmpPreciseMathProto(scalb,float,float,float,_f32);
BinaryAmpPreciseMathProto(scalb,double,double,double,_f64);

BinaryAmpPreciseMathProto(scalbn,float,float,int,_f32);
BinaryAmpPreciseMathProto(scalbn,double,double,int,_f64);

UnaryAmpPreciseMathProto(signbit,int,float,_f32);
UnaryAmpPreciseMathProto(signbit,int,double,_f64);


UnaryAmpPreciseMathProto(sin,float,float,_f32);
UnaryAmpPreciseMathProto(sin,double,double,_f64);

TernaryAmpPreciseMathProto(sincosf,void,float,float*,float*,_f32);
TernaryAmpPreciseMathProto(sincos,void,double,double*,double*,_f64);

UnaryAmpPreciseMathProto(sinh,float,float,_f32);
UnaryAmpPreciseMathProto(sinh,double,double,_f64);

UnaryAmpPreciseMathProto(sinpi,float,float,_f32);
UnaryAmpPreciseMathProto(sinpi,double,double,_f64);

UnaryAmpPreciseMathProto(sqrt,float,float,_f32);
UnaryAmpPreciseMathProto(sqrt,double,double,_f64);

UnaryAmpPreciseMathProto(tan,float,float,_f32);
UnaryAmpPreciseMathProto(tan,double,double,_f64);

UnaryAmpPreciseMathProto(tanh,float,float,_f32);
UnaryAmpPreciseMathProto(tanh,double,double,_f64);

UnaryAmpPreciseMathProto(tanpi,float,float,_f32);
UnaryAmpPreciseMathProto(tanpi,double,double,_f64);


UnaryAmpPreciseMathProto(tgamma,float,float,_f32);
UnaryAmpPreciseMathProto(tgamma,double,double,_f64);

UnaryAmpPreciseMathProto(trunc,float,float,_f32);
UnaryAmpPreciseMathProto(trunc,double,double,_f64);

