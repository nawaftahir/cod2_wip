/* 0x100227c0: guarded config fetch */
#define g_101d4c78 (*(unsigned int *)0x101D4C78)
#define g_101d4c6c (*(unsigned int *)0x101D4C6C)
#define g_101d4c70 (*(unsigned int *)0x101D4C70)

void FUN_100227c0(unsigned int *a, unsigned int *b)
{
    if (g_101d4c78 == 0) return;
    *a = g_101d4c6c;
    *b = g_101d4c70;
}
