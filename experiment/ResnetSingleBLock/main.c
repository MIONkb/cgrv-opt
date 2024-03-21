#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <malloc.h>
#include "include/encoding.h"
#include "include/ISA.h"

float* forward(float[1][3][224][224]);
//return %alloc_11 : memref<1x64x56x56xf32>
int main(int argc, char** argv)
{
  printf("CPU+cgra execute Resnet4!\n");
  long long unsigned start;
  long long unsigned end;
	float a [1][3][224][224];

	int d0 , d1, d2, d3;
	for(d0 = 0; d0 < 1; d0++){
    for(d1 = 0; d1 < 3; d1++){
      for(d2 = 0; d2 < 224; d2++){
        for(d3 = 0; d3 < 224; d3++){
          a[d0][d1][d2][d3]=1;
        }
      }
    }
  } 
  printf("value assign!\n");

  start = rdcycle();
  printf("start cycle:%d\n",start);
  float* b = (float*)forward(a);
  end = rdcycle();
  printf("It takes %d cycles for cpu to finish the task.\n", end - start);

  printf("c:\n");
	for(int i = 0; i < 1*64*56*56; i++){
    //return %alloc_11 : memref<1x64x56x56xf32>
      int I = (int)(*(b+i)*10000);
      printf("b[%d]:%d\n",i, I);
  } 
  // result_check();
  printf("test complete!\n");

  return 0;
}