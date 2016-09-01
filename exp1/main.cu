#include<iostream>
#include <stdint.h>
#include<stdio.h>
#include<fstream>
#include <stdlib.h>
#include <malloc.h>
using namespace std;
#define REPEAT 1
#define STRIDE 1
#define CACHELINE 8
#define ALLIGNMENT 64
typedef unsigned long long Dtype;
//typedef double Dtype;
//typedef int Dtype;
__global__ void VecAdd(Dtype** A, int* N, unsigned long long* d_time, Dtype* xj, Dtype* xi);


int gcf(int a, int b)
{
	if (a == 0) return b;
	return gcf(b % a, a);
}


int main(int argc, char* argv[])
{
   if(argc != 3)
   {
     std::cout << "Wrong number of argument!! Exiting program !!!";
     return 0;
   }
      
  // struct timeval tv1, tv2;
   int N = atoi(argv[1]);
   int stride = atoi(argv[2]);
   unsigned long long *d_time, h_time;
   Dtype *xj, *xi;
   Dtype *h_A, **d_A;
   int *d_N;           
   std::ofstream fp;
   srand (time(NULL));
   
    fp.open("/home/hpc/ihpc/ihpc002h/gpu-exp/mThesis/exp1/data/result.txt", std::ofstream::app);
 
    h_A  = (Dtype*)memalign(ALLIGNMENT,(N+2)*sizeof(Dtype)); 
     
    
    cudaMalloc(&d_A, (N+2)*sizeof(Dtype));
    cudaMalloc(&d_time, sizeof(unsigned long long));
    cudaMalloc(&xj, sizeof(Dtype));
    cudaMalloc(&xi, sizeof(Dtype));
    cudaMalloc(&d_N, sizeof(int));    
        
    //int step = gcf (STRIDE, N);
    
     for(unsigned int i=0; i < N ; i++)
    {
      //stride = rand()%20;
      
      h_A[i] = ((Dtype)(uintptr_t)d_A) +  ( (i + stride) % N)*sizeof(Dtype);
    }
    
    h_A[N]=0.0;
    h_A[N+1]=0.0;         
   
    cudaMemcpy(d_A, h_A, (N+2)*sizeof(Dtype), cudaMemcpyHostToDevice );
    cudaMemcpy(d_N, &N, sizeof(int), cudaMemcpyHostToDevice );
   
    VecAdd<<<1,1>>>(d_A, d_N, d_time, xj, xi);    
    
    cudaMemcpy(&h_time, d_time, sizeof(double), cudaMemcpyDeviceToHost);
  
    cudaDeviceSynchronize();
   
    fp << N*8.0/1024.0 << " " << h_time << std::endl;
    
    for(int i =0; i < N ; i++)
    {
     //printf("%f ",(h_A[i]));
    }
   
    cudaFree(d_A);
    cudaFree(d_time);
    free(h_A);
    fp.close();
}
