// AMP Precise math functions

#include "amp_precise_math.h"


#define UnaryAmpPreciseMathFunc(AmpFunc,OclFunc,Ty,ArgTy,Suf)  \
UnaryAmpPreciseMathProto(AmpFunc,Ty,ArgTy,Suf) \
{ return OclFunc(x); }

#define BinaryAmpPreciseMathFunc(AmpFunc,OclFunc,Ty,ArgTy1,ArgTy2,Suf)  \
BinaryAmpPreciseMathProto(AmpFunc,Ty,ArgTy1,ArgTy2,Suf) \
{ return OclFunc(x,y); }

#define TernaryAmpPreciseMathFunc(AmpFunc,OclFunc,Ty,ArgTy1,ArgTy2,ArgTy3,Suf)  \
TernaryAmpPreciseMathProto(AmpFunc,Ty,ArgTy1,ArgTy2,ArgTy3,Suf) \
{ return OclFunc(x,y,z); }



UnaryAmpPreciseMathFunc(acos,acos,float,float,_f32)
UnaryAmpPreciseMathFunc(acos,acos,double,double,_f64)

UnaryAmpPreciseMathFunc(acosh,acosh,float,float,_f32)
UnaryAmpPreciseMathFunc(acosh,acosh,double,double,_f64)

UnaryAmpPreciseMathFunc(asin,asin,float,float,_f32)
UnaryAmpPreciseMathFunc(asin,asin,double,double,_f64)

UnaryAmpPreciseMathFunc(asinh,asinh,float,float,_f32)
UnaryAmpPreciseMathFunc(asinh,asinh,double,double,_f64)

UnaryAmpPreciseMathFunc(atan,atan,float,float,_f32)
UnaryAmpPreciseMathFunc(atan,atan,double,double,_f64)

BinaryAmpPreciseMathFunc(atan2,atan2,float,float,float,_f32)
BinaryAmpPreciseMathFunc(atan2,atan2,double,double,double,_f64)

UnaryAmpPreciseMathFunc(atanh,atanh,float,float,_f32)
UnaryAmpPreciseMathFunc(atanh,atanh,double,double,_f64)

UnaryAmpPreciseMathFunc(cbrt,cbrt,float,float,_f32)
UnaryAmpPreciseMathFunc(cbrt,cbrt,double,double,_f64)

UnaryAmpPreciseMathFunc(ceil,ceil,float,float,_f32)
UnaryAmpPreciseMathFunc(ceil,ceil,double,double,_f64)

BinaryAmpPreciseMathFunc(copysign,copysign,float,float,float,_f32)
BinaryAmpPreciseMathFunc(copysign,copysign,double,double,double,_f64)

UnaryAmpPreciseMathFunc(cos,cos,float,float,_f32)
UnaryAmpPreciseMathFunc(cos,cos,double,double,_f64)

UnaryAmpPreciseMathFunc(cosh,cosh,float,float,_f32)
UnaryAmpPreciseMathFunc(cosh,cosh,double,double,_f64)

UnaryAmpPreciseMathFunc(cospi,cospi,float,float,_f32)
UnaryAmpPreciseMathFunc(cospi,cospi,double,double,_f64)

UnaryAmpPreciseMathFunc(erf,erf,float,float,_f32)
UnaryAmpPreciseMathFunc(erf,erf,double,double,_f64)

UnaryAmpPreciseMathFunc(erfc,erfc,float,float,_f32)
UnaryAmpPreciseMathFunc(erfc,erfc,double,double,_f64)


UnaryAmpPreciseMathFunc(erfcinv,erfcinvf,float,float,_f32)
UnaryAmpPreciseMathFunc(erfcinv,erfcinv,double,double,_f64)

UnaryAmpPreciseMathFunc(erfinv,erfinvf,float,float,_f32)
UnaryAmpPreciseMathFunc(erfinv,erfinv,double,double,_f64)


UnaryAmpPreciseMathFunc(exp,exp,float,float,_f32)
UnaryAmpPreciseMathFunc(exp,exp,double,double,_f64)

UnaryAmpPreciseMathFunc(exp2,exp2,float,float,_f32)
UnaryAmpPreciseMathFunc(exp2,exp2,double,double,_f64)

UnaryAmpPreciseMathFunc(exp10,exp10,float,float,_f32)
UnaryAmpPreciseMathFunc(exp10,exp10,double,double,_f64)

