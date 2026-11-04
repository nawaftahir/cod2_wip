/* 0x10099399: thiscall 4-field zero ctor */
void *__fastcall Ctor10099399(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    z = 0;
    *(unsigned int *)(p + 4) = z;
    *(unsigned int *)(p + 8) = z;
    *(unsigned int *)(p + 0xc) = z;
    *(unsigned int *)(p + 0x10) = z;
    *(unsigned int *)(p + 0x14) = z;
    return p;
}
