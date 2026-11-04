/* 0x1000a7f0: strided clear guarded by client-state global */
#define g_101d1b9c (*(unsigned int *)0x101D1B9C)
#define g_101ce580 (*(unsigned int *)0x101CE580)

void FUN_1000a7f0(void)
{
    unsigned char *base;
    unsigned int n;
    unsigned int off;
    unsigned int tbl;
    unsigned int i;

    base = (unsigned char *)g_101d1b9c;
    g_101ce580 = 0;
    if (base == 0) return;
    n = *(unsigned int *)((char *)base + 0xfc);
    if ((int)n <= 0) return;
    tbl = *(unsigned int *)((char *)base + 0x100);
    off = 0;
    for (i = 0; (int)i < (int)*(unsigned int *)((char *)base + 0xfc); i++)
    {
        *(unsigned int *)(tbl + off + 0x38) = 0;
        off += 0x3c;
    }
}
