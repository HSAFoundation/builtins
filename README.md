# builtins
Builtin Sources (which goes into builtins-hsail.bc)

The sources here are used to build builtins-hsail.bc which is tested with
C++AMP (Kalmar) and Python compiler. 

Steps to build:

1. Copy these sources into perforce directory 
/drivers/opencl/library/

2. Use the lnx64a build target and build the libarry

3. Run this builtins file through prepare-builtin utility of libclc. Run 
libclc/utils/prepare-builtins builtins-hsail.bc -o builtins-hsail.opt.bc

4. Disassemble (using llvm-dis) this bc file into llvm readable file to make the following edits:
	a. Remove any references to "fpath" metadata
	b. Replace "weak spir_func" with "linkonce_odr spir_func" globally
	c. Replace "linkonce_odr" with "internal" linkage for arrays defined like @__math32_EXP_TBL = internal addrspace(2) constant

5. Assemble this LL file back to BC file using llvm-as

6. Note that any bc file which has function calls should also be run through prepare-builtins utility (like for example with C++AMP opencl_math.bc)

7. Changes done for library sources in P4 are:
   i. Change the get_global_id source not to call get_global_offset
   ii. Remove the following sources which have aliases:
	a. subgroup/subbbacst.cl
	b. misc/awgcpy.cl, bitsel.cl
	c. vldst/vldst_gen.cl, vldst_half.cl
	d. int/ctz_base.cl, rotate_base.cl, popcnt_base.cl
	e. common/commonConversions.cl, common/commonShuffle.cl, common/commonSelect.cl 
	f. Modified int/clz_base.cl (replace alias)
	("f" means that if we replace all aliases with their respective bodies)
