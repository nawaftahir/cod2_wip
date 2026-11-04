extern void FUN_1003d950(int);

void FUN_1003ec50(void)
{
    int i;
    for (i = 0; i < 16; i++)
    {
        FUN_1003d950(*(unsigned char *)(0x10766764 + i));
    }
}