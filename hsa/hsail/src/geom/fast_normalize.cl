
__attribute__((overloadable, weak,always_inline)) float
fast_normalize(float p)
{
    return normalize(p);
}

__attribute__((overloadable, weak,always_inline)) float2
fast_normalize(float2 p)
{
    float l2 = dot(p, p);
    return l2 == 0.0F ? p : p * half_rsqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) float3
fast_normalize(float3 p)
{
    float l2 = dot(p, p);
    return l2 == 0.0F ? p : p * half_rsqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) float4
fast_normalize(float4 p)
{
    float l2 = dot(p, p);
    return l2 == 0.0F ? p : p * half_rsqrt(l2);
}

