/* 0x10067704: thiscall ctor (zeros + one flag) */
void *__fastcall Ctor10067704(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    z = 0;
    *(unsigned int *)p = z;
    *(unsigned int *)(p + 4) = z;
    *(unsigned int *)(p + 0x18) = z;
    *(unsigned int *)(p + 0x1c) = 1;
    *(unsigned int *)(p + 0x2c) = z;
    *(unsigned int *)(p + 0x30) = z;
    return p;
}
