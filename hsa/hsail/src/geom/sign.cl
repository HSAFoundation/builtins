
#define G(T) \
__attribute__((overloadable, weak, always_inline)) T \
sign(T x) \
{ \
    return copysign((x == (T)0) | isnan(x) ? (T)0 : (T)1, x); \
}

G(float)
// TODO_HSA: resolve vector expansions
//G(float2)
//G(float3)
//G(float4)

G(double)

