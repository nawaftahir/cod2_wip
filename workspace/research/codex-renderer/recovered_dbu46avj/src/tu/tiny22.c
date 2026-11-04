/* 0x100855b0: six-magic format check (thiscall) */
int __fastcall Fmt100855b0(unsigned char *p)
{
    unsigned int m;

    m = *(unsigned int *)p & 0xfff00000u;
    if (m != 0x73100000u)
    {
        if (m != 0x73300000u)
        {
            if (m != 0x73d00000u)
            {
                if (m != 0x73e00000u)
                {
                    if (m != 0x73f00000u)
                    {
                        if (m != 0x74000000u)
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
