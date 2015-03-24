// AMP fast math functions

#include "amp_fast_math.h"


#define UnaryAmpFastMathFunc(AmpFunc,OclFunc,Ty,ArgTy,Suf)  \
UnaryAmpFastMathProto(AmpFunc,Ty,ArgTy,Suf) \
{ return OclFunc(x); }

#define BinaryAmpFastMathFunc(AmpFunc,OclFunc,Ty,ArgTy1,ArgTy2,Suf)  \
BinaryAmpFastMathProto(AmpFunc,Ty,ArgTy1,ArgTy2,Suf) \
{ return OclFunc(x,y); }


UnaryAmpFastMathFunc(acos,acos,float,float,_f32)

UnaryAmpFastMathFunc(asin,asin,float,float,_f32)

UnaryAmpFastMathFunc(atan,atan,float,float,_f32)

BinaryAmpFastMathFunc(atan2,atan2,float,float,float,_f32)

UnaryAmpFastMathFunc(ceil,ceil,float,float,_f32)

UnaryAmpFastMathFunc(cos,cos,float,float,_f32)

UnaryAmpFastMathFunc(cosh,cosh,float,float,_f32)

UnaryAmpFastMathFunc(exp,exp,float,float,_f32)

UnaryAmpFastMathFunc(exp2,exp2,float,float,_f32)

UnaryAmpFastMathFunc(fabs,fabs,float,float,_f32)

UnaryAmpFastMathFunc(floor,floor,float,float,_f32)

BinaryAmpFastMathFunc(frexp,frexp,float,float,int*,_f32)

BinaryAmpFastMathFunc(fmax,max,float,float,float,_f32)

BinaryAmpFastMathFunc(fmin,min,float,float,float,_f32)

BinaryAmpFastMathFunc(fmod,fmod,float,float,float,_f32)

UnaryAmpFastMathFunc(isfinite,isfinite,int,float,_f32)
UnaryAmpFastMathFunc(isinf,isinf,int,float,_f32)
UnaryAmpFastMathFunc(isnan,isnan,int,float,_f32)

BinaryAmpFastMathFunc(ldexp,ldexp,float,float,int,_f32)

UnaryAmpFastMathFunc(log,log,float,float,_f32)

UnaryAmpFastMathFunc(log10,log10,float,float,_f32)

UnaryAmpFastMathFunc(log2,log2,float,float,_f32)

BinaryAmpFastMathFunc(modf,modf,float,float,float*,_f32)

BinaryAmpFastMathFunc(pow,pow,float,float,float,_f32)

UnaryAmpFastMathFunc(round,round,float,float,_f32)

UnaryAmpFastMathFunc(rsqrt,rsqrt,float,float,_f32)

UnaryAmpFastMathFunc(signbit,signbit,int,float,_f32)

UnaryAmpFastMathFunc(sin,sin,float,float,_f32)

UnaryAmpFastMathFunc(sinh,sinh,float,float,_f32)

UnaryAmpFastMathFunc(sqrt,sqrt,float,float,_f32)

UnaryAmpFastMathFunc(tan,tan,float,float,_f32)

UnaryAmpFastMathFunc(tanh,tanh,float,float,_f32)

UnaryAmpFastMathFunc(trunc,trunc,float,float,_f32)

// sincos doesn't match the function defintion patterns used above,
// so we define it explicitly.
void __amd_amp_Fsincos_f32(float x, float* psin, float* pcos) {
  *psin = sincos(x, pcos);
}
