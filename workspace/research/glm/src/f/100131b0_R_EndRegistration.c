void R_EndRegistration(void)
{
    int *base;
    __asm {
        mov base, 0x1042E778
    }
    char *b = (char *)base;
    int pos = *(int *)(b + 0x30000);
    int total = *(int *)(b + 0x30004);
    int space = 0x30000 - pos;
    space += total;
    if (space < 4)
    {
        *(int *)(b + 0x30008) = 0;
        return;
    }
    *(int *)(b + 0x30000) = pos + 4;
    *(unsigned short **)(b + 0x30008) = (unsigned short *)(b + pos);
    *(unsigned short *)(b + pos) = 0x21;
    *(unsigned short *)(b + pos + 2) = 4;
}