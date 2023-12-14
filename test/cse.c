#include <stdio.h>
// #include <stdio.h>
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
//     return b+a;
//     // return c;
// }

// int cfg(int n){
//     int ret;
//     if (n<3){
//         if (n<3)
//         ret = 1;
//     }
//     else{
//         if (n<3)
//         ret = 2;
//     }
//     return ret;
// }

int volatilefunc(int *p){
    // volatile int *a;
    // *a = 5<3;
    // volatile int *b;
    // *b = 5<3;
    volatile int a=4+2;
    volatile int b=4+2;
    // *p=a;
    // *p=b;
    return 43;
}

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
    return 0;
    // printf("sum of all array elements plus 2 was %d", sum);
}