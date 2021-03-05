#include <stdio.h>

int main(int argc, char const *argv[])
{
    int a,b,c;
    a = 1;
    b = 20;
    c = 0;
    while (a < b)
    {
        if (a > 10)
        {
            c = a + 1;
        }
        else
        {
            c = b + 1;
        }
        a = a + 1;
    }
    printf("%d %d %d",a, b, c);
    return 0;
}
