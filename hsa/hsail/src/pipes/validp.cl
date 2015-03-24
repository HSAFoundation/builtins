//
// Copyright (c) 2014 Advanced Micro Devices, Inc. All rights reserved.
//


__attribute__((always_inline, weak)) bool
__is_valid_reserve_id(size_t rid)
{
    return rid != ~(size_t)0;
}

