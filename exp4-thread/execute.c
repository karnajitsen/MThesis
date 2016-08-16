#include<stdio.h>
#include<math.h>
#include <time.h>
int main()
{

   FILE *fp;
   int m, stride, noofthreads; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   m = 5000;
   stride = 1;
   // gettimeofday(&tv2, NULL);
   fp = fopen("execute.sh", "w+");
   fprintf(fp, "cd data\n");
   fprintf(fp, "mv result.txt result.bk_%d\n",(int)time(NULL));
   
   fprintf(fp, "cd ..\n");

   while ( noofthreads < m)
        {
   fprintf(fp, "./kr %d %d %d\n", m, stride, noofthreads);
    noofthreads+=2;
    }
   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}