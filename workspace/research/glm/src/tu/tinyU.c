/* 0x101061ad: 3-dword copy via base-difference walk */
void FUN_101061ad(unsigned int *dst, unsigned int *src)
{
    unsigned int *p;
    unsigned int x;
    int n;
    int walk;

    p = src;
    n = 3;
    walk = (int)(dst - src);
    do
    {
        x = *p;
        *(p + walk) = x;
        p++;
    } while (--n != 0);
}
