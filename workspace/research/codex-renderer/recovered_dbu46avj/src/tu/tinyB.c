/* 0x10080e16: thiscall ctor (/Gr) */
extern unsigned char vtbl_1010fd70[];

void *__fastcall Ctor10080e16(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    *(unsigned int *)p = (unsigned int)vtbl_1010fd70;
    *(unsigned int *)(p + 4) = 1;
    z = 0;
    *(unsigned int *)(p + 8) = z;
    *(unsigned int *)(p + 0xc) = z;
    *(unsigned int *)(p + 0x14) = z;
    *(unsigned int *)(p + 0x18) = z;
    *(unsigned int *)(p + 0x1c) = z;
    return p;
}
