#include <stdio.h>
// int add(int n) {
//     int a = 1+2;
//     int b = a+n;
//     return b;
// }

// int bitcast(signed char n){
//     return (int)n;
// }

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

int main() {
    float ret;
    float a=3+1;
    float b=1+1;
    // if(a<b){
    //     ret=1;
    // }
    // else{
    //     ret=2;
    // }
    float c=1;
    ret = a<b?a:c;






    // ret = add(123);

    // ret = bitcast(-3);
    // ret = icmp(3);
    printf("in c, ret = %f\n", ret);
    return 3;
    // printf("sum of all array elements plus 2 was %d", sum);
}