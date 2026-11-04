extern char g_fogState[0xA0];    /* 0x101d616c */
extern int g_fogFlag;            /* 0x101d620c */

void R_SwitchFog(void *file)
{
    ((void (*)(void *, int, void *)) *(void **)((char *)file + 0x10))(file, 0xA0, g_fogState);
    ((void (*)(void *, int, void *)) *(void **)((char *)file + 0x10))(file, 4, &g_fogFlag);
}
