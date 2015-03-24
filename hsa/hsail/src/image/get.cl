// Image query built-ins

#define CLK_UNORM_INT24              0x10DF

// Hsail image query intrinsics
extern __attribute__((pure)) int __hsail_query_width_1d(image1d_t);
extern __attribute__((pure)) int __hsail_query_width_1db(image1d_buffer_t);
extern __attribute__((pure)) int __hsail_query_width_1da(image1d_array_t);
extern __attribute__((pure)) int __hsail_query_width_2d(image2d_t);
extern __attribute__((pure)) int __hsail_query_width_2da(image2d_array_t);
extern __attribute__((pure)) int __hsail_query_width_3d(image3d_t);

extern __attribute__((pure)) int __hsail_query_height_2d(image2d_t);
extern __attribute__((pure)) int __hsail_query_height_2da(image2d_array_t);
extern __attribute__((pure)) int __hsail_query_height_3d(image3d_t);

extern __attribute__((pure)) int __hsail_depth_3d(image3d_t);

extern __attribute__((pure)) int __hsail_query_format_1d(image1d_t);
extern __attribute__((pure)) int __hsail_query_format_1db(image1d_buffer_t);
extern __attribute__((pure)) int __hsail_query_format_1da(image1d_array_t);
extern __attribute__((pure)) int __hsail_query_format_2d(image2d_t);
extern __attribute__((pure)) int __hsail_query_format_2da(image2d_array_t);
extern __attribute__((pure)) int __hsail_query_format_3d(image3d_t);

extern __attribute__((pure)) int __hsail_query_order_1d(image1d_t);
extern __attribute__((pure)) int __hsail_query_order_1db(image1d_buffer_t);
extern __attribute__((pure)) int __hsail_query_order_1da(image1d_array_t);
extern __attribute__((pure)) int __hsail_query_order_2d(image2d_t);
extern __attribute__((pure)) int __hsail_query_order_2da(image2d_array_t);
extern __attribute__((pure)) int __hsail_query_order_3d(image3d_t);

extern __attribute__((pure)) uint __hsail_query_array_1da(image1d_array_t);
extern __attribute__((pure)) uint __hsail_query_array_2da(image2d_array_t);


#define DefQueryImage(Func,HsailIntrin,ImageTy,RetTy) \
__attribute__((overloadable, always_inline)) RetTy  \
Func(ImageTy image) { \
  return (RetTy)HsailIntrin(image);  \
}

#define DefQueryImageChOrder(Func,HsailIntrin,ImageTy,RetTy) \
__attribute__((overloadable, always_inline)) RetTy  \
Func(ImageTy image) { \
  uint Chorder = (RetTy)HsailIntrin(image);  \
  return (mapBRIGChOrderToOCLChOrder(Chorder)); \
}

#define DefQueryImageChType(Func,HsailIntrin,ImageTy,RetTy) \
__attribute__((overloadable, always_inline)) RetTy  \
Func(ImageTy image) { \
  uint Chtype = (RetTy)HsailIntrin(image);  \
  return (mapBRIGChTypeToOCLChType(Chtype)); \
}

__constant uint __hsail_BRIGChOrderToOCLChOrder[32] = {
  CLK_A,
  CLK_R,
  CLK_Rx,
  CLK_RG,
  CLK_RGx,
  CLK_RA,
  CLK_RGB,
  CLK_RGBx,
  CLK_RGBA,
  CLK_BGRA,
  CLK_ARGB,
  CLK_ABGR,
  CLK_sRGB,
  CLK_sRGBx,
  CLK_sRGBA,
  CLK_sBGRA,
  CLK_INTENSITY,
  CLK_LUMINANCE,
  CLK_DEPTH,
  CLK_DEPTH_STENCIL
}; // Rest elements are 0. 32 elements allocated to avoid comparison.

static inline uint mapBRIGChOrderToOCLChOrder(uint BRIGChOrder) {
  return __hsail_BRIGChOrderToOCLChOrder[BRIGChOrder & 31];
}

__constant uint __hsail_BRIGChTypeToOCLChType[16] = {
  CLK_SNORM_INT8,
  CLK_SNORM_INT16,
  CLK_UNORM_INT8,
  CLK_UNORM_INT16,
  CLK_UNORM_INT24,
  CLK_UNORM_SHORT_555,
  CLK_UNORM_SHORT_565,
  CLK_UNORM_INT_101010,
  CLK_SIGNED_INT8,
  CLK_SIGNED_INT16,
  CLK_SIGNED_INT32,
  CLK_UNSIGNED_INT8,
  CLK_UNSIGNED_INT16,
  CLK_UNSIGNED_INT32,
  CLK_HALF_FLOAT,
  CLK_FLOAT
};

static inline uint mapBRIGChTypeToOCLChType(uint BRIGChType) {
  return __hsail_BRIGChTypeToOCLChType[BRIGChType & 15];
}

DefQueryImage(get_image_width, __hsail_query_width_1d, image1d_t, int)
DefQueryImage(get_image_width, __hsail_query_width_1db, image1d_buffer_t, int)
DefQueryImage(get_image_width, __hsail_query_width_1da, image1d_array_t, int)
DefQueryImage(get_image_width, __hsail_query_width_2d, image2d_t, int)
DefQueryImage(get_image_width, __hsail_query_width_2da, image2d_array_t, int)
DefQueryImage(get_image_width, __hsail_query_width_3d, image3d_t, int)

