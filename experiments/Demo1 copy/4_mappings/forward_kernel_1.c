#include "include/ISA.h"
void cgra_execute(void** din_addr, void** dout_addr)
{
	volatile unsigned short cin[4][3] __attribute__((aligned(8))) = {
		{0x2000, 0x3000, 0x0004},
		{0x0040, 0x0020, 0x0005},
		{0x0000, 0x8100, 0x0006},
		{0x0000, 0x0000, 0x0007},
	};

	load_cfg((void*)cin, 0x20000, 24, 0, 0);
	config(0x0, 4, 0, 0);
	execute(0x1, 0, 0);
	store(dout_addr[0], 0x0, 192, 0, 0);
}
