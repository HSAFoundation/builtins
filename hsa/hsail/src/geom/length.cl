
__attribute__((overloadable, weak,always_inline)) float
length(float p)
{
    return fabs(p);
}

__attribute__((overloadable, weak,always_inline)) double
length(double p)
{
    return fabs(p);
}

__attribute__((overloadable, weak,always_inline)) float
length(float2 p)
{
    float l2 = dot(p, p);

    if (l2 < FLT_MIN) {
        p *= 0x1.0p+86F;
        return sqrt(dot(p, p)) * 0x1.0p-86F;
    } else if (l2 == INFINITY) {
        p *= 0x1.0p-65F;
        return sqrt(dot(p, p)) * 0x1.0p+65F;
    }

    return sqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) double
length(double2 p)
{
    double l2 = dot(p, p);

    if (l2 < DBL_MIN) {
        p *= 0x1.0p+563;
        return sqrt(dot(p, p)) * 0x1.0p-563;
    } else if (l2 == INFINITY) {
        p *= 0x1.0p-513;
        return sqrt(dot(p, p)) * 0x1.0p+513;
    }

    return sqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) float
length(float3 p)
{
    float l2 = dot(p, p);

    if (l2 < FLT_MIN) {
        p *= 0x1.0p+86F;
        return sqrt(dot(p, p)) * 0x1.0p-86F;
    } else if (l2 == INFINITY) {
        p *= 0x1.0p-66F;
        return sqrt(dot(p, p)) * 0x1.0p+66F;
    }

    return sqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) double
length(double3 p)
{
    double l2 = dot(p, p);

    if (l2 < DBL_MIN) {
        p *= 0x1.0p+563;
        return sqrt(dot(p, p)) * 0x1.0p-563;
    } else if (l2 == INFINITY) {
        p *= 0x1.0p-514;
        return sqrt(dot(p, p)) * 0x1.0p+514;
    }

    return sqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) float
length(float4 p)
{
    float l2 = dot(p, p);

    if (l2 < FLT_MIN) {
        p *= 0x1.0p+86F;
        return sqrt(dot(p, p)) * 0x1.0p-86F;
    }
    else if (l2 == INFINITY) {
        p *= 0x1.0p-66f;
        return sqrt(dot(p, p)) * 0x1.0p+66F;
    }

    return sqrt(l2);
}

__attribute__((overloadable, weak,always_inline)) double
length(double4 p)
{
    double l2 = dot(p, p);

    if (l2 < DBL_MIN) {
        p *= 0x1.0p+563;
        return sqrt(dot(p, p)) * 0x1.0p-563;
    }
    else if (l2 == INFINITY) {
        p *= 0x1.0p-514;
        return sqrt(dot(p, p)) * 0x1.0p+514;
    }

    return sqrt(l2);
}

