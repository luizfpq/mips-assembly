#include <stdio.h>

int main(int argc, char const *argv[])
{

    int a = 1;
    int b = 2; 
    int c = 30;
    int d = 4;
    while (a < c)
    {
        if (b > 5)
        {
            b = a + 2 + c - d;
        }
        if (b < 10)
        {
            b = b + 2;
        }
        a = a + 1;
        b = b + a;
        printf("%d - %d - %d - %d\n", a, b, c, d);
    }

    printf("%d - %d - %d - %d\n", a, b, c, d);
    return 0;
}
