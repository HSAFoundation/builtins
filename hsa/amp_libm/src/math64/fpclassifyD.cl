
#include "math64.h"

extern __attribute__((const)) int  __hsail_class_f64(double, int);

int fpclassify(double x)
{
	int 	 retval =  __hsail_class_f64(x,SNAN);
	retval = retval | (__hsail_class_f64(x,QNAN) << 1);
	retval = retval | (__hsail_class_f64(x,NINF) << 2);
	retval = retval | (__hsail_class_f64(x,NNOR) << 3);
	retval = retval | (__hsail_class_f64(x,NSUB) << 4);
	retval = retval | (__hsail_class_f64(x,NZER) << 5);
	retval = retval | (__hsail_class_f64(x,PZER) << 6);
	retval = retval | (__hsail_class_f64(x,PSUB) << 7);
	retval = retval | (__hsail_class_f64(x,PNOR) << 8);
	retval = retval | (__hsail_class_f64(x,PINF) << 9);
	return retval;
}

