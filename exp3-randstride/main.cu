#include<iostream>
#include <stdint.h>
#include<stdio.h>
#include<fstream>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>
#include <sstream>
#include <time.h>
#include <cuda.h>
using namespace std;
#define REPEAT 1
#define STRIDE 1
#define CACHELINE 8
#define ALLIGNMENT 64
typedef unsigned long long Dtype;


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
   unsigned long long *d_time;
   unsigned long long *h_time;
   Dtype *xj, *xi;
   Dtype *h_A, **d_A;
   int *d_N;           
   std::ofstream fp;
   std::ostringstream fpath;
   // int i=system("pwd");
    string dpath = "/home/hpc/ihpc/ihpc002h/gpu-exp/mThesis/exp3-randstride/data/result.txt";
    srand (time(NULL));
    //fpath << i + dpath;
    
    //cout << fpath << " ***** ";
    fp.open(dpath.c_str(), std::ofstream::app);
 
    h_A  = (Dtype*)memalign(ALLIGNMENT,(N+2)*sizeof(Dtype)); 
    h_time = (unsigned long long *) malloc(N*sizeof(unsigned long long));
    
    cudaMalloc(&d_A, (N+2)*sizeof(Dtype));
    cudaGetErrorString(cudaMalloc((void **)&d_time, N*sizeof(unsigned long long)));
    cudaMalloc(&xj, sizeof(Dtype));
    cudaMalloc(&xi, sizeof(Dtype));
    cudaMalloc(&d_N, sizeof(int));    
        
    
    //int step = gcf (STRIDE, N);
    
     for(unsigned int i=0; i < N ; i++)
    {      
      stride = rand()%10;
      //stride = 1;
      h_A[i] = ((Dtype)(uintptr_t)d_A) +  ( (i + stride) % N)*sizeof(Dtype);
      
    }
    
    h_A[N]=0;
    h_A[N+1]=0;         
    
    cudaMemcpy(d_A, h_A, (N+2)*sizeof(Dtype), cudaMemcpyHostToDevice );
    cudaMemcpy(d_N, &N, sizeof(int), cudaMemcpyHostToDevice );
    cudaGetErrorString(cudaMemcpy(d_time, h_time, N*sizeof(unsigned long long), cudaMemcpyHostToDevice ));    
    VecAdd<<<((N-1)/32)+1,32>>>(d_A, d_N, d_time, xj, xi);
    cudaDeviceSynchronize();
    cudaGetErrorString(cudaMemcpy(h_time, d_time, N*sizeof(unsigned long long), cudaMemcpyDeviceToHost)) ;
    //cudaDeviceSynchronize();
    fp << N << " " << h_time[0] << std::endl;
    
    // printf("\n%llu ",(h_A[0]));
    
    //for(int i =0; i < N ; i++)
   // {
     printf("\n%llu ",h_time[0]);
   // }
   
    cudaFree(d_A);
    free(h_A);
    cudaFree(d_time);
    free(h_time);
    fp.close();
}