DefQueryImage(get_image_height, __hsail_query_height_2d, image2d_t, int)
DefQueryImage(get_image_height, __hsail_query_height_2da, image2d_array_t, int)
DefQueryImage(get_image_height, __hsail_query_height_3d, image3d_t, int)

#ifdef __clang__
__attribute__((overloadable))
#endif
__attribute__((always_inline)) int
get_image_depth(image3d_t image) {
  return __hsail_depth_3d(image);
}

DefQueryImageChType(get_image_channel_data_type, __hsail_query_format_1d, image1d_t, int)
DefQueryImageChType(get_image_channel_data_type, __hsail_query_format_1db, image1d_buffer_t, int)
DefQueryImageChType(get_image_channel_data_type, __hsail_query_format_1da, image1d_array_t, int)
DefQueryImageChType(get_image_channel_data_type, __hsail_query_format_2d, image2d_t, int)
DefQueryImageChType(get_image_channel_data_type, __hsail_query_format_2da, image2d_array_t, int)
DefQueryImageChType(get_image_channel_data_type, __hsail_query_format_3d, image3d_t, int)

DefQueryImageChOrder(get_image_channel_order, __hsail_query_order_1d, image1d_t, int)
DefQueryImageChOrder(get_image_channel_order, __hsail_query_order_1db, image1d_buffer_t, int)
DefQueryImageChOrder(get_image_channel_order, __hsail_query_order_1da, image1d_array_t, int)
DefQueryImageChOrder(get_image_channel_order, __hsail_query_order_2d, image2d_t, int)
DefQueryImageChOrder(get_image_channel_order, __hsail_query_order_2da, image2d_array_t, int)
DefQueryImageChOrder(get_image_channel_order, __hsail_query_order_3d, image3d_t, int)

__attribute__((overloadable, always_inline)) int2
get_image_dim(image2d_t image) {
  int2 dim;
  dim.x = get_image_width(image);
  dim.y = get_image_height(image);
  return dim;
}

__attribute__((overloadable, always_inline)) int2
get_image_dim(image2d_array_t image) {
  int2 dim;
  dim.x = get_image_width(image);
  dim.y = get_image_height(image);
  return dim;
}

__attribute__((overloadable, always_inline)) int4
get_image_dim(image3d_t image) {
  int4 dim;
  dim.x = get_image_width(image);
  dim.y = get_image_height(image);
  dim.z = get_image_depth(image);
  dim.w = 0;
  return dim;
}

DefQueryImage(get_image_array_size, __hsail_query_array_1da, image1d_array_t, size_t);
DefQueryImage(get_image_array_size, __hsail_query_array_2da, image2d_array_t, size_t);

#if __OPENCL_C_VERSION__ >= 200
// Image-2.0 query built-ins

// Hsail image query intrinsics
extern __attribute__((pure)) int __hsail_query_width_2ddepth(image2d_depth_t);
extern __attribute__((pure)) int __hsail_query_width_2dadepth(image2d_array_depth_t);

extern __attribute__((pure)) int __hsail_query_height_2ddepth(image2d_depth_t);
extern __attribute__((pure)) int __hsail_query_height_2dadepth(image2d_array_depth_t);

extern __attribute__((pure)) int __hsail_query_array_2dadepth(image2d_array_depth_t);

extern __attribute__((pure)) int __hsail_query_channelorder_2ddepth(image2d_depth_t);
extern __attribute__((pure)) int __hsail_query_channelorder_2dadepth(image2d_array_depth_t);

extern __attribute__((pure)) int __hsail_query_channeltype_2ddepth(image2d_depth_t);
extern __attribute__((pure)) int __hsail_query_channeltype_2dadepth(image2d_array_depth_t);

DefQueryImage(get_image_width, __hsail_query_width_2ddepth, image2d_depth_t, int)
DefQueryImage(get_image_width, __hsail_query_width_2dadepth, image2d_array_depth_t, int)

DefQueryImage(get_image_height, __hsail_query_height_2ddepth, image2d_depth_t, int)
DefQueryImage(get_image_height, __hsail_query_height_2dadepth, image2d_array_depth_t, int)

DefQueryImageChType(get_image_channel_data_type, __hsail_query_channeltype_2ddepth, image2d_depth_t, int)
DefQueryImageChType(get_image_channel_data_type, __hsail_query_channeltype_2dadepth, image2d_array_depth_t, int)

DefQueryImageChOrder(get_image_channel_order, __hsail_query_channelorder_2ddepth, image2d_depth_t, int)
DefQueryImageChOrder(get_image_channel_order, __hsail_query_channelorder_2dadepth, image2d_array_depth_t, int)


__attribute__((overloadable, always_inline)) int2
get_image_dim(image2d_depth_t image) {
  int2 dim;
  dim.x = get_image_width(image);
  dim.y = get_image_height(image);
  return dim;
}
__attribute__((overloadable, always_inline)) int2
get_image_dim(image2d_array_depth_t image) {
  int2 dim;
  dim.x = get_image_width(image);
  dim.y = get_image_height(image);
  return dim;
}

DefQueryImage(get_image_array_size, __hsail_query_array_2dadepth, image2d_array_depth_t, size_t)

#endif // __OPENCL_C_VERSION__ >= 200
