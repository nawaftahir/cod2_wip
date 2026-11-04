extern int *g_cmdBuf;

void R_EndDelayedDrawing(int marker)
{
    unsigned short *p;
    char *b;
    int pos;

    b = (char *)g_cmdBuf;
    pos = *(int *)(b + 0x30000);
    if (0x30000 - pos < 8)
    {
        *(int *)(b + 0x30008) = 0;
        p = 0;
    }
    else
    {
        p = (unsigned short *)(b + pos);
        *(int *)(b + 0x30000) = pos + 8;
        *(int *)(b + 0x30004) = *(int *)(b + 0x30004) + 8;
        *(int *)(b + 0x30008) = (int)p;
        p[0] = 2;
        p[1] = 8;
    }
    *(int *)(p + 2) = (int)(b + 8 + marker);
}
