/* 0x100854d2: ten-magic format check, split at 0x70700000 */
int __fastcall Fmt100854d2(unsigned char *p)
{
    unsigned int m;
    unsigned int b;

    m = *(unsigned int *)p & 0xfff00000u;
    b = 0x70700000u;
    if (m > b)
    {
        if (m == 0x70b00000u) goto one;
        if (m == 0x70c00000u) goto one;
        if (m == 0x70d00000u) goto one;
        if (m == 0x71000000u) goto one;
    }
    else
    {
        if (m == 0x50300000u) goto one;
        if (m == 0x70100000u) goto one;
        if (m == 0x70200000u) goto one;
        if (m == 0x70500000u) goto one;
        if (m == 0x70600000u) goto one;
    }
    if (m == b) goto one;
    return 0;
one:
    return 1;
}
