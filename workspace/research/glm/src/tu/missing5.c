/* 0x10005980 / 0x100059e0: lazy vertex-buffer upload (twin bodies).
 * Uses genuine MSVC moving intrinsics; matches PE rep movs pair. */
#pragma intrinsic(__movsd)
#pragma intrinsic(__movsb)
#pragma intrinsic(_lrotl)

extern unsigned char *g_101da9c8;
extern unsigned int (__cdecl *P_101d49dc)(unsigned int);

void FUN_10005980(void *src, unsigned int cnt, unsigned int units)
{
    unsigned char *b;
    unsigned char *dst;
    unsigned int n;
    unsigned int r;

    b = g_101da9c8 + 0x249d18;
    if (src == 0)
    {
        *(unsigned int *)(b + 0x28) = cnt;
        return;
    }
    if (*(unsigned int *)(b + 0x24) == 0)
    {
        *(unsigned int *)(b + 0x24) = P_101d49dc(units << 7);
    }
    dst = *(unsigned char **)(b + 0x24);
    n = cnt << 7;
    r = (n & 3);
    __movsd((unsigned long *)dst, (unsigned long *)src, n >> 2);
    if (r != 0)
    {
        __movsb(dst + (n & ~3), (unsigned char *)src + (n & ~3), r);
    }
    *(unsigned int *)(b + 0x28) = cnt;
}
