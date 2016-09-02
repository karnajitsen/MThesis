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
   //for (int it=0; it < *N; it++)   
     //j=*(Dtype **)j;
     
    //*xi=*j;   
   
     start_t = clock(); 
    for (int it=0; it < *N * 16; it++) 
    {
       j=*(Dtype **)(unsigned long long)j;    
    }
   
     end_t = clock();
     ((Dtype *)A)[*N]=(Dtype) j;
   *d_time = (unsigned long long)(end_t - start_t) /(*N * 16); 
   //printf( "%d %llu\n", *N, *d_time);
   
}

