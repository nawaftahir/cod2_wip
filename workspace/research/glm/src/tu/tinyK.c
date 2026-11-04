/* 0x1000d260: per-client cleanup sweep over the entity table */
typedef void (__cdecl *PFN)(void *);

extern unsigned char *tbl_101cea68[];
extern unsigned int g_101d0a74;
extern unsigned int g_101d0a78;

void FUN_1000d260(void)
{
    unsigned char *s;
    unsigned int off;
    unsigned int h;
    PFN *vt;
    unsigned int z;
    int t;

    off = 0;
    do
    {
        s = *(unsigned char **)((char *)tbl_101cea68 + off);
        if (s != 0)
        {
            if (s[0x1e] >= 5)
            {
                t = s[0xc];
                if (t >= 0x80 || (t > 1 && t != 4))
                {
                    g_101d0a74 -= *(unsigned int *)(s + 0x10);
                    g_101d0a78 -= *(unsigned int *)(s + 0x14);
                }
            }
            h = *(unsigned int *)(s + 4);
            if (h != 0)
            {
                vt = *(PFN **)h;
                vt[2](h);
            }
            *(unsigned int *)(s + 4) = 0;
            z = 0;
            *(unsigned int *)(s + 0x10) = z;
            *(unsigned int *)(s + 0x14) = z;
            *(unsigned int *)s = 0;
        }
        off += 4;
    } while (off != 0x2000);
}
