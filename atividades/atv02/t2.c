#include <stdio.h>

    int main(int argc, char const *argv[])
{
    int a = 0;
    int b = 10;
    int c = 2;
    while (a < b)
    {
        if (a > 50)
        {
            c = (a * 2) - c;
        }
        b = c + 1;
        a = a + 1;
    }

    printf ("%d - %d - %d\n", a, b, c);

    return 0;
}
