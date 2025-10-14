#include <stdio.h>

int main() {
    char name[100];
    printf("Enter your name: ");
    scanf("%99s", name);
    printf("Hello, %s! Welcome to your Mac build.\n", name);
    return 0;
}
