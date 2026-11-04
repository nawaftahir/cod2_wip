/* 0x1008576b: fourteen-magic split-range check (thiscall).
 * Best-known form ~110/116; residual = boundary-reg + branch disp
 * (family wall #124). Kept for the record. */
int __fastcall Fmt1008576b(unsigned char *p)
{
    unsigned int m;

    m = *(unsigned int *)p & 0xfff00000u;
    if (m <= 0x60800000u)
    {
        if (m == 0x10d00000u) goto one;
        if (m == 0x10e00000u) goto one;
        if (m == 0x60000000u) goto one;
        if (m == 0x60200000u) goto one;
        if (m == 0x60300000u) goto one;
        if (m == 0x60500000u) goto one;
        if (m == 0x60700000u) goto one;
    }
    else
    {
        if (m == 0x60a00000u) goto one;
        if (m == 0x60c00000u) goto one;
        if (m == 0x60d00000u) goto one;
        if (m == 0x60f00000u) goto one;
        if (m == 0x61100000u) goto one;
        if (m == 0x61200000u) goto one;
    }
    return 0;
one:
    return 1;
}
