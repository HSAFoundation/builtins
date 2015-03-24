
__attribute__((overloadable, weak,always_inline)) float
fast_length(float p)
{
    return fabs(p);
}

__attribute__((overloadable, weak,always_inline)) float
fast_length(float2 p)
{
    return half_sqrt(dot(p, p));
}

__attribute__((overloadable, weak,always_inline)) float
fast_length(float3 p)
{
    return half_sqrt(dot(p, p));
}

__attribute__((overloadable, weak,always_inline)) float
fast_length(float4 p)
{
    return half_sqrt(dot(p, p));
}

