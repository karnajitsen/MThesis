#include<iostream>
#include<algorithm>
#include<stdio.h>
#include<fstream>
#include <stdlib.h>
#include <malloc.h>
using namespace std;
#define REPEAT 1
#define Real unsigned int
#define STRIDE 1
#define CACHELINE 8
#define ALLIGNMENT 64
#define BLOCK 16
__global__ void VecAdd(Real** A, int* N, unsigned long long* d_time, int* xj, int* xi);


int main(int argc, char* argv[])
{
   if(argc != 2)
   {
     std::cout << "Wrong number of argument!! Exiting program !!!";
     return 0;
   }
      
  // struct timeval tv1, tv2;
   int N = atoi(argv[1]);
   //register long elapsed=0;
   Real **h_A, **d_A;
   int *d_N;// *B, *C, *d_A, *d_B, *d_C ;           
   std::ofstream fp;
   fp.open("/home/hpc/ihpc/ihpc002h/gpu-exp/Master-thesis/exp2/data/result.txt", std::ofstream::app);
    unsigned long long *d_time, *h_time;
    Real *xj;
    A  = (Real*)memalign(ALLIGNMENT,(N+2)*sizeof(Real)); 
    h_time = (unsigned long long *)memalign(ALLIGNMENT, N*sizeof(unsigned long long)/BLOCK);
    
    cudaMalloc(&d_A, (N)*sizeof(Real));
    cudaMalloc(&d_time, N*sizeof(unsigned long long)/BLOCK);
    cudaMalloc(&xj, sizeof(int));
    cudaMalloc(&d_N, sizeof(Real));
    
    
   for(int i=0; i < N ; i++)
    {
      A[i] = (i+STRIDE)%N;
     // B[i] = rand()%5;
      //C[i] = 0.0;
      
    }
    A[N]=0;
    
    cudaMemcpy(d_A, h_A, (N+2)*sizeof(Real), cudaMemcpyHostToDevice );
    cudaMemcpy(d_N, &N, sizeof(int), cudaMemcpyHostToDevice );
    //cudaMemcpy(d_C, C, N*sizeof(Real), cudaMemcpyHostToDevice );
    
    //for(int i=0 ; i < REPEAT ; i++)
    //{
    //gettimeofday(&tv1, NULL);                  
    VecAdd<<<1,1>>>(d_A, d_N, d_time, xj);
    //gettimeofday(&tv2, NULL);
    //elapsed += ((tv2.tv_sec-tv1.tv_sec)*1000000.0 + (tv2.tv_usec-tv1.tv_usec));
    //}
    
    cudaMemcpy(h_time, d_time,  N*sizeof(unsigned long long)/BLOCK, cudaMemcpyDeviceToHost);
    cudaDeviceSynchronize();
   //cout << N << std::endl;
    
    //double td = (N * 8.0)/1024;
    //cout << h_time << " " << CLOCKS_PER_SEC << std::endl;
    
    //fp << N*4.0/1024.0 << " " << h_time << std::endl;
    
    for(int i =0; i < N/BLOCK ; i++)
    {
      fp << (i+1)*BLOCK << " " << *(h_time+i) << std::endl;
    }
     //fs << std::endl;
   
    cudaFree(d_A);
    free(A);
    //cudaFree(d_B);
    //cudaFree(d_C);
    fp.close();
}
