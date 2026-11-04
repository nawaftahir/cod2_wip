/* 0x10081d06: thiscall ctor (/Gr puts this in ECX) */
void *__fastcall Ctor10081d06(void *this_)
{
    unsigned char *p = (unsigned char *)this_;

    *(unsigned int *)(p + 0xc) = 0;
    *(unsigned int *)(p + 8) = 0;
    *(unsigned int *)p = 0x1010fefc;
    *(unsigned int *)(p + 4) = 1;
    return p;
}
