#include<stdio.h>
#include<math.h>
#include <time.h>
#include <string.h>
#include<stdlib.h>
#include<iostream>

using namespace std;
int main(int argc, char * argv[])
{

   FILE *fp;
   int m, stride; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   stride = atoi(argv[1]);
   m = ceil(1000*1024/8);
   // gettimeofday(&tv2, NULL);
   char filename[100];
   strcpy(filename, "execute");
  //strcat(filename, argv[1]);
   strcat(filename,".sh");
   //cout << filename;
     fp = fopen(filename, "w+");
   fprintf(fp, "cd data\n");
   fprintf(fp, "mv result.txt result.bk_%d_%d\n",(int)time(NULL),stride);
   //stride = 8;
   stride = 1;
   fprintf(fp, "cd ..\n");

   while ( (m*8.0/1024 ) < 1400)
        {
   fprintf(fp, "./kr %d %d\n", m, stride);
    m += 4;
    }
    

   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}
