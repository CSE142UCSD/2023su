#include <stdio.h>
#include <stdlib.h>
#include "perfstats.h"
#ifdef SSE
#include <xmmintrin.h>
#include <x86intrin.h>
#endif
void blockmm(double **a, double **b, double **c);
void vector_blockmm(double **a, double **b, double **c);
int n=1;
  int ARRAY_SIZE=500;
int main(int argc, char **argv)
{
  double **a, **b, **c, *temp;
  int i, j, k;
  /* initialize a, b */
  if(argc == 2)
    n = atoi(argv[1]);
  if(argc >= 3)
  {
    ARRAY_SIZE = atoi(argv[1]);
    n = atoi(argv[2]);
  }
#ifndef SSE
  temp = (double *)valloc(ARRAY_SIZE*ARRAY_SIZE*sizeof(double)*3);
  a = (double **)malloc(ARRAY_SIZE*sizeof(double *));
  for(i = 0; i < ARRAY_SIZE; i++)
  {
    a[i] = temp;
    temp += ARRAY_SIZE;
    for(j = 0; j < ARRAY_SIZE; j++)
      a[i][j] = i+j;
  }
  b = (double **)malloc(ARRAY_SIZE*sizeof(double *));
  for(i = 0; i < ARRAY_SIZE; i++)
  {
    b[i] = temp;
    temp += ARRAY_SIZE;
    for(j = 0; j < ARRAY_SIZE; j++)
      b[i][j] = i+j;
  }
  c = (double **)malloc(ARRAY_SIZE*sizeof(double *));
  for(i = 0; i < ARRAY_SIZE; i++)
  {
    c[i] = temp;
    temp += ARRAY_SIZE;
    for(j = 0; j < ARRAY_SIZE; j++)
      c[i][j] = 0;
  }
#else
  a = (double **)malloc(ARRAY_SIZE*sizeof(double *));
  for(i = 0; i < ARRAY_SIZE; i++)
  {
    a[i] = (double *)_mm_malloc(ARRAY_SIZE*sizeof(double),256);
    for(j = 0; j < ARRAY_SIZE; j++)
      a[i][j] = i+j;
  }
  b = (double **)malloc(ARRAY_SIZE*sizeof(double *));
  for(i = 0; i < ARRAY_SIZE; i++)
  {
    b[i] = (double *)_mm_malloc(ARRAY_SIZE*sizeof(double),256);
    for(j = 0; j < ARRAY_SIZE; j++)
      b[i][j] = i+j;
  }
  c = (double **)malloc(ARRAY_SIZE*sizeof(double *));
  for(i = 0; i < ARRAY_SIZE; i++)
  {
    c[i] = (double *)_mm_malloc(ARRAY_SIZE*sizeof(double),256);
    for(j = 0; j < ARRAY_SIZE; j++)
      c[i][j] = 0;
  }
#endif
  perfstats_init();
  perfstats_enable();
#ifndef SSE
  blockmm(a, b, c);
#else
  vector_blockmm(a, b, c);
#endif
  perfstats_disable();
  perfstats_print();
  perfstats_deinit();
  
  return 0;
}

//START
void blockmm(double **a, double **b, double **c)
{
  int i,j,k, ii, jj, kk;
  for(i = 0; i < ARRAY_SIZE; i+=(ARRAY_SIZE/n))
  {
    for(j = 0; j < ARRAY_SIZE; j+=(ARRAY_SIZE/n))
    {
      for(k = 0; k < ARRAY_SIZE; k+=(ARRAY_SIZE/n))
      {        
          for(ii = i; ii < i+(ARRAY_SIZE/n); ii++)
            for(jj = j; jj < j+(ARRAY_SIZE/n); jj++)
              for(kk = k; kk < k+(ARRAY_SIZE/n); kk++)
                c[ii][jj] += a[ii][kk]*b[kk][jj];
      }
    }
  }  
}


//END

//START_SSE
#ifdef SSE
#define VECTOR_WIDTH 4
void vector_blockmm(double **a, double **b, double **c)
{
  int i,j,k, ii, jj, kk, x;
  __m256d va, vb, vc;
  for(i = 0; i < ARRAY_SIZE; i+=(ARRAY_SIZE/n))
  {
    for(j = 0; j < ARRAY_SIZE; j+=(ARRAY_SIZE/n))
    {
      for(k = 0; k < ARRAY_SIZE; k+=(ARRAY_SIZE/n))
      {        
         for(ii = i; ii < i+(ARRAY_SIZE/n); ii++)
         {
            for(jj = j; jj < j+(ARRAY_SIZE/n); jj+=VECTOR_WIDTH)
            {
                    vc = _mm256_load_pd(&c[ii][jj]);
                    
                for(kk = k; kk < k+(ARRAY_SIZE/n); kk++)
                {
                        va = _mm256_broadcast_sd(&a[ii][kk]);
                        vb = _mm256_load_pd(&b[kk][jj]);
                        vc = _mm256_add_pd(vc,_mm256_mul_pd(va,vb));
                 }
                     _mm256_store_pd(&c[ii][jj],vc);
            }
          }
      }
    }
  }  
}
#endif
//END_SSE
