#include<iostream>
#include <stdint.h>
#include<stdio.h>
#include<fstream>
#include <stdlib.h>
#include <malloc.h>
#include <iomanip>
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
   double tottime;
   Dtype *xj, *xi;
   Dtype *h_A, **d_A;
   int *d_N;           
   std::ofstream fp;
   srand (time(NULL));
   
    fp.open("/home/hpc/ihpc/ihpc002h/gpu-exp/mThesis/exp5/data/result.txt", std::ofstream::app);
 
    h_A  = (Dtype*)memalign(ALLIGNMENT,(N+2)*sizeof(Dtype)); 
     
    
    cudaMalloc(&d_A, (N+2)*sizeof(Dtype));
    cudaMalloc(&d_time, sizeof(unsigned long long));
    cudaMalloc(&xj, sizeof(Dtype));
    cudaMalloc(&xi, sizeof(Dtype));
    cudaMalloc(&d_N, sizeof(int));    
        
    //int step = gcf (STRIDE, N);
    
     for(unsigned int i=0; i < N ; i++)
    {
     // stride = rand()%20;
      
      h_A[i] = ((Dtype)(uintptr_t)d_A) +  ( (i + stride) % N)*sizeof(Dtype);
    //  h_A[i] = i+1;
    }
    
    
    h_A[N]=0.0;
    h_A[N+1]=0.0;         
    tottime = 0.0;
    
    for (int i=0; i < 10; i++)
    {
    
     dim3 Db = dim3(1);
     dim3 Dg = dim3(1,1,1);
    cudaMemcpy(d_A, h_A, (N+2)*sizeof(Dtype), cudaMemcpyHostToDevice );
    cudaMemcpy(d_N, &N, sizeof(int), cudaMemcpyHostToDevice );
   
    VecAdd<<<Db,Dg>>>(d_A, d_N, d_time, xj, xi);    
          
    cudaDeviceSynchronize();
    cudaMemcpy(&h_time, d_time, sizeof(unsigned long long), cudaMemcpyDeviceToHost);
   // cout << h_time << endl;
    tottime += (double) h_time;
    }
  //  cout << std::fixed << std::setprecision(6) << tottime << std::endl;
    tottime = tottime / (10240.0);
    fp << N*8.0/1024.0 << " " << tottime << std::endl;
   // std::cout << std::setprecision(2);
  //  cout << std::fixed << std::setprecision(6) << tottime << std::endl;
    
    for(int i =0; i < N ; i++)
    {
     //printf("%f ",(h_A[i]));
    }
   
    cudaFree(d_A);
    cudaFree(d_time);
    free(h_A);
    fp.close();
}
