#include <stdio.h>

int main(int argc, char const *argv[])
{
    int a = 100;
    int b = 1;
    int c = 31;
    int d = 2;

    while (a > b)
    {
        if (a > 32)
        {
            c = (b + 2) + c - d;
            if (c > 12) 
            {
                d = (d + 2) + c - d;
            }
            
        }
        c = c - a;
        a = a - 1;
    }
    
    printf("%d %d %d %d\n", a, b, c, d);


    return 0;
}