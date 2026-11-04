/* 0x1008540c: mixed two-mask format check (thiscall) */
int __fastcall Fmt1008540c(unsigned char *p)
{
    unsigned int v;
    unsigned int m;

    v = *(unsigned int *)p;
    if ((v & 0xf0000000u) != 0x60000000u)
    {
        m = v & 0xfff00000u;
        if (m != 0x50100000u)
        {
            if (m != 0x50200000u)
            {
                if (m != 0x50300000u)
                {
                    return 0;
                }
            }
        }
    }
    return 1;
}
