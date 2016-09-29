#include<time.h>
#include<stdio.h>
#include<cuda.h>
#include "repeat.h"
typedef unsigned long long Dtype;


__global__ void VecAdd(Dtype** A, int* N, unsigned long long* d_time, Dtype* xj, Dtype* xi)
{
   Dtype *j;
     unsigned int start_t, end_t;
   int tid = threadIdx.x + blockIdx.x * blockDim.x;
  
   //for (int it=0; it < *N; it++)   
     j=A[tid];
     
    *xi=*j;   
   
     start_t = clock(); 
    //for (int it=0; it < 1000; it++) 
     //{     
     //temp=j;
     j=A[tid];
     //}
     end_t = clock();
    // printf("%d %d \n", tid, sizeof(d_time));
   d_time[tid] = (unsigned long long)(end_t - start_t); 
   printf( "%llu %u %u \n", d_time[tid], start_t, end_t);
   *xj=*j;
}

