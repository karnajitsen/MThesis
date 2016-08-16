#include<stdio.h>
#include<math.h>
#include <time.h>
int main()
{

   FILE *fp;
   int m, stride; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   m = 128000;
   stride = 1;
   // gettimeofday(&tv2, NULL);
   fp = fopen("execute.sh", "w+");
   fprintf(fp, "cd data\n");
   fprintf(fp, "mv result.txt result.bk_%d\n",(int)time(NULL));
   
   fprintf(fp, "cd ..\n");

   while ( stride < 100)
        {
   fprintf(fp, "./kr %d %d\n", m, stride);
    stride++;
    }
   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}