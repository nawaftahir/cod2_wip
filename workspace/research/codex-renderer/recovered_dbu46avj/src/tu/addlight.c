/* Cluster TU: R_AddLightToScene / R_AddPolyToScene families.
 * Gate: Sub_1001ffc0 (DObj prep w/ interlocked state machine).
 * IPRA conventions: handles arrive in ESI/EDI/EAX across statics. */
extern unsigned int g_10678510;            /* ref time base */
extern unsigned char g_pool_10678ac4[];    /* scene object pool */
extern unsigned int DAT_101d7e10;
extern unsigned int DAT_101ce7d8;

/* imported function-pointer variables (call [mem] sites) */
extern long (__cdecl *P_1010c0e4)(volatile long *, long, long);
extern int  (*P_101d4be4)(unsigned int, unsigned int);
extern int  (*P_101d4b7c)(unsigned int);
extern int  (*P_101d4bf4)(int, unsigned int, void *);
extern int  (*P_101d4ba8)(unsigned int);
extern int  (*P_101d4bd4)(unsigned int, void *);
extern int  (*P_101d4bd0)(unsigned int);

/* internal helpers (separate functions in binary) */
extern int  Sub_1001d9f0(void *a, void *b, void *c);
extern void Sub_1001da80(int a);
extern void Sub_1001de60(int a);
extern void Sub_1001fda0(void *a);
extern void Sub_1001d660(void *a);
extern void Sub_1001fdd0(void *a, void *b, void *c);
extern void Sub_1005c8c0(void *a, void *b, void *c, void *d);
extern void Sub_1001fa70(unsigned int handle, unsigned int *ent);

static __declspec(noinline) void Sub_1001ffc0(unsigned int handle, unsigned int *ent)
{
    volatile long *lock;
    long prev;
    unsigned int mdl;
    int n;
    int i;
    unsigned char *w;

    lock = (volatile long *)&((int *)handle)[3];      /* handle+0xc */
    if (*lock >= 2)
    {
        return;
    }
    prev = P_1010c0e4(lock, 1, 0);
    if (prev != 0)
    {
        while (*lock < 2)
        {
        }
        return;
    }
    if (prev == 0)
    {
        if (*(int *)handle == 0)
        {
            mdl = ent[1];
        }
        else
        {
            mdl = (unsigned int)P_101d4be4(DAT_101d7e10, ent[1]);
        }
        if (P_101d4b7c(mdl) != 0)
        {
            if (*(int *)((unsigned char *)DAT_101ce7d8 + 8) != 0)
            {
                Sub_1001da80((int)mdl);
                Sub_1001de60((int)mdl);
            }
            *(unsigned int *)((char *)handle + 0x14) =
                *(unsigned int *)((char *)mdl + 0x3c);
            *(unsigned int *)((char *)handle + 0x18) =
                *(unsigned int *)((char *)mdl + 0x40);
            *(unsigned int *)((char *)handle + 0x1c) =
                *(unsigned int *)((char *)mdl + 0x44);
            *(unsigned int *)((char *)handle + 0x20) =
                *(unsigned int *)((char *)mdl + 0x3c);
            *(unsigned int *)((char *)handle + 0x24) =
                *(unsigned int *)((char *)mdl + 0x40);
            *(unsigned int *)((char *)handle + 0x28) =
                *(unsigned int *)((char *)mdl + 0x44);
            *lock = 2;
            return;
        }
        {
            unsigned char frm[0x358];
#define PE(o)   (frm + (o) - 8)
#define pbits   ((unsigned int *)PE(0x34))

            if (Sub_1001d9f0(PE(0x44), PE(0x78), PE(0x38)) == 0)
            {
                if (ent[2] != 0)
                {
                    P_101d4bf4(ent[2], mdl, PE(0x34));
                }
                n = P_101d4ba8(mdl);
                if (n == 0)
                {
                    Sub_1001fda0((char *)handle + 0x3c);
                    *lock = 2;
                    return;
                }
                {
                    int *pc;

                    pc = (int *)PE(0x1c);
                    pc[0] = pc[1] = pc[2] = (int)0x48000000;
                    pc[3] = pc[4] = pc[5] = (int)0xC8000000;
                    P_101d4bd4(mdl, PE(0x170));
                    n = P_101d4bd0(mdl);
                    i = 0;
                    w = (unsigned char *)n;
                    while (i < n)
                    {
                        if ((pbits[i >> 5] & (1u << (i & 0x1f))) != 0)
                        {
                            Sub_1001d660(PE(0x8c));
                            Sub_1001fdd0(PE(0x8c), PE(0x170) + i * 4, PE(0x5c));
                        }
                        i += 1;
                        w += 0x20;
                    }
                    Sub_1005c8c0(PE(0x5c), (char *)handle + 0x14,
                                 (char *)handle + 0x3c, PE(0x1c));
                }
            }
            else
            {
                Sub_1001fda0((char *)handle + 0x3c);
                *lock = 2;
                return;
            }
            *lock = 2;
        }
    }
}

static __declspec(noinline) void Sub_10023d40(int handle)
{
    int idx = (handle - g_10678510) / 52;
    Sub_1001ffc0(handle, (unsigned int *)&g_pool_10678ac4[idx * 0x34]);
}

static __declspec(noinline) void Sub_10023d70(int handle)
{
    int idx = (handle - g_10678510) / 52;
    unsigned int *ent = (unsigned int *)&g_pool_10678ac4[idx * 0x34];
    Sub_1001ffc0(handle, ent);
    Sub_1001fa70(handle, ent);
}

void R_AddLightToScene(int handle)
{
    Sub_10023d40(handle);
}

void R_AddPolyToScene(int handle)
{
    Sub_10023d70(handle);
}
