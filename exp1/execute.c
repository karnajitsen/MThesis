#include<stdio.h>
#include<math.h>
#include <time.h>
int main()
{

   FILE *fp;
   int m, stride; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   m = 150000;
   // gettimeofday(&tv2, NULL);
   fp = fopen("execute.sh", "w+");
   fprintf(fp, "cd data\n");
   fprintf(fp, "mv result.txt result.bk_%d\n",(int)time(NULL));
   
   fprintf(fp, "cd ..\n");

   while ( (m*8.0/1024 ) < 1600)
        {
   fprintf(fp, "./kr %d %d\n", m, stride);
    m +=1;
    }
   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}