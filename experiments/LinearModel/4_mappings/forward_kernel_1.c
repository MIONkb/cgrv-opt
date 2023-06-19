#include "include/ISA.h"
void forward_kernel_1(void* a)
{
	volatile unsigned short cin[4][3] __attribute__((aligned(8))) = {
		{0x2000, 0x0c00, 0x017c},
		{0x0040, 0x0020, 0x017d},
		{0x0000, 0x8100, 0x017e},
		{0x0000, 0x0000, 0x017f},
	};

	load_cfg((void*)cin, 0x20000, 24, 0, 0);
	config(0x0, 4, 0, 0);
	execute(0x1000, 0, 0);
	store(a, 0x18000, 48, 0, 0);
}
