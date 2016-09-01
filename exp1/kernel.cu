#include<stdio.h>
#include "repeat.h"
typedef unsigned long long Dtype;
//typedef double Dtype;
//typedef int Dtype;
#define REPEAT 10
__global__ void VecAdd(Dtype** A, int* N, unsigned long long* d_time, Dtype* xj, Dtype* xi)
{
   Dtype *j = *A;   
   unsigned int start_t, end_t;
  // int a=0;
   for (int it=0; it < *N; it++)   
     j=*(Dtype **)j;
     
    *xi=*j;   
   
     start_t = clock(); 
    // for (int it=0; it < *N; it++) 
    //{
       repeat2048(j=*(Dtype **)(unsigned long long)j;)
       repeat2048(j=*(Dtype **)(unsigned long long)j;)
      // printf("hello");
       //a+= *N;
    //}
     //repeat2048(j=*(Dtype **)(unsigned long long)j;)
     //repeat2048(j=*(Dtype **)(unsigned long long)j;)
    // printf("%llu***\n",j);
     //}
     end_t = clock();
      ((Dtype *)A)[*N]=(Dtype) j;
    //printf("Hello"); 
   *d_time = (unsigned long long)(end_t - start_t) /(2*2048); 
   //printf( "%d %llu %u %u %d\n", *N, *d_time, start_t,  end_t,a);
   
}

