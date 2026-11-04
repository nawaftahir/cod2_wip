/* 0x10068c26: thiscall sparse zero ctor */
void *__fastcall Ctor10068c26(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    z = 0;
    *(unsigned int *)p = z;
    *(unsigned int *)(p + 4) = z;
    *(unsigned int *)(p + 8) = z;
    *(unsigned int *)(p + 0x34) = z;
    *(unsigned int *)(p + 0x58) = z;
    *(unsigned int *)(p + 0x5c) = z;
    *(unsigned int *)(p + 0x60) = z;
    *(unsigned int *)(p + 0x78) = z;
    return p;
}
