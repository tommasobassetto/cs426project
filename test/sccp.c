// int icmp(int n){
//     int c;
//     int a=0+1;
//     int b=1+1;
//     // if (a<b) c=n;
//     // else c=1+n;
//     c=a+b;
//     return a+b;
//     // return c;
// }

#include <stdlib.h>
#include <stdio.h>
int foo(int n) {
  int i = 1;
  int j;
  do {
    j = i + 1;
    // i = rand() % 4 - (1 + j) + n;
    i = j+n;
    if (j > 0) i = j;
  } while (j < 2);
  return i;
}

int main() {
    // float ret;
    // float a=3+1;
    // float b=1+1;
    // if(a<b){
    //     ret=1;
    // }
    // else{
    //     ret=2;
    // }
    // ret = ret+9;
    // ret = bitcast(-3);
    // ret = icmp(3);
    // printf("in c, ret = %f\n", ret);
    printf("in c, ret = %d\n", foo(2));
    return 0;
    // printf("sum of all array elements plus 2 was %d", sum);
}

/*
 * The Computer Lannguage Shootout
 * http://shootout.alioth.debian.org/
 * Contributed by Heiner Marxen
 *
 * "fannkuch"	for C gcc
 *
 * $Id: fannkuch-gcc.code,v 1.51 2008-03-06 02:23:27 igouy-guest Exp $
 */

/* -*- mode: c -*-
 *
 * The Great Computer Language Shootout
 * http://shootout.alioth.debian.org/
 *
 * Contributed by Sebastien Loisel
 */

// #include <stdio.h>
// #include <stdlib.h>
// #include <math.h>
// int loop(int k){
//   int i;
//   int a=444;
//   for(i=0;i<k;i++){
//     a=a+66;
//   }
//   return a;
// }

// int main(){
//   printf("in c, ret = %d\n", loop(2));
//   return 0;
// }
// double eval_A(int i, int j) { return 1.0/((i+j)*(i+j+1)/2+i+1); }

// void eval_A_times_u(int N, const double u[], double Au[])
// {
//   int i,j;
//   for(i=0;i<N;i++)
//     {
//       Au[i]=0;
//       for(j=0;j<N;j++) Au[i]+=eval_A(i,j)*u[j];
//     }
// }

// void eval_At_times_u(int N, const double u[], double Au[])
// {
//   int i,j;
//   for(i=0;i<N;i++)
//     {
//       Au[i]=0;
//       for(j=0;j<N;j++) Au[i]+=eval_A(j,i)*u[j];
//     }
// }

// void eval_AtA_times_u(int N, const double u[], double AtAu[])
// { double v[N]; eval_A_times_u(N,u,v); eval_At_times_u(N,v,AtAu); }

// int main(int argc, char *argv[])
// {
//   int i;
//   int N = ((argc == 2) ? atoi(argv[1]) : 2000);
//   double u[N],v[N],vBv,vv;
//   for(i=0;i<N;i++) u[i]=1;
//   for(i=0;i<10;i++)
//     {
//       eval_AtA_times_u(N,u,v);
//       eval_AtA_times_u(N,v,u);
//     }
//   vBv=vv=0;
//   for(i=0;i<N;i++) { vBv+=u[i]*v[i]; vv+=v[i]*v[i]; }
//   printf("%0.9f\n",sqrt(vBv/vv));
//   return 0;
// }