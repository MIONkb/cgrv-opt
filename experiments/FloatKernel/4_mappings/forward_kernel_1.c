#include "include/ISA.h"
void forward_kernel_1(void* dout_0)
{
	volatile unsigned short cin[4][3] __attribute__((aligned(8))) = {
		{0x2000, 0x1000, 0x001c},
		{0x0000, 0x0018, 0x001d},
		{0x0000, 0x8100, 0x001e},
		{0x0000, 0x0000, 0x001f},
	};

	load_cfg((void*)cin, 0x20000, 24, 0, 0);
	config(0x0, 4, 0, 0);
	execute(0x40, 0, 0);
	store(dout_0, 0x8000, 40, 0, 0);
}
