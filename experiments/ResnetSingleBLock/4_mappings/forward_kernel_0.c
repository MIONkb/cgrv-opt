#include "include/ISA.h"
void forward_kernel_0(void* din_0, void* din_1, void* din_2, void* din_3, void* din_4, void* din_5, void* din_6, void* din_7, void* din_8, void* din_9, void* din_10, void* din_11, void* din_12, void* din_13, void* din_14, void* dout_0)
{
	volatile unsigned short cin[107][3] __attribute__((aligned(8))) = {
		{0xd006, 0x1c1c, 0x0008},
		{0x5000, 0x001a, 0x0009},
		{0x8eab, 0x0100, 0x000a},
		{0x0000, 0x0000, 0x000b},
		{0xe800, 0x1c00, 0x0010},
		{0x01c0, 0x0018, 0x0011},
		{0x8fba, 0x0100, 0x0012},
		{0x0000, 0x0000, 0x0013},
		{0xf806, 0x1c00, 0x0018},
		{0x01c0, 0x0018, 0x0019},
		{0x8fba, 0x0100, 0x001a},
		{0x0000, 0x0000, 0x001b},
		{0xc000, 0x1c1c, 0x0020},
		{0x5000, 0x001a, 0x0021},
		{0x8eab, 0x0100, 0x0022},
		{0x0000, 0x0000, 0x0023},
		{0xc002, 0x1c1c, 0x0028},
		{0x5000, 0x001a, 0x0029},
		{0x8eab, 0x0100, 0x002a},
		{0x0000, 0x0000, 0x002b},
		{0xd003, 0x1c1c, 0x0030},
		{0x5000, 0x001a, 0x0031},
		{0x8eab, 0x0100, 0x0032},
		{0x0000, 0x0000, 0x0033},
		{0xe802, 0x1c00, 0x0038},
		{0x01c0, 0x0018, 0x0039},
		{0x8fba, 0x0100, 0x003a},
		{0x0000, 0x0000, 0x003b},
		{0xf803, 0x1c00, 0x0040},
		{0x01c0, 0x0018, 0x0041},
		{0x8fba, 0x0100, 0x0042},
		{0x0000, 0x0000, 0x0043},
		{0x0000, 0x0000, 0x0058},
		{0x0000, 0x0000, 0x0060},
		{0x0000, 0x0000, 0x0068},
		{0x4000, 0x0010, 0x0078},
		{0x0000, 0x0030, 0x0080},
		{0x0000, 0x0000, 0x0088},
		{0x400d, 0x0004, 0x00a1},
		{0x800d, 0x0002, 0x00a9},
		{0xc20e, 0x0004, 0x00b9},
		{0x400d, 0x0004, 0x00c1},
		{0x4000, 0x000c, 0x00f0},
		{0x0000, 0x0080, 0x00f8},
		{0x40c0, 0x0004, 0x0100},
		{0x2000, 0x0004, 0x0108},
		{0x0000, 0x0020, 0x0110},
		{0x830e, 0x0008, 0x0131},
		{0x400e, 0x0002, 0x0139},
		{0x810e, 0x0008, 0x0141},
		{0x804e, 0x0002, 0x0149},
		{0x400d, 0x0004, 0x0151},
		{0x0008, 0x0000, 0x0180},
		{0x0000, 0x0200, 0x0188},
		{0x000c, 0x0400, 0x0190},
		{0x4011, 0x0000, 0x01c9},
		{0x0000, 0x0080, 0x01ca},
		{0x2a58, 0x0100, 0x01cb},
		{0x0000, 0x0000, 0x01cc},
		{0x410e, 0x0006, 0x01d1},
		{0x0000, 0x0000, 0x0218},
		{0x0000, 0x4030, 0x0220},
		{0x8000, 0x0180, 0x0228},
		{0x0000, 0x0200, 0x0230},
		{0x000d, 0x0007, 0x0259},
		{0xc02d, 0x0004, 0x0261},
		{0xc10d, 0x0008, 0x0269},
		{0xc08e, 0x0002, 0x0271},
		{0x0000, 0x0010, 0x0298},
		{0x0000, 0x0020, 0x02a0},
		{0x0010, 0x0020, 0x02a8},
		{0x0020, 0x0000, 0x02b0},
		{0x0114, 0x0000, 0x02b8},
		{0x0000, 0x0003, 0x02c0},
		{0x0000, 0x0001, 0x02c8},
		{0xd004, 0x1c1c, 0x02d8},
		{0x5000, 0x001a, 0x02d9},
		{0x8eab, 0x0100, 0x02da},
		{0x0000, 0x0000, 0x02db},
		{0xe801, 0x1c00, 0x02e0},
		{0x01c0, 0x0018, 0x02e1},
		{0x8fba, 0x0100, 0x02e2},
		{0x0000, 0x0000, 0x02e3},
		{0xd805, 0x1c1c, 0x02e8},
		{0x5000, 0x001a, 0x02e9},
		{0x8eab, 0x0100, 0x02ea},
		{0x0000, 0x0000, 0x02eb},
		{0xc003, 0x1c1c, 0x02f0},
		{0x5000, 0x001a, 0x02f1},
		{0x8eab, 0x0100, 0x02f2},
		{0x0000, 0x0000, 0x02f3},
		{0x0000, 0x1c00, 0x02f8},
		{0x0000, 0x8018, 0x02f9},
		{0x8000, 0x0d00, 0x02fa},
		{0x0000, 0x0000, 0x02fb},
		{0x0800, 0x1c00, 0x0300},
		{0x0000, 0x8018, 0x0301},
		{0x8000, 0x9d00, 0x0302},
		{0x0000, 0x0000, 0x0303},
		{0xf805, 0x1c00, 0x0308},
		{0x01c0, 0x0018, 0x0309},
		{0x8fba, 0x0100, 0x030a},
		{0x0000, 0x0000, 0x030b},
		{0xf004, 0x1c00, 0x0310},
		{0x01c0, 0x0018, 0x0311},
		{0x8fba, 0x0100, 0x0312},
		{0x0000, 0x0000, 0x0313},
	};

	load_cfg((void*)cin, 0x20000, 642, 0, 0);
	load_data(din_0, 0x18000, 32, 0, 0, 0);
	load_data(din_1, 0x0, 428780, 1, 0, 0);
	load_data(din_2, 0x10000, 428780, 1, 0, 0);
	load_data(din_3, 0x8000, 428780, 1, 0, 0);
	load_data(din_4, 0xc000, 428780, 1, 0, 0);
	load_data(din_5, 0x14000, 428780, 1, 0, 0);
	load_data(din_6, 0x16000, 428780, 1, 0, 0);
	load_data(din_7, 0x4000, 428780, 0, 0, 0);
	load_data(din_8, 0x2000, 564, 1, 0, 0);
	load_data(din_9, 0x12000, 564, 1, 0, 0);
	load_data(din_10, 0xa000, 564, 1, 0, 0);
	load_data(din_11, 0xe000, 564, 1, 0, 0);
	load_data(din_12, 0x1c000, 564, 1, 0, 0);
	load_data(din_13, 0x1e000, 564, 1, 0, 0);
	load_data(din_14, 0x6000, 564, 0, 0, 0);
	config(0x0, 107, 0, 0);
	execute(0xffff, 0, 0);
	store(dout_0, 0x1a000, 32, 0, 0);
}