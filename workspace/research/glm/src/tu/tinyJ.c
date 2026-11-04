/* 0x10032cd0: device cooperative-level retry until usable or lost */
typedef int (__cdecl *PFN)(void *, unsigned int, unsigned int, unsigned int);

extern unsigned char g_101d4958;
extern unsigned int g_101d494c;

void FUN_10032cd0(void)
{
    void *dev;
    PFN *vt;
    int r;

    if (!g_101d4958) return;
    for (;;)
    {
        dev = *(void **)g_101d494c;
        vt = *(PFN **)dev;
        r = vt[7](dev, 0, 0, 1);
        if ((unsigned int)r == 0x88760868u) { g_101d4958 = 0; return; }
        if (r == 1) continue;
        break;
    }
    g_101d4958 = 0;
}
