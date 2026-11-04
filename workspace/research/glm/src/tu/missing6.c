/* 0x10012f40: register a static descriptor with the engine service */
extern unsigned int (__cdecl *P_101d4bbc)(void *, unsigned int,
                                          unsigned int, unsigned int,
                                          unsigned int);
extern unsigned int g_101d7e10;
extern unsigned char arr_101d7e14[];

void FUN_10012f40(void)
{
    unsigned int b[3];

    b[0] = 0;
    b[1] = 0;
    b[2] = 0;
    P_101d4bbc(b, 1, 0, (unsigned int)arr_101d7e14, 0);
    g_101d7e10 = (unsigned int)arr_101d7e14;
}
