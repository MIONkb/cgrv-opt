#include "include/ISA.h"
void forward_kernel_1(void* din_0, void* din_1, void* din_2, void* din_3, void* din_4, void* din_5, void* dout_0, void* dout_1)
{
	volatile unsigned short cin[88][3] __attribute__((aligned(8))) = {
		{0x0000, 0xe000, 0x0018},
		{0x0000, 0x0000, 0x0019},
		{0x0000, 0x1900, 0x001a},
		{0x0000, 0x0000, 0x001b},
		{0x0000, 0xe000, 0x0028},
		{0x0000, 0x0000, 0x0029},
		{0x0000, 0x0700, 0x002a},
		{0x0000, 0x0000, 0x002b},
		{0x0800, 0xe000, 0x0030},
		{0x0000, 0x0000, 0x0031},
		{0x0000, 0x0100, 0x0032},
		{0x0000, 0x0000, 0x0033},
		{0x5000, 0xe000, 0x0038},
		{0x0080, 0x0080, 0x0039},
		{0x0000, 0x0700, 0x003a},
		{0x0000, 0x0000, 0x003b},
		{0x5800, 0xe000, 0x0040},
		{0x0080, 0x0080, 0x0041},
		{0x0000, 0xa900, 0x0042},
		{0x0000, 0x0000, 0x0043},
		{0x0000, 0x0030, 0x0060},
		{0x0000, 0x000e, 0x0068},
		{0x0000, 0x0020, 0x0070},
		{0x1200, 0x0030, 0x0078},
		{0x0400, 0x0000, 0x0080},
		{0x0030, 0x0000, 0x0088},
		{0x0001, 0x0000, 0x00b8},
		{0x8006, 0x0000, 0x00b9},
		{0xc5ac, 0x3727, 0x00c0},
		{0x000e, 0x0002, 0x00c1},
		{0xc24f, 0x0002, 0x00c9},
		{0x0003, 0x0000, 0x00f1},
		{0x0000, 0x0000, 0x00f8},
		{0x0003, 0x0000, 0x00f9},
		{0xc000, 0x0000, 0x0100},
		{0x4000, 0x6000, 0x0108},
		{0x0080, 0x0000, 0x0110},
		{0x0001, 0x0000, 0x0111},
		{0x0000, 0x0400, 0x0118},
		{0x59df, 0x5f37, 0x0140},
		{0x0002, 0x0004, 0x0141},
		{0xc02d, 0x0002, 0x0149},
		{0x0000, 0x3f00, 0x0150},
		{0x000d, 0x0002, 0x0151},
		{0xc00e, 0x0008, 0x0159},
		{0xc000, 0x0000, 0x0180},
		{0x2000, 0x0000, 0x0188},
		{0x0003, 0x0000, 0x0189},
		{0x4000, 0x0000, 0x0190},
		{0x4000, 0x2000, 0x0198},
		{0xd0c0, 0x0000, 0x01a0},
		{0x000c, 0x0000, 0x01a8},
		{0xc14f, 0x0002, 0x01c9},
		{0x408e, 0x0008, 0x01d1},
		{0x030d, 0x0003, 0x01d9},
		{0x430d, 0x0002, 0x01e1},
		{0x440d, 0x0002, 0x01e9},
		{0x0000, 0x8000, 0x0208},
		{0x0080, 0x0000, 0x0210},
		{0x0000, 0x6000, 0x0218},
		{0x0001, 0x0000, 0x0219},
		{0x0008, 0x4000, 0x0220},
		{0x4000, 0x4180, 0x0228},
		{0x0000, 0x0880, 0x0230},
		{0x0000, 0x0000, 0x0238},
		{0x840d, 0x0002, 0x0261},
		{0x0000, 0x3fc0, 0x0270},
		{0x000f, 0x0002, 0x0271},
		{0x008d, 0x0007, 0x0279},
		{0x440d, 0x0008, 0x0281},
		{0x0000, 0x0004, 0x0298},
		{0x2000, 0x0000, 0x02a8},
		{0x0000, 0x0000, 0x02b0},
		{0x0000, 0x0020, 0x02b8},
		{0x0040, 0x0000, 0x02c0},
		{0x0000, 0x0000, 0x02c8},
		{0x4001, 0xe000, 0x02d8},
		{0x0080, 0x0080, 0x02d9},
		{0x0000, 0x0700, 0x02da},
		{0x0000, 0x0000, 0x02db},
		{0x4801, 0xe000, 0x02e8},
		{0x0080, 0x0080, 0x02e9},
		{0x0000, 0xab00, 0x02ea},
		{0x0080, 0x0000, 0x02eb},
		{0x0000, 0xe000, 0x0310},
		{0x0000, 0x0000, 0x0311},
		{0x0000, 0x1500, 0x0312},
		{0x0000, 0x0000, 0x0313},
	};

	load_cfg((void*)cin, 0x20000, 528, 0, 0);
	load_data(din_0, 0x18000, 0, 0, 0, 0);
	load_data(din_1, 0x0, 0, 0, 0, 0);
	load_data(din_2, 0x8000, 0, 0, 0, 0);
	load_data(din_3, 0xa000, 0, 0, 0, 0);
	load_data(din_4, 0xc000, 7164, 1, 0, 0);
	load_data(din_5, 0x10000, 7164, 0, 0, 0);
	config(0x0, 88, 0, 0);
	execute(0x85f4, 0, 0);
	store(dout_0, 0xe000, 7164, 0, 0);
	store(dout_1, 0x12000, 7168, 0, 0);
}