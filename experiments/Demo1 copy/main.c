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
  printf("CPU+cgra execute!\n");
  long long unsigned start;
  long long unsigned end;
	float a [4][3];

  float ff = 2.0; 
  printf("ff: %2.f \n", ff);
	int i , j;
	for(i = 0; i < 4; i++)
    for(j = 0; j < 3; j++)
		  a[i][j]=i*2+j;

  start = rdcycle();
  printf("start cycle:%d\n",start);
  float** b = forward(a);
  end = rdcycle();

  printf("It takes %d cycles for CPU to finish the task.\n", end - start);

  printf("c:\n");
	for(i = 0; i < 4; i++){
    for(j = 0; j < 3; j++)
      if(b[i][j] != c[i][j]){
        printf("test fail!");
        break;
      }
    printf("\n");
  } 
  // result_check();
  printf("test success!\n");

  return 0;
}