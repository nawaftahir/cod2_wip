/* 0x1008543f: four-magic format check (thiscall) */
int __fastcall Fmt1008543f(unsigned char *p)
{
    unsigned int m;

    m = *(unsigned int *)p & 0xfff00000;
    if (m != 0x10300000u)
    {
        if (m != 0x10500000u)
        {
            if (m != 0x10600000u)
            {
                if (m != 0x10700000u)
                {
                    return 0;
                }
            }
        }
    }
    return 1;
}
