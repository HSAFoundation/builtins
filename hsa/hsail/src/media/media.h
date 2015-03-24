#pragma OPENCL EXTENSION cl_amd_media_ops : enable

extern __attribute__((const)) uint __hsail_bitalign_b32(uint, uint, uint);

extern __attribute__((const)) uint __hsail_bytealign_b32(uint, uint, uint);

extern __attribute__((const)) uint  __hsail_packcvt_u8x4_f32(float,float,float,float);

extern __attribute__((const)) uint __hsail_lerp_u8x4(uint,uint,uint);

extern __attribute__((const)) uint __hsail_sad_u32_u8x4(uint,uint,uint);

extern __attribute__((const)) uint __hsail_sadhi_u16x2_u8x4(uint,uint,uint);

extern __attribute__((const)) float __hsail_unpackcvt_f32_u8x4(uint,uint);

extern __attribute__((const)) uint __hsail_msad(uint,uint,uint);

extern __attribute__((const)) uint __hsail_sadd(uint,uint,uint);

extern __attribute__((const)) uint __hsail_sadw(uint,uint,uint);

extern __attribute__((const)) uint __hsail_umin3(uint,uint,uint);

extern __attribute__((const)) int __hsail_imin3(int,int,int);

extern __attribute__((const)) uint __hsail_umax3(uint,uint,uint);

extern __attribute__((const)) int __hsail_imax3(int,int,int);

extern __attribute__((const)) uint __hsail_umedian3(uint,uint,uint);

extern __attribute__((const)) int __hsail_imedian3(int,int,int);

extern __attribute__((const)) uint __hsail_bfe(uint,uint,uint);

extern __attribute__((const)) float __hsail_f32_min3(float,float,float);

extern __attribute__((const)) float __hsail_f32_max3(float,float,float);

extern __attribute__((const)) float __hsail_f32_median3(float,float,float);

extern __attribute__((const)) ulong __hsail_mqsad(ulong,uint,ulong);

extern __attribute__((const)) ulong __hsail_qsad(ulong,uint,ulong);

extern __attribute__((const)) uint __hsail_bfm(uint,uint);

extern __attribute__((const)) int __hsail_ibfe(int,uint,uint);
