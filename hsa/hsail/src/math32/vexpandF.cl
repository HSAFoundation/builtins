

__attribute__((overloadable, always_inline, weak)) float16
frexp(float16 x, int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float16
frexp(float16 x, __global int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float16
frexp(float16 x, __local int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float8
frexp(float8 x, int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float8
frexp(float8 x, __global int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float8
frexp(float8 x, __local int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float4
frexp(float4 x, int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float4
frexp(float4 x, __global int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float4
frexp(float4 x, __local int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float3
frexp(float3 x, int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = frexp(x.s01, &j);
    i.s01 = j;
    r.s2 = frexp(x.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float3
frexp(float3 x, __global int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = frexp(x.s01, &j);
    i.s01 = j;
    r.s2 = frexp(x.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float3
frexp(float3 x, __local int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = frexp(x.s01, &j);
    i.s01 = j;
    r.s2 = frexp(x.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float2
frexp(float2 x, int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float2
frexp(float2 x, __global int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float2
frexp(float2 x, __local int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = frexp(x.lo, &j);
    i.lo = j;
    r.hi = frexp(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float16
lgamma_r(float16 x, int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float16
lgamma_r(float16 x, __global int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float16
lgamma_r(float16 x, __local int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float8
lgamma_r(float8 x, int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float8
lgamma_r(float8 x, __global int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float8
lgamma_r(float8 x, __local int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float4
lgamma_r(float4 x, int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float4
lgamma_r(float4 x, __global int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float4
lgamma_r(float4 x, __local int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float3
lgamma_r(float3 x, int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = lgamma_r(x.s01, &j);
    i.s01 = j;
    r.s2 = lgamma_r(x.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float3
lgamma_r(float3 x, __global int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = lgamma_r(x.s01, &j);
    i.s01 = j;
    r.s2 = lgamma_r(x.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float3
lgamma_r(float3 x, __local int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = lgamma_r(x.s01, &j);
    i.s01 = j;
    r.s2 = lgamma_r(x.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float2
lgamma_r(float2 x, int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float2
lgamma_r(float2 x, __global int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float2
lgamma_r(float2 x, __local int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = lgamma_r(x.lo, &j);
    i.lo = j;
    r.hi = lgamma_r(x.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float16
remquo(float16 x, float16 y, int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float16
remquo(float16 x, float16 y, __global int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float16
remquo(float16 x, float16 y, __local int16 *p)
{
    float16 r;
    int16 i;
    int8 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float8
remquo(float8 x, float8 y, int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float8
remquo(float8 x, float8 y, __global int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float8
remquo(float8 x, float8 y, __local int8 *p)
{
    float8 r;
    int8 i;
    int4 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float4
remquo(float4 x, float4 y, int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float4
remquo(float4 x, float4 y, __global int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float4
remquo(float4 x, float4 y, __local int4 *p)
{
    float4 r;
    int4 i;
    int2 j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float3
remquo(float3 x, float3 y, int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = remquo(x.s01, y.s01, &j);
    i.s01 = j;
    r.s2 = remquo(x.s2, y.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float3
remquo(float3 x, float3 y, __global int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = remquo(x.s01, y.s01, &j);
    i.s01 = j;
    r.s2 = remquo(x.s2, y.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float3
remquo(float3 x, float3 y, __local int3 *p)
{
    float3 r;
    int3 i;
    int2 j;
    int k;

    r.s01 = remquo(x.s01, y.s01, &j);
    i.s01 = j;
    r.s2 = remquo(x.s2, y.s2, &k);
    i.s2 = k;

    *p = i;
    return r;
}

#endif

__attribute__((overloadable, always_inline, weak)) float2
remquo(float2 x, float2 y, int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float2
remquo(float2 x, float2 y, __global int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

#ifndef __clang__

__attribute__((overloadable, always_inline, weak)) float2
remquo(float2 x, float2 y, __local int2 *p)
{
    float2 r;
    int2 i;
    int j;
    

    r.lo = remquo(x.lo, y.lo, &j);
    i.lo = j;
    r.hi = remquo(x.hi, y.hi, &j);
    i.hi = j;

    *p = i;
    return r;
}

#endif

