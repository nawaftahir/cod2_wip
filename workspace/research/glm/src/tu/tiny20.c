/* 0x100f8c6d: double exponent/frac classifier (cdecl) */
int FUN_100f8c6d(double x)
{
    unsigned int t;
    unsigned int m;
    unsigned short ax;

    t = *(unsigned int *)((char *)&x + 6);
    m = 0x7ff8u;
    t &= m;
    ax = (unsigned short)t;
    if (ax != 0x7ff0u) goto chk;
    if (((unsigned int *)&x)[1] & 0x7ffffu) goto one;
    if (*(unsigned int *)&x != 0) goto one;
chk:
    if ((unsigned short)ax != 0x7ff8u) return 0;
one:
    return 1;
}
