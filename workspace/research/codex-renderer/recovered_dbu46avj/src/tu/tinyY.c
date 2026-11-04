/* 0x10085469: five-magic format check (thiscall) */
int __fastcall Fmt10085469(unsigned char *p)
{
    unsigned int m;

    m = *(unsigned int *)p & 0xfff00000;
    if (m != 0x20000000u)
    {
        if (m != 0x20100000u)
        {
            if (m != 0x20400000u)
            {
                if (m != 0x20500000u)
                {
                    if (m != 0x50000000u)
                    {
                        return 0;
                    }
                }
            }
        }
    }
    return 1;
}
