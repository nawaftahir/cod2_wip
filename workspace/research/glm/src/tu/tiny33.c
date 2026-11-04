/* 0x100fb0e4: release saved handle, then chain to shared tail */
extern int g_101a4898;

void J_100fbf5b(void);

void FUN_100fb0e4(void)
{
    int h;

    h = g_101a4898;
    if (h != -1)
    {
        (*(int (__cdecl **)(int))0x101addc4)(h);
        g_101a4898 |= -1;
    }
    J_100fbf5b();
}
