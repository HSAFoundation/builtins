
__attribute__((overloadable, always_inline)) float
nan(uint nancode)
{
    return as_float((nancode & 0xfffff) | 0x7fc00000);
}

