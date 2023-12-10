#include <stdio.h>
int add(int n) {
    int a = 1+2;
    int b = a+n;
    return b;
}

int bitcast(signed char n){
    return (int)n;
}

int icmp(int a, int b){
    int c;
    if (a<b) c=0;
    else c=1;
    return c;
}
int main() {
    int ret;
    // int ret = add(123);
    // ret = bitcast(-3);
    ret = icmp(3,4);
    printf("ret = %d\n", ret);
    return ret;
    // printf("sum of all array elements plus 2 was %d", sum);
}