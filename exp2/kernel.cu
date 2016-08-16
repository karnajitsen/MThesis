#include<time.h>
#include<stdio.h>
#include<iostream>
#define BLOCK 16
#define Real unsigned long long
using namespace std;

__global__ void VecAdd(Real* A, int* N, unsigned long long* d_time, int *xj, int *xi)
{
   int j = 0;
   unsigned int start_t, end_t;
   int iteration=BLOCK;
     
   for (int it=0; it < *N; it++)   
     j=A[j];
   
   *xi=j; 
  //for(int i = 0; i< *N/BLOCK; i++)
   //{
    start_t = clock();
    //for (int repeat=0; repeat < 5; repeat++)
    //{
    // j=0;
    for (int it=0; it < iteration; it++)   
    j=A[j];
    //} 
   end_t = clock();
   iteration += BLOCK;
   *(d_time+i) = (unsigned long long)(end_t - start_t)/(iteration*5) ; 
   printf( "%llu %d\n", *(d_time+i),j);
   //}
   *xj=j;
}

