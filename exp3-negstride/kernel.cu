#include<time.h>
#include<stdio.h>
typedef unsigned long long Dtype;


__global__ void VecAdd(Dtype** A, int* N, unsigned long long* d_time, Dtype* xj, Dtype* xi)
{
   Dtype *j = *(A+*N-1);   
   unsigned int start_t, end_t;
   
   for (int it=0; it < *N; it++)   
     j=*(Dtype **)j;
     
    *xi=*j;   
   
     start_t = clock(); 
     for (int it=0; it < *N*5; it++) 
     {
     j=*(Dtype **)j;     
    // printf("%llu***\n",j);
     }
     end_t = clock();
     
   *d_time = (unsigned long long)(end_t - start_t)/(*N*5); 
   printf( "%llu %u %u ", *d_time, start_t, end_t);
   *xj=*j;
}

