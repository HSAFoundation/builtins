# builtins
Builtin Sources (which goes into builtins-hsail.bc)

The sources here are used to build builtins-hsail.bc which is tested with
C++AMP (Kalmar) and Python compiler. 

Steps to build:

1. Copy these sources into perforce directory 
/drivers/opencl/library/

2. Use the lnx64a build target and build the libarry

3. Use the built builtins-hsail.bc instead of OpenCL bultins.


