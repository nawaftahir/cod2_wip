/* 0x1008549a: six-magic format check (thiscall) */
int __fastcall Fmt1008549a(unsigned char *p)
{
    unsigned int m;

    m = *(unsigned int *)p & 0xfff00000u;
    if (m != 0x10000000u)
    {
        if (m != 0x10100000u)
        {
            if (m != 0x11200000u)
            {
                if (m != 0x20700000u)
                {
                    if (m != 0x20800000u)
                    {
                        if (m != 0x20900000u)
                        {
                            return 0;
                        }
                    }
                }
            }
        }
    }
    return 1;
}