UnaryAmpPreciseMathFunc(expm1,expm1,float,float,_f32)
UnaryAmpPreciseMathFunc(expm1,expm1,double,double,_f64)

UnaryAmpPreciseMathFunc(fabs,fabs,float,float,_f32)
UnaryAmpPreciseMathFunc(fabs,fabs,double,double,_f64)

BinaryAmpPreciseMathFunc(fdim,fdim,float,float,float,_f32)
BinaryAmpPreciseMathFunc(fdim,fdim,double,double,double,_f64)

UnaryAmpPreciseMathFunc(floor,floor,float,float,_f32)
UnaryAmpPreciseMathFunc(floor,floor,double,double,_f64)

TernaryAmpPreciseMathFunc(fma,hsa_fmaf,float,float,float,float,_f32)
TernaryAmpPreciseMathFunc(fma,fma,double,double,double,double,_f64)

BinaryAmpPreciseMathFunc(fmax,max,float,float,float,_f32)
BinaryAmpPreciseMathFunc(fmax,max,double,double,double,_f64)

BinaryAmpPreciseMathFunc(fmin,min,float,float,float,_f32)
BinaryAmpPreciseMathFunc(fmin,min,double,double,double,_f64)

BinaryAmpPreciseMathFunc(fmod,fmod,float,float,float,_f32)
BinaryAmpPreciseMathFunc(fmod,fmod,double,double,double,_f64)


UnaryAmpPreciseMathFunc(fpclassify,fpclassifyf,int,float,_f32)
UnaryAmpPreciseMathFunc(fpclassify,fpclassify,int,double,_f64)


BinaryAmpPreciseMathFunc(frexp,frexp,float,float,int* ,_f32)
BinaryAmpPreciseMathFunc(frexp,frexp,double,double,int*,_f64)

BinaryAmpPreciseMathFunc(hypot,hypot,float,float,float,_f32)
BinaryAmpPreciseMathFunc(hypot,hypot,double,double,double,_f64)

UnaryAmpPreciseMathFunc(ilogb,ilogb,int,float,_f32)
UnaryAmpPreciseMathFunc(ilogb,ilogb,int,double,_f64)

UnaryAmpPreciseMathFunc(isfinite,isfinite,int,float,_f32)
UnaryAmpPreciseMathFunc(isfinite,isfinite,int,double,_f64)

UnaryAmpPreciseMathFunc(isinf,isinf,int,float,_f32)
UnaryAmpPreciseMathFunc(isinf,isinf,int,double,_f64)

UnaryAmpPreciseMathFunc(isnan,isnan,int,float,_f32)
UnaryAmpPreciseMathFunc(isnan,isnan,int,double,_f64)

UnaryAmpPreciseMathFunc(isnormal,isnormal,int,float,_f32)
UnaryAmpPreciseMathFunc(isnormal,isnormal,int,double,_f64)


BinaryAmpPreciseMathFunc(ldexp,ldexp,float,float,int,_f32)
BinaryAmpPreciseMathFunc(ldexp,ldexp,double,double,int,_f64)

BinaryAmpPreciseMathFunc(lgamma,lgamma_r,float,float,int*,_f32)
BinaryAmpPreciseMathFunc(lgamma,lgamma_r,double,double,int*,_f64)


UnaryAmpPreciseMathFunc(log,log,float,float,_f32)
UnaryAmpPreciseMathFunc(log,log,double,double,_f64)

UnaryAmpPreciseMathFunc(log10,log10,float,float,_f32)
UnaryAmpPreciseMathFunc(log10,log10,double,double,_f64)

UnaryAmpPreciseMathFunc(log1p,log1p,float,float,_f32)
UnaryAmpPreciseMathFunc(log1p,log1p,double,double,_f64)


UnaryAmpPreciseMathFunc(log2,log2,float,float,_f32)
UnaryAmpPreciseMathFunc(log2,log2,double,double,_f64)

UnaryAmpPreciseMathFunc(logb,logb,float,float,_f32)
UnaryAmpPreciseMathFunc(logb,logb,double,double,_f64)


BinaryAmpPreciseMathFunc(modf,modf,float,float,float*,_f32)
BinaryAmpPreciseMathFunc(modf,modf,double,double,double*,_f64)


// TODO: Compiler throws an error if we uncomment this code
//UnaryAmpPreciseMathFunc(nan,nan,float,int,_f32)
//UnaryAmpPreciseMathFunc(nan,nan,double,int,_f64)

