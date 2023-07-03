#include "include/ISA.h"
#include "include/rocc.h"
#include "include/ISA.h"
void cgra_execute(void** din_addr, void** dout_addr)
{
	volatile unsigned short cin[4][3] __attribute__((aligned(8))) = {
		{0x2000, 0x3000, 0x0020},
		{0x0040, 0x0020, 0x0021},
		{0x0000, 0x8100, 0x0022},
		{0x0000, 0x0000, 0x0023},
	};

	load_cfg((void*)cin, 0x20000, 24, 0, 0);
	config(0x0, 4, 0, 0);
	execute(0x80, 0, 0);
	store(dout_addr[0], 0x8000, 192, 0, 0);
}
void forward_kernel_1(void* dout_0)
{
	volatile unsigned short cin[4][3] __attribute__((aligned(8))) = {
		{0x2000, 0x3000, 0x001c},
		{0x0040, 0x0020, 0x001d},
		{0x0000, 0x8100, 0x001e},
		{0x0000, 0x0000, 0x001f},
	};

	load_cfg((void*)cin, 0x20160, 24, 0, 0);
	config(0x2c, 4, 0, 0);
	execute(0x40, 0, 0);
	store(dout_0, 0x8000, 192, 0, 0);
}
