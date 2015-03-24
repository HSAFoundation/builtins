
#include "math32.h"

extern __attribute__((const)) int  __hsail_class_f32(float, int);
int fpclassifyf(float x)
{
	int 	 retval =  __hsail_class_f32(x,SNAN);
	retval = retval | (__hsail_class_f32(x,QNAN) << 1);
	retval = retval | (__hsail_class_f32(x,NINF) << 2);
	retval = retval | (__hsail_class_f32(x,NNOR) << 3);
	retval = retval | (__hsail_class_f32(x,NSUB) << 4);
	retval = retval | (__hsail_class_f32(x,NZER) << 5);
	retval = retval | (__hsail_class_f32(x,PZER) << 6);
	retval = retval | (__hsail_class_f32(x,PSUB) << 7);
	retval = retval | (__hsail_class_f32(x,PNOR) << 8);
	retval = retval | (__hsail_class_f32(x,PINF) << 9);
	return retval;


}