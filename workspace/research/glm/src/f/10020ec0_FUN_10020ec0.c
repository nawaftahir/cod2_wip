extern int *g_cmdBuf;

void FUN_10020ec0(void)
{
    unsigned short *p;
    char *b;
    int pos;

    b = (char *)g_cmdBuf;
    pos = *(int *)(b + 0x30000);
    if (0x30000 - pos < 4)
    {
        *(int *)(b + 0x30008) = 0;
        return;
    }
    p = (unsigned short *)(b + pos);
    *(int *)(b + 0x30000) = pos + 4;
    *(int *)(b + 0x30004) = *(int *)(b + 0x30004) + 4;
    *(unsigned short **)(b + 0x30008) = p;
    p[0] = 0;
    p[1] = 4;
}
