#include "include/ISA.h"
#include "include/rocc.h"
#include "include/ISA.h"
void cgra_execute(void** din_addr, void** dout_addr)
{
	volatile unsigned short cin[13][3] __attribute__((aligned(8))) = {
		{0x0000, 0x0010, 0x0150},
		{0x0000, 0x0020, 0x0154},
		{0x0000, 0x0020, 0x0158},
		{0x0000, 0x0020, 0x015c},
		{0x0200, 0x0000, 0x0160},
		{0x2000, 0x3000, 0x0170},
		{0x0040, 0x0018, 0x0171},
		{0x0000, 0x0100, 0x0172},
		{0x0000, 0x0000, 0x0173},
		{0x6000, 0x3000, 0x0184},
		{0xf800, 0x001f, 0x0185},
		{0x0000, 0x8b00, 0x0186},
		{0x0000, 0x0000, 0x0187},
	};

	load_cfg((void*)cin, 0x20000, 78, 0, 0);
	load_data(din_addr[0], 0x10000, 144, 0, 0, 0);
	config(0x0, 13, 0, 0);
	execute(0x4200, 0, 0);
	store(dout_addr[0], 0x18000, 144, 0, 0);
}
void forward_kernel_3(void* din_0, void* dout_0)
{
	volatile unsigned short cin[10][3] __attribute__((aligned(8))) = {
		{0x3000, 0x0000, 0x0150},
		{0x0000, 0x0001, 0x0154},
		{0x6800, 0x3000, 0x0170},
		{0xf800, 0x001f, 0x0171},
		{0x0000, 0x8900, 0x0172},
		{0x0080, 0x0000, 0x0173},
		{0x2000, 0x3000, 0x0178},
		{0x0040, 0x0018, 0x0179},
		{0x0000, 0x0100, 0x017a},
		{0x0000, 0x0000, 0x017b},
	};

	load_cfg((void*)cin, 0x20000, 60, 0, 0);
	load_data(din_0, 0x10000, 144, 0, 0, 0);
	config(0x0, 10, 0, 0);
	execute(0xa00, 0, 0);
	store(dout_0, 0x12000, 144, 0, 0);
}