#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <malloc.h>
#include "include/encoding.h"
#include "include/ISA.h"

int* forward(int[2], int[2]);
int main(int argc, char** argv)
{
  printf("CPU+cgra execute!\n");
  long long unsigned start;
  long long unsigned end;
	int a[2] = {1,2};
  int b[2] = {30,40};

  start = rdcycle();
  printf("start cycle:%d\n",start);
  int* c = forward(a, b);
  end = rdcycle();

  printf("It takes %d cycles for CPU to finish the task.\n", end - start);

  printf("c:\n");
	for(int i = 0; i < 2; i++){
    printf("c[%d]:%d ", i , c[i]);
  }
  printf("\n");

  // result_check();
  printf("test success!\n");

  return 0;
}