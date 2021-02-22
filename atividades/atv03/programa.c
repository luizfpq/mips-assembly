#include <stdio.h>

int funcao(int x, int y);

int main(void)
{
    int x, y;

    x = 5;
    y = 0;

    printf("y=%d\n", funcao(x, y));
    printf("x=%d\n", x);

    return 0;
}

int funcao(int x, int y) {

    y = 3 * x;
    y = y + 5;

    return y;
}