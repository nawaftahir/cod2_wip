/* Cluster B TU: scene-model validity checker family.
 * Conventions: c910 reads handle in ESI; fa40 reads model in EBX;
 * 60c10 takes dst=EDI size=ESI with format on stack. */
extern int g_101d0a74;
extern int g_101d0a78;

extern int (__cdecl *P_101d4afc)(void *, void *);
extern int (__cdecl *P_101d4b00)(unsigned int);
extern void Sub_1000f900(int a, int b);
extern void Sub_100138c0(int a, const char *b, int c);
extern void Sub_1000fa40_glue(void);

static __declspec(noinline) int F60c10(char *dst, int size, const char *fmt, ...)
{
    int n;
    char *va;
    {
        extern int __cdecl _vsnprintf(char *, unsigned int, const char *, char *);
        va = (char *)&fmt + 4;                 /* x86 cdecl varargs */
        n = _vsnprintf(dst, (unsigned int)size, fmt, va);
    }
    dst[size - 1] = 0;
    return n;
}

static __declspec(noinline) void C910(int s)
{
    int t;
    int sc;
    void *v;
    int *p;

    t = *(unsigned char *)(s + 0xc);
    sc = (signed char)t;
    if (sc >= 0)
    {
        if (t > 1 && t != 4)
        {
            g_101d0a74 -= *(int *)(s + 0x10);
            g_101d0a78 -= *(int *)(s + 0x14);
        }
    }
    v = *(void **)(s + 4);
    if (v != 0)
    {
        ((void (*)(void *))**(void ***)v)(v);   /* call [[v]] vtable slot 8 */
        p = (int *)(s + 0x10);
        *(int *)(s + 4) = 0;
        p[0] = 0;
        p[1] = 0;
    }
    *(int *)s = 0;
}

extern void Sub_1000f900(int a, int b);

extern void Sub_10061c80(const char *a, char *b);
extern int Sub_1000f900_edxeax(void);

extern void Sub_10061c80(const char *a, char *b);

/* IWi header validator; arg arrives in EAX at binary (IPRA). */
static __declspec(noinline) unsigned char Sub_1000f2a0(unsigned char *hdr, char *aux)
{
    if (hdr[0] != 0x49 || hdr[1] != 0x57 || hdr[2] != 0x69)
    {
        Sub_10061c80((const char *)0x101939b0, aux);
        return 0;
    }
    if ((unsigned char)hdr[3] == 5)
    {
        return 1;
    }
    else
    {
        extern void Sub_10061c80_4(const char *, ...);
        Sub_10061c80_4((const char *)0x10193974, aux, hdr[3], 5);
        return 0;
    }
}


/* DDS-format dispatch (0x1000f900): args arrive ECX/EDX/EAX at binary */
extern void Sub_1000f5a0(int a, int b, int c, int d);
extern void Sub_1000f380(int a, int b, int c);
extern void Sub_1000f7b0(int a, int b, int c, int d);

static __declspec(noinline) void Sub_1000f900(int a, int c, int b)
{
    unsigned int t;

    *(int *)(c + 4) = 0;
    t = *(unsigned char *)(a + 4);
    switch (t - 1)
    {
    case 0: Sub_1000f5a0(a, b, 0x15, 4); break;
    case 1: Sub_1000f5a0(a, b, 0x16, 3); break;
    case 2: Sub_1000f5a0(a, b, 0x33, 2); break;
    case 3: Sub_1000f5a0(a, b, 0x32, 1); break;
    case 4: Sub_1000f5a0(a, b, 0x1c, 1); break;
    case 5: Sub_1000f380(c, b, 0x15); break;
    case 6: Sub_1000f380(c, b, 0x16); break;
    case 7: Sub_1000f380(c, b, 0x33); break;
    case 8: Sub_1000f380(c, b, 0x32); break;
    case 9: Sub_1000f380(c, b, 0x1c); break;
    case 10: Sub_1000f7b0(a, b, 0x31545844, 8); break;
    case 11: Sub_1000f7b0(a, b, 0x33545844, 0x10); break;
    case 12: Sub_1000f7b0(a, b, 0x35545844, 0x10); break;
    default: break;
    }
}

static __declspec(noinline) int FA40(int mdl)
{
    char w[0x44];
    int n;
    char *h;

    n = F60c10(w + 4, 0x40,
               (const char *)0x1019395c,
               (const char *)0x10193964,
               *(int *)((char *)mdl + 0x20),
               (const char *)0x1019396c);
    if (n < 0)
    {
        Sub_10061c80((const char *)0x10193938, w + 4);
        return 0;
    }
    n = P_101d4afc(w + 4, w);
    if (n < 0)
    {
        Sub_10061c80((const char *)0x10193918, w + 4);
        return 0;
    }
    if (n == 0)
    {
        Sub_10061c80((const char *)0x101938f4, w + 4);
        P_101d4b00((unsigned int)*(int *)&w[0]);
        return 0;
    }
    h = *(char **)&w[0];
    if ((*(unsigned char *)(h + 5) & 3) != 0)
    {
        ((unsigned char *)mdl)[0xb] = 1;
    }
    if (!Sub_1000f2a0(h, w + 4))
    {
        P_101d4b00((unsigned int)*(int *)&w[0]);
        return 0;
    }
    Sub_1000f900(h, (int)h + 0x1c, mdl);
    P_101d4b00((unsigned int)*(int *)&w[0]);
    return 1;
}

/* Public root 0x1000d450 (table-called, EAX-in at binary; kept as normal
 * cdecl here purely to keep the static family live for diffing). */
extern void Sub_100138c0_pub(int a, const char *b, int c);
void D450(int h)
{
    C910(h);
    if (!FA40(h))
    {
        Sub_100138c0_pub(1, (const char *)0x10193544, *(int *)((char *)h + 0x20));
    }
}