// There is not a 1:1 mapping between AMP and OpenCL nan() function
// signature, so we can't use the existing wrapper macro here. We need
// to massage the input arg to the OpenCL nan() call.
float __amd_amp_Pnan_f32(int tagp) {
  return nan((uint)tagp);
}

double __amd_amp_Pnan_f64(int tagp) {
  return nan((ulong)tagp);
}


UnaryAmpPreciseMathFunc(nearbyint,nearbyintf,float,float,_f32)
UnaryAmpPreciseMathFunc(nearbyint,nearbyint,double,double,_f64)


BinaryAmpPreciseMathFunc(nextafter,nextafter,float,float,float,_f32)
BinaryAmpPreciseMathFunc(nextafter,nextafter,double,double,double,_f64)


BinaryAmpPreciseMathFunc(pow,pow,float,float,float,_f32)
BinaryAmpPreciseMathFunc(pow,pow,double,double,double,_f64)



UnaryAmpPreciseMathFunc(rcbrt,rcbrtf,float,float,_f32)
UnaryAmpPreciseMathFunc(rcbrt,rcbrt,double,double,_f64)


BinaryAmpPreciseMathFunc(remainder,remainder,float,float,float,_f32)
BinaryAmpPreciseMathFunc(remainder,remainder,double,double,double,_f64)


TernaryAmpPreciseMathFunc(remquo,remquo,float,float,float,int *,_f32)
TernaryAmpPreciseMathFunc(remquo,remquo,double,double,double,int*,_f64)


UnaryAmpPreciseMathFunc(round,round,float,float,_f32)
UnaryAmpPreciseMathFunc(round,round,double,double,_f64)


UnaryAmpPreciseMathFunc(rsqrt,rsqrt,float,float,_f32)
UnaryAmpPreciseMathFunc(rsqrt,rsqrt,double,double,_f64)


BinaryAmpPreciseMathFunc(scalb,scalbf,float,float,float,_f32)
BinaryAmpPreciseMathFunc(scalb,scalb,double,double,double,_f64)

BinaryAmpPreciseMathFunc(scalbn,scalbnf,float,float,int,_f32)
BinaryAmpPreciseMathFunc(scalbn,scalbn,double,double,int,_f64)



UnaryAmpPreciseMathFunc(signbit,signbit,int,float,_f32)
UnaryAmpPreciseMathFunc(signbit,signbit,int,double,_f64)

UnaryAmpPreciseMathFunc(sin,sin,float,float,_f32)
UnaryAmpPreciseMathFunc(sin,sin,double,double,_f64)


// sincos doesn't match the function defintion patterns used above,
// so we define it explicitly.
void __amd_amp_Psincos_f32(float x, float* psin, float* pcos) {
  *psin = sincos(x, pcos);
}

void __amd_amp_Psincos_f64(double x,double* psin,double *pcos) {
    *psin = sincos(x,pcos);
}

UnaryAmpPreciseMathFunc(sinh,sinh,float,float,_f32)
UnaryAmpPreciseMathFunc(sinh,sinh,double,double,_f64)

UnaryAmpPreciseMathFunc(sinpi,sinpi,float,float,_f32)
UnaryAmpPreciseMathFunc(sinpi,sinpi,double,double,_f64)

UnaryAmpPreciseMathFunc(sqrt,sqrt,float,float,_f32)
UnaryAmpPreciseMathFunc(sqrt,sqrt,double,double,_f64)

UnaryAmpPreciseMathFunc(tan,tan,float,float,_f32)
UnaryAmpPreciseMathFunc(tan,tan,double,double,_f64)

UnaryAmpPreciseMathFunc(tanh,tanh,float,float,_f32)
UnaryAmpPreciseMathFunc(tanh,tanh,double,double,_f64)

UnaryAmpPreciseMathFunc(tanpi,tanpi,float,float,_f32)
UnaryAmpPreciseMathFunc(tanpi,tanpi,double,double,_f64)


UnaryAmpPreciseMathFunc(tgamma,tgamma,float,float,_f32)
UnaryAmpPreciseMathFunc(tgamma,tgamma,double,double,_f64)

UnaryAmpPreciseMathFunc(trunc,trunc,float,float,_f32)
UnaryAmpPreciseMathFunc(trunc,trunc,double,double,_f64)
