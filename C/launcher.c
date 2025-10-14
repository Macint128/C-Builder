#include <stdio.h>

int main() {
    double num1, num2;
    char op;

    printf("계산식 입력 (예: 3 + 4): ");
    if (scanf("%lf %c %lf", &num1, &op, &num2) != 3) {
        printf("입력 오류!\n");
        return 1;
    }

    switch (op) {
        case '+': printf("%.2lf + %.2lf = %.2lf\n", num1, num2, num1 + num2); break;
        case '-': printf("%.2lf - %.2lf = %.2lf\n", num1, num2, num1 - num2); break;
        case '*': printf("%.2lf * %.2lf = %.2lf\n", num1, num2, num1 * num2); break;
        case '/': 
            if (num2 == 0) printf("0으로 나눌 수 없습니다!\n");
            else printf("%.2lf / %.2lf = %.2lf\n", num1, num2, num1 / num2); 
            break;
        default: printf("알 수 없는 연산자 '%c'\n", op); break;
    }

    return 0;
}
