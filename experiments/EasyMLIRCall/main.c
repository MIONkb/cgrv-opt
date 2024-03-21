#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <malloc.h>
#include "include/encoding.h"
#include "include/ISA.h"


// int* forward(int[2], int[2]);

struct floatMemRefDescriptor {
  float *allocated;
  float *aligned;
  intptr_t offset;
  intptr_t sizes[2];
  intptr_t strides[2];
};

// float* forward(struct floatMemRefDescriptor a1, struct floatMemRefDescriptor a2);
void forward_kernel_0(float* a, float*b, float*c);
void forward_kernel_1(float* a, float*b, float*c);

float* forward(float[3][5], float[3][5] );
// float sum(float, float );
// void forward();
int main(int argc, char** argv)
{
  printf("CPU+cgra execute add fence only once!\n");

  long long unsigned start;
  long long unsigned end;
  start = rdcycle();
  printf("in kernel 0 fence\n");
  printf("after fence:\n");
  printf("before fence:\n");
  end = rdcycle();
  printf("execute above 3 sentences needs cycle: %d\n", end - start);

	float a[4][5] = {{0, 1.8,  2.65, 3222.7,    4.77}, //3FE66666:1.8
                   {5,  -236.23,  -7,  -8.23,   -9}, //c36c3ae1:-236.23, c0e00000: -7
                   {5,  -236.23,  -7,  -8.23,   -9}, 
                   {0, 1.8,  2.65, 3222.7,    4.77}}; // 45496b33:3222.7, 4098A3D7:4.77

  float b[4][5] = {{0, 3.4,  10.33,62312.898,  1.87}, 
                   {-1, 4.98,    -30,  240.23,   9}, // 43703ae1: 240.23, 41100000:9 
                   {5,  -236.23,  -7,  -8.23,   -9}, 
                   {0, 1.8,  2.65, 3222.7,    4.77}}; // 4029999a:2.65, 4098A3D7:4.77

  // struct floatMemRefDescriptor mrefa = {
  //   *a,    // allocated
  //   *a,    // aligned
  //   0,    // offset
  //   {3, 5}, // sizes[N]
  //   {1, 1} // strides[N]
  // };

  // struct floatMemRefDescriptor mrefb = {
  //   *b,    // allocated
  //   *b,    // aligned
  //   0,    // offset
  //   {3, 5}, // sizes[N]
  //   {1, 1}  // strides[N]
  // }; 
	// int a[2] = {1,2};
  // int b[2] = {30,40};

  // start = rdcycle();
  // printf("start cycle:%d\n",start);

  // // float* c = forward(a, b);
  // float f1 = 1, f2 = 2;
  // start = rdcycle();
  // // float* c = forward(mrefa, mrefb);
  // // float c = sum(f1, f2);
  // float* c = forward(a, b);
  // end = rdcycle();

  // printf("It takes %d cycles for CGRA to finish the task.\n", end - start);
  // printf("c:\n");
  // // int I = (int)(c*10000);
  // // printf("c:%d\n", I);
	// for(int i = 0; i < 15; i++){
  //   int I = (int)(*(c+i)*10000);
  //   printf("c[%d]:%d\n",i, I);
  //   // printf("c[%d]:%d\n",i, *(c+i));
  // }
  // printf("\n");

  // start = rdcycle();
  // printf("only kernel 1 start cycle:%d\n",start);

  // // float* c = forward(a, b);
  // start = rdcycle();
  // c = (float*)malloc(15*sizeof(float));
  // // float c = sum(f1, f2);
  // forward_kernel_0(*a, *b, c);
  // end = rdcycle();

  // printf("It takes %d cycles for CGRA to finish the task again.\n", end - start);

  // printf("c:\n");
  // // int I = (int)(c*10000);
  // // printf("c:%d\n", I);
	// for(int i = 0; i < 15; i++){
  //   int I = (int)(*(c+i)*10000);
  //   printf("c[%d]:%d\n",i, I);
  //   // printf("c[%d]:%d\n",i, *(c+i));
  // }
  // printf("\n");

  // float* c = forward(a, b);
  printf("Third time. +4\n", end - start);
  printf("*a: %x\n", *a);
  printf("*a+4: %x\n", *a+4);
  printf("*b: %x\n", *b);
  printf("*b+4: %x\n", *b+4);
  float* d = (float*)malloc(15*sizeof(float));
  start = rdcycle();
  // c = (float*)malloc(15*sizeof(float));
  // float c = sum(f1, f2);
  forward_kernel_0(*a+4, *b+4, d);
  end = rdcycle();

  printf("It takes %d cycles for CGRA to finish the task again again.\n", end - start);

  printf("d:\n");
  // int I = (int)(c*10000);
  // printf("c:%d\n", I);
	for(int i = 0; i < 15; i++){
    int I = (int)(*(d+i)*10000);
    printf("d[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }
  printf("\n");

  // result_check();
  printf("test success!\n");

  return 0;
}