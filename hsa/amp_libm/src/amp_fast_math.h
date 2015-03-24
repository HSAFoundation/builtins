// AMP fast_math functions

// FIXME: This is a prototype. This is meant to simulate fast math functions
// in the AMP fast_math namespace.

#define UnaryAmpFastMathProto(Func,Ty,ArgTy,Suf) Ty __amd_amp_F##Func##Suf(ArgTy x)
#define BinaryAmpFastMathProto(Func,Ty,ArgTy1,ArgTy2,Suf) Ty __amd_amp_F##Func##Suf(ArgTy1 x, ArgTy2 y)
#define TernaryAmpFastMathProto(Func,Ty,ArgTy1,ArgTy2,ArgTy3,Suf) Ty __amd_amp_F##Func##Suf(ArgTy1 x, ArgTy2 y, ArgTy3 z)

UnaryAmpFastMathProto(acos,float,float,_f32);
UnaryAmpFastMathProto(asin,float,float,_f32);
UnaryAmpFastMathProto(atan,float,float,_f32);
BinaryAmpFastMathProto(atan2,float,float,float,_f32);
UnaryAmpFastMathProto(ceil,float,float,_f32);
UnaryAmpFastMathProto(cos,float,float,_f32);
UnaryAmpFastMathProto(cosh,float,float,_f32);
UnaryAmpFastMathProto(exp,float,float,_f32);
UnaryAmpFastMathProto(exp2,float,float,_f32);
UnaryAmpFastMathProto(fabs,float,float,_f32);
UnaryAmpFastMathProto(floor,float,float,_f32);
BinaryAmpFastMathProto(fmax,float,float,float,_f32);
BinaryAmpFastMathProto(fmin,float,float,float,_f32);
BinaryAmpFastMathProto(fmod,float,float,float,_f32);
BinaryAmpFastMathProto(frexp,float,float,int*,_f32);
UnaryAmpFastMathProto(isfinite,int,float,_f32);
UnaryAmpFastMathProto(isinf,int,float,_f32);
UnaryAmpFastMathProto(isnan,int,float,_f32);
BinaryAmpFastMathProto(ldexp,float,float,int,_f32);
UnaryAmpFastMathProto(log,float,float,_f32);
UnaryAmpFastMathProto(log10,float,float,_f32);
UnaryAmpFastMathProto(log2,float,float,_f32);
BinaryAmpFastMathProto(modf,float,float,float*,_f32);
BinaryAmpFastMathProto(pow,float,float,float,_f32);
UnaryAmpFastMathProto(round,float,float,_f32);
UnaryAmpFastMathProto(rsqrt,float,float,_f32);
UnaryAmpFastMathProto(signbit,int,float,_f32);
UnaryAmpFastMathProto(sin,float,float,_f32);
TernaryAmpFastMathProto(sincos,void,float,float*,float*,_f32);
UnaryAmpFastMathProto(sinh,float,float,_f32);
UnaryAmpFastMathProto(sqrt,float,float,_f32);
UnaryAmpFastMathProto(tan,float,float,_f32);
UnaryAmpFastMathProto(tanh,float,float,_f32);
UnaryAmpFastMathProto(trunc,float,float,_f32);
