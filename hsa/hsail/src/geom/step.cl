
__attribute__((overloadable, weak,always_inline)) float
step(float edge, float x)
{
    return x < edge ? 0.0F: 1.0F;
}

__attribute__((overloadable, weak,always_inline)) double
step(double edge, double x)
{
    return x < edge ? 0.0: 1.0;
}

__attribute__((overloadable, weak,always_inline)) float
smoothstep(float edge0, float edge1, float x)
{
    float t = clamp((x - edge0) / (edge1 - edge0), 0.0F, 1.0F);
    return t * t * (3.0F - 2.0F * t);
}

__attribute__((overloadable, weak,always_inline)) double
smoothstep(double edge0, double edge1, double x)
{
    double t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
    return t * t * (3.0 - 2.0 * t);
}

