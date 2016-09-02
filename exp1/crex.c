#include<stdio.h>
#include<math.h>
#include <time.h>
int main(int argc, char * argv[])
{

   FILE *fp, *fpex;
   int m, stride; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   //stride = atoi(argv[1]);
   //m = 160000;
   // gettimeofday(&tv2, NULL);
   fp = fopen("crex.sh", "w+");
   fpex = fopen("exex.sh", "w+");
   //fprintf(fp, "cd data\n");
   //fprintf(fp, "mv result.txt result.bk_%d\n",(int)time(NULL));
   stride = 2;
  // fprintf(fp, "cd ..\n");

   while (stride < 20)
        {
   fprintf(fp, "./ex %d\n", stride);
   fprintf(fpex, "chmod 777 ./execute%d.sh\n", stride);
   fprintf(fpex, "echo Executing for stride = %d\n", stride);
   fprintf(fpex, "./execute%d.sh\n", stride);
    stride++;
    }
    

   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}
