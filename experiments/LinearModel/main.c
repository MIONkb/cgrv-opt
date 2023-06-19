#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <malloc.h>
#include "include/encoding.h"
#include "include/ISA.h"

float** forward(float[4][3]);
int main(int argc, char** argv)
{
  printf("IT is stupid!\n");
  long long unsigned start;
  long long unsigned end;
	float a [4][3];
  float** b;
	int i , j;
	for(i = 0; i < 4; i++)
    for(j = 0; j < 3; j++)
		  a[i][j]=i*2+j;

  printf("Before malloc!\n");
  int* mlc_ptr = (int*)malloc(12 * sizeof(int));

  printf("after malloc!\n");
  for(i = 0; i < 12; i++){
    mlc_ptr[i]=(int)*(a+i);
  }
  for(i = 0; i < 12; i++){
    printf(" %d",mlc_ptr[i]);
  }
  printf("\n12 values!\n");

  start = rdcycle();
  printf("start cycle:%d\n",start);
  b = forward(a);
  end = rdcycle();

  printf("It takes %d cycles for CPU to finish the task.\n", end - start);
  printf("b:\n");
	for(i = 0; i < 4; i++){
    for(j = 0; j < 3; j++)
      printf("[%d,%d]:%f  ", i, j, b[i][j]);
    printf("\n");
  } 
  // result_check();
  printf("Done!\n");

  return 0;
}