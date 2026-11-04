/* 0x100855e8: surface-format magic check (thiscall) */
int __fastcall Fmt100855e8(unsigned char *p)
{
    unsigned int m;

    m = *(unsigned int *)p & 0xfff00000;
    if (m != 0x20700000u)
    {
        if (m != 0x73400000u)
        {
            return 0;
        }
    }
    return 1;
}
