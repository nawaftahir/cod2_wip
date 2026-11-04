extern void (*RI_unk125)(void *a, int b, int c, void *d, int e);

extern int g_static12f40[2];
extern int *g_ptr12f40;

void FUN_10012f40(void)
{
    int local[3];

    local[0] = 0;
    local[1] = 0;
    local[2] = 0;
    RI_unk125(local, 1, 0, g_static12f40, 0);
    g_ptr12f40 = g_static12f40;
}
