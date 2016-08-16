#include<stdio.h>
#include<math.h>
#include <time.h>
int main()
{

   FILE *fp;
   int m; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   m = 0;
   // gettimeofday(&tv2, NULL);
   
   printf("\n Give the value of length of array: ");
   scanf("%d",&m);
   fp = fopen("execute.sh", "w+");
   fprintf(fp, "cd data\n");
   fprintf(fp, "mv result.txt result.bk_%d\n",(int)time(NULL));
   
   fprintf(fp, "cd ..\n");

   /*while ( (m*4.0/1024 ) < 4000)
        {
   fprintf(fp, "./kr %d\n", m);
    m +=256;
    }*/
   
   fprintf(fp, "./kr %d\n", m);
   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}