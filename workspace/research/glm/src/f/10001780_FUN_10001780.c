#define g_101d1b9c ((int *)0x101D1B9C)
#define g_1076a830 (*(int *)0x1076A830)

void FUN_10001780(void)
{
    int *ptr = *(int **)((char *)g_101d1b9c + 0x30);
    if (ptr != 0)
    {
        (*(void (__cdecl **)(int *))(*ptr + 8))(ptr);
        *(int *)((char *)g_101d1b9c + 0x30) = 0;
    }
}