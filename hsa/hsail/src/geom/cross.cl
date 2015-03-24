
__attribute__((overloadable, weak,always_inline)) float3
cross(float3 p0, float3 p1)
{
    return (float3)(p0.y * p1.z - p0.z * p1.y,
                    p0.z * p1.x - p0.x * p1.z,
                    p0.x * p1.y - p0.y * p1.x);
}

__attribute__((overloadable, weak,always_inline)) double3
cross(double3 p0, double3 p1)
{
    return (double3)(p0.y * p1.z - p0.z * p1.y,
                     p0.z * p1.x - p0.x * p1.z,
                     p0.x * p1.y - p0.y * p1.x);
}

__attribute__((overloadable, weak,always_inline)) float4
cross(float4 p0, float4 p1)
{
    return (float4)(p0.y * p1.z - p0.z * p1.y,
                    p0.z * p1.x - p0.x * p1.z,
                    p0.x * p1.y - p0.y * p1.x,
                    p0.w * p1.w - p0.w * p1.w);
}

__attribute__((overloadable, weak,always_inline)) double4
cross(double4 p0, double4 p1)
{
    return (double4)(p0.y * p1.z - p0.z * p1.y,
                     p0.z * p1.x - p0.x * p1.z,
                     p0.x * p1.y - p0.y * p1.x,
                     p0.w * p1.w - p0.w * p1.w);
}

