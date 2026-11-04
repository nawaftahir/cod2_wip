/* 0x1001fda0: thiscall 2x3-vector unpack (src read twice) */
void __fastcall Unp1001fda0(unsigned char *dst, unsigned char *src)
{
    *(unsigned int *)(dst + 0x14) = *(unsigned int *)(src);
    *(unsigned int *)(dst + 0x18) = *(unsigned int *)(src + 4);
    *(unsigned int *)(dst + 0x1c) = *(unsigned int *)(src + 8);
    *(unsigned int *)(dst + 0x20) = *(unsigned int *)(src);
    *(unsigned int *)(dst + 0x24) = *(unsigned int *)(src + 4);
    *(unsigned int *)(dst + 0x28) = *(unsigned int *)(src + 8);
}
