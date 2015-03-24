
__attribute__((overloadable, weak,always_inline)) float
degrees(float radians)
{
    // 180/pi = ~57.29577951308232087685 or 0x1.ca5dc1a63c1f8p+5 or 0x1.ca5dc2p+5F
    return 0x1.ca5dc2p+5F * radians;
}

__attribute__((overloadable, weak,always_inline)) double
degrees(double radians)
{
    // 180/pi = ~57.29577951308232087685 or 0x1.ca5dc1a63c1f8p+5 or 0x1.ca5dc2p+5F
    return 0x1.ca5dc1a63c1f8p+5 * radians;
}

//! Converts degrees to radians, i.e. (PI / 180) * degrees.
//
__attribute__((overloadable, weak,always_inline)) float
radians(float degrees)
{
    // pi/180 = ~0.01745329251994329577 or 0x1.1df46a2529d39p-6 or 0x1.1df46ap-6F
    return 0x1.1df46ap-6F * degrees;
}

__attribute__((overloadable, weak,always_inline)) double
radians(double degrees)
{
    // pi/180 = ~0.01745329251994329577 or 0x1.1df46a2529d39p-6 or 0x1.1df46ap-6F
    return 0x1.1df46a2529d39p-6 * degrees;
}

