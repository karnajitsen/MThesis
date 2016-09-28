#include <stdio.h> 

int main() {
  int nDevices;

  cudaGetDeviceCount(&nDevices);
  for (int i = 0; i < nDevices; i++) {
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, i);
    printf("Device Number: %d\n", i);
    printf("  Device name: %s\n", prop.name);
    printf("  Memory Clock Rate (KHz): %d\n",
           prop.memoryClockRate);
    printf("  Memory Bus Width (bits): %d\n",
           prop.memoryBusWidth);
    printf("  Peak Memory Bandwidth (GB/s): %f\n\n",
           2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);
    printf("  L2 cache size: %d\n\n", prop.l2CacheSize);
    printf("  total Global Memory size: %d\n\n", prop.totalGlobalMem);
    printf("  Unified addressing: %d\n\n", prop.unifiedAddressing);
     printf("  memoryBusWidth: %d\n\n", prop.memoryBusWidth);
    printf(" memoryClockRate: %d\n\n", prop.memoryClockRate);
    printf(" pciBusID: %d\n\n", prop.pciBusID);
    printf(" pciDeviceID: %d\n\n", prop.pciDeviceID);
    printf(" pciDomainID: %d\n\n", prop.pciDomainID); 
    
    
  }
} 
