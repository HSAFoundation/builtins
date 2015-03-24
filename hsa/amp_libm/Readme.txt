Prototype AMP fast_math functions

Notes on amp_libm
------------------
The prototype AMP fast math functions are implemented as wrappers around HSA OpenCL math 
built-ins. This is meant to simulate fast math functions in the AMP fast_math namespace.
The implementation resides in .../drivers/hsa/library/hsa/amp_libm.

The OpenCL functions that are referenced by the AMP fast math functions are compiled
from our HSA OpenCL library. 
   
If you look carefully at AMP math functions in amp_libm.hsail (see below for details on how to 
generate this), you will notice that there are calls to HSA OpenCL math functions in some, but
none in others. Calls are resolved when llc (the device compiler) either inlines the OpenCL call,
or translates the call to a single HSAIL instruction. When there is a call instruction in the 
body of an AMP math function, then there is no HSA OpenCL function available for inlining, and 
there is no HSAIL intrinsic translation defined for the call.

Since the current version of amp_libm is based on our HSA OpenCL work in progress, there will
be more functions available for inlining/intrinsic translation in the future.


Building amp_libm
-----------------
Generating amp_libm.hsail will be automated in the build in the near future, but at the moment 
it's done manually, as follows:

- Build HSA. The tools, setup and build are described in "Building FSA Components". You can get this 
 doc from the HSA Sharepoint in FSA Program Documents > Fusion System Software.

- Find .../drivers/hsa/library/hsa/amp_libm/build/w764a/B_DBG/amp_libm.bc (assuming windows 64-bit 
 debug build) and run the following commands:

  .../drivers/hsa/dist/windows/debug/bin/x86_64/opt -O3 -gpu amp_libm.bc -o amp_libm.opt.bc

  .../drivers/hsa/dist/windows/debug/bin/x86_64/llc -march=hsail amp_libm.opt.bc -o amp_libm.hsail


Caveats
-------     
This has not yet been tested with AMP. This testing can begin when we have an AMD-developed amp_math.h,
and when the implementation achieves compatibility with amp_math.h.

This is intended to be a starting point for AMP library development. Feel free to change any of this
as you see fit.

