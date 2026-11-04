unsigned char FUN_1007d82f(int *a, int *b)
{
    int n;
    int x;
    int y;

    n = 4;
    do {
        if (n == 0)
        {
            return 1;
        }
        n -= 1;
        y = *b;
        x = *a;
        a += 1;
        b += 1;
    } while (x == y);
    return 0;
}
