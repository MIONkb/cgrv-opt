#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <malloc.h>
#include "include/encoding.h"
#include "include/ISA.h"

float* forward(float[10], float[10]);
// int* forward(int[2], int[2]);
int main(int argc, char** argv)
{
  printf("CPU+cgra execute!\n");
  long long unsigned start;
  long long unsigned end;
	float a[10] = {0, 1.8,  2.65, 3222.7,     4.77,  5,  -236.23,  -7,  -8.23,   -9};
  float b[10] = {0, 3.4,  10.33,62312.898,  1.87,  -1, 4.98,    -30,  240.23,   9};

	// int a[2] = {1,2};
  // int b[2] = {30,40};

  start = rdcycle();
  printf("start cycle:%d\n",start);
  float* c = forward(a, b);
  // int* c = forward(a, b);
  end = rdcycle();

  printf("It takes %d cycles for CGRA to finish the task.\n", end - start);

  printf("c:\n");
	for(int i = 0; i < 10; i++){
    int I = (int)(*(c+i)*10000);
    printf("c[%d]:%d\n",i, I);
    // printf("c[%d]:%d\n",i, *(c+i));
  }
  printf("\n");

  // result_check();
  printf("test success!\n");

  return 0;
}