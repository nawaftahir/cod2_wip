/* 0x101061d4: first-nonzero-slot scan (1-based result) */
int FUN_101061d4(unsigned int *v)
{
    int i;
    int r;

    i = 0;
    while (i < 3)
    {
        if (v[i] != 0)
        {
            r = i;
            goto done;
        }
        i++;
    }
    r = 0;
done:
    return r + 1;
}
