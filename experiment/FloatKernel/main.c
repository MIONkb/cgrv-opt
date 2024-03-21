#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <malloc.h>
#include "include/encoding.h"
#include "include/ISA.h"

float* forward(float[3][3]);
int main(int argc, char** argv)
{
  printf("CPU+cgra execute!\n");
  long long unsigned start;
  long long unsigned end;
	float a [3][3];

	int i , j;
	for(i = 0; i < 3; i++){
    for(j = 0; j < 3; j++){
		  a[i][j]=1;
    }
  } 

  start = rdcycle();
  printf("start cycle:%d\n",start);
  float* b = (float*)forward(a);
  end = rdcycle();

  // printf("It takes %d cycles for CPU to finish the task.\n", end - start);

  printf("c:\n");
	for(i = 0; i < 9; i++){
      int I = (int)(*(b+i)*10000);
      printf("b[%d]:%d\n",i, I);
  } 
  // result_check();
  printf("test complete!\n");

  return 0;
}