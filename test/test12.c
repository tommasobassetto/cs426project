#include <stdio.h>
#include <stdlib.h>

// this function contributed by ChatGPT
// prompt: write a c function to generate an array of random values of length n. 
// all values should be below 10, set with a consistent seed, and integers.
void generateRandomArray(int n, int arr[]) {
    // Set a consistent seed based on current time
    srand((unsigned int)0);

    // Generate random values and fill the array
    for (int i = 0; i < n; ++i) {
        arr[i] = rand() % 10; // Generate a random value between 0 and 9
    }
}

int main() {
    int *arr = malloc(20 * sizeof(int));
    generateRandomArray(20, arr);

    int sum = 0;

    for (int i = 0; i < 20; i++) {
        int extra_amount = 2;
        sum += i + extra_amount;
    }

    printf("sum of all array elements plus 2 was %d", sum);
}