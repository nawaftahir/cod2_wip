/* 0x10085dc1: thiscall wide-field ctor (/Gr). PE store order is
 * scheduler-permuted; source lists ascending and lets cl pick. */
extern unsigned char vtbl_101103f8[];

void *__fastcall Ctor10085dc1(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    *(unsigned int *)p = (unsigned int)vtbl_101103f8;
    z = 0;
    *(unsigned int *)(p + 4) = z;
    *(unsigned int *)(p + 0x1c) = z;
    *(unsigned int *)(p + 0x10) = z;
    *(unsigned int *)(p + 8) = z;
    *(unsigned int *)(p + 0x20) = z;
    *(unsigned int *)(p + 0x14) = z;
    *(unsigned int *)(p + 0xc) = z;
    *(unsigned int *)(p + 0x24) = z;
    *(unsigned int *)(p + 0x18) = z;
    return p;
}
