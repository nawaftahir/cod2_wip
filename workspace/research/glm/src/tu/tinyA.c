/* 0x100822ce: thiscall field-init ctor (/Gr) */
extern unsigned char vtbl_1010ff58[];

void *__fastcall Ctor100822ce(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    *(unsigned int *)p = (unsigned int)vtbl_1010ff58;
    *(unsigned int *)(p + 4) = 1;
    z = 0;
    *(unsigned int *)(p + 8) = z;
    *(unsigned int *)(p + 0xc) = z;
    *(unsigned int *)(p + 0x10) = z;
    return p;
}
