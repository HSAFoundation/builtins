
__attribute__((overloadable, weak, always_inline)) float
dot(float p0, float p1)
{
    return p0 * p1;
}

__attribute__((overloadable, weak, always_inline)) float
dot(float2 p0, float2 p1)
{
    float2 p = p0 * p1;
    return p.x + p.y;
}

__attribute__((overloadable, weak, always_inline)) float
dot(float3 p0, float3 p1)
{
    float3 p = p0 * p1;
    return p.x + p.y + p.z;
}

__attribute__((overloadable, weak, always_inline)) float
dot(float4 p0, float4 p1)
{
    float4 p = p0 * p1;
    return p.x + p.y + p.z + p.w;
}

__attribute__((overloadable, weak, always_inline)) double
dot(double p0, double p1)
{
    return p0 * p1;
}

__attribute__((overloadable, weak, always_inline)) double
dot(double2 p0, double2 p1)
{
    double2 p = p0 * p1;
    return p.x + p.y;
}

__attribute__((overloadable, weak, always_inline)) double
dot(double3 p0, double3 p1)
{
    double3 p = p0 * p1;
    return p.x + p.y + p.z;
}

__attribute__((overloadable, weak, always_inline)) double
dot(double4 p0, double4 p1)
{
    double4 p = p0 * p1;
    return p.x + p.y + p.z + p.w;
}
