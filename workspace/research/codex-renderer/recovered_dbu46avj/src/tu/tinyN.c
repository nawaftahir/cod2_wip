/* 0x10084214: size helper (n+3)/4 + 2 */
int __fastcall Sz10084214(unsigned char *p)
{
    return (*(unsigned int *)(p + 4) + 3) / 4 + 2;
}
