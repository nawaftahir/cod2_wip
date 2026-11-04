/* 0x10067440: thiscall ctor (zeros + flag at 0x10) */
void *__fastcall Ctor10067440(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    z = 0;
    *(unsigned int *)p = z;
    *(unsigned int *)(p + 4) = z;
    *(unsigned int *)(p + 8) = z;
    *(unsigned int *)(p + 0xc) = z;
    *(unsigned int *)(p + 0x10) = 1;
    *(unsigned int *)(p + 0x14) = z;
    *(unsigned int *)(p + 0x18) = z;
    *(unsigned int *)(p + 0x1c) = z;
    return p;
}
