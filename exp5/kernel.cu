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
  
   for (int it=0; it < *N; it++)   
    j=*(Dtype **)j;
     
    *xi=*j;   
   *d_time = 0;
      
    for (int it=0; it < 4; it++) 
    {
       start_t = clock();
       repeat256(j=*(Dtype **)(unsigned long long)j;) 
       end_t = clock();
       ((Dtype *)A)[*N]=(Dtype) j;
       *d_time += (unsigned long long)(end_t - start_t);
       
    }
   
     
    // ((Dtype *)A)[*N]=(Dtype) j;
     //*d_time = (unsigned long long)(end_t - start_t); 
    // printf( "%d %llu\n", *N, *d_time/256/4);
   
}

