/* 0x1001d900: boolean read of a renderer global flag */
extern unsigned char g_101d4d02;

int FUN_1001d900(void)
{
    return g_101d4d02 != 0;
}
