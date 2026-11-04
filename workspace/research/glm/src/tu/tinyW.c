/* 0x100823b5: thiscall or/and init */
void *__fastcall Ini100823b5(void *this_)
{
    unsigned char *p = (unsigned char *)this_;

    *(unsigned int *)p |= 0xffffffffu;
    *(unsigned int *)(p + 4) |= 0xffffffffu;
    *(unsigned int *)(p + 8) &= 0;
    *(unsigned int *)(p + 0xc) &= 0;
    return p;
}
