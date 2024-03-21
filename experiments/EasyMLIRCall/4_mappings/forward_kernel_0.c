#include "include/ISA.h"
void forward_kernel_0(void* din_0, void* din_1, void* dout_0)
{
	volatile unsigned short cin[15][3] __attribute__((aligned(8))) = {
		{0xc00e, 0x0008, 0x0269},
		{0x0110, 0x0000, 0x02b0},
		{0x0000, 0x0000, 0x02b8},
		{0x2000, 0x1400, 0x02f0},
		{0x0040, 0x0018, 0x02f1},
		{0x0000, 0x0100, 0x02f2},
		{0x0000, 0x0000, 0x02f3},
		{0x2800, 0x1400, 0x02f8},
		{0x0040, 0x0018, 0x02f9},
		{0x0000, 0x8900, 0x02fa},
		{0x0000, 0x0000, 0x02fb},
		{0x2000, 0x1400, 0x0300},
		{0x0040, 0x0018, 0x0301},
		{0x0000, 0x0100, 0x0302},
		{0x0000, 0x0000, 0x0303},
	};

	float* a = (float*)din_0;
	float* b = (float*)din_1;
	printf("In kernel func:\n");
	printf("din_0:\n");
	for(int i = 0; i < 15; i++){
    int I = (int)(*(a+i)*10000);
    printf("a[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }
	printf("din_1:\n");
	for(int i = 0; i < 15; i++){
    int I = (int)(*(b+i)*10000);
    printf("b[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }

	load_cfg((void*)cin, 0x20000, 90, 0, 0);
	load_data(din_0, 0x10000, 60, 0, 0, 0);
	load_data(din_1, 0x18000, 60, 0, 0, 0);
	config(0x0, 15, 0, 0);
	execute(0x3800, 0, 0);
	store(dout_0, 0x1a000, 60, 0, 0);
	printf("before fence\n");
	fence(1);
	printf("after fence\n");
	float* f = (float*)dout_0;
	printf("output:\n");
	for(int i = 0; i < 15; i++){
    int I = (int)(*(f+i)*10000);
    printf("f[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }
}

void forward_kernel_1(void* din_0, void* din_1, void* dout_0)
{
	volatile unsigned short cin[15][3] __attribute__((aligned(8))) = {
		{0xc00e, 0x0008, 0x0269},
		{0x0110, 0x0000, 0x02b0},
		{0x0000, 0x0000, 0x02b8},
		{0x2000, 0x1400, 0x02f0},
		{0x0040, 0x0018, 0x02f1},
		{0x0000, 0x0100, 0x02f2},
		{0x0000, 0x0000, 0x02f3},
		{0x2800, 0x1400, 0x02f8},
		{0x0040, 0x0018, 0x02f9},
		{0x0000, 0x8900, 0x02fa},
		{0x0000, 0x0000, 0x02fb},
		{0x2000, 0x1400, 0x0300},
		{0x0040, 0x0018, 0x0301},
		{0x0000, 0x0100, 0x0302},
		{0x0000, 0x0000, 0x0303},
	};

	float* a = (float*)din_0;
	float* b = (float*)din_1;
	printf("In kernel func 1:\n");
	printf("din_0:\n");
	for(int i = 0; i < 15; i++){
    int I = (int)(*(a+i)*10000);
    printf("a[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }
	printf("din_1:\n");
	for(int i = 0; i < 15; i++){
    int I = (int)(*(b+i)*10000);
    printf("b[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }

	load_cfg((void*)cin, 0x20000, 90, 1, 0);
	load_data(din_0, 0x10000, 60, 0, 1, 0);
	load_data(din_1, 0x18000, 60, 0, 1, 0);
	config(0x0, 15, 1, 0);
	execute(0x3800, 1, 0);
	store(dout_0, 0x1a000, 60, 1, 0);
	printf("before fence\n");
	fence(1);
	printf("after fence\n");
	float* f = (float*)dout_0;
	printf("output:\n");
	for(int i = 0; i < 15; i++){
    int I = (int)(*(f+i)*10000);
    printf("f[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }
}
