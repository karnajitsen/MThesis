#include<stdio.h>
#include "repeat.h"
typedef unsigned long long Dtype;
//typedef double Dtype;
//typedef int Dtype;
#define REPEAT 10
__global__ void VecAdd(Dtype** A, int* N, unsigned long long* d_time, Dtype* xj, Dtype* xi)
{
   Dtype *j = *A;   
   Dtype **k;
   unsigned int start_t, end_t;  
   k = (Dtype **) malloc(sizeof(Dtype) * (1024 * (*N)));
   
   for (int it=0; it < *N; it++)   
    j=*(Dtype **)j;
     
    *xi=*j;   
   *d_time = 0;
      
    for (int it=0; it < (*N) * 10; it++) 
    {
       start_t = clock();
       repeat256(j=*(Dtype **)(unsigned long long)j;)
      // k[it] = j;
       end_t = clock();
       ((Dtype *)A)[*N]=(Dtype) j;
       *d_time += (unsigned long long)(end_t - start_t);
       
    }
   
     
    // ((Dtype *)A)[*N]=(Dtype) j;
     //*d_time = (unsigned long long)(end_t - start_t); 
    // printf( "%d %llu\n", *N, *d_time/256/4);
   
}

