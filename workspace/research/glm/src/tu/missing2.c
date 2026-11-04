/* 0x10017020: three-field scene comparison against the front-end record */
extern unsigned int g_101d1b2c;

unsigned char FUN_10017020(unsigned int a)
{
    if (*(unsigned int *)(a + 0x3c) != *(unsigned int *)(g_101d1b2c + 0x3c))
    {
        return 0;
    }
    if (*(unsigned int *)(a + 0x40) != *(unsigned int *)(g_101d1b2c + 0x40))
    {
        return 0;
    }
    return (unsigned char)(*(unsigned int *)(a + 0x38) == *(unsigned int *)(g_101d1b2c + 0x38));
}
