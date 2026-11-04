/* 0x10081d06 + 0x10081d8e: thiscall ctor pair (/Gr: this arrives in ECX).
 * One TU so the derived ctor keeps ECX across the base call (IPRA). */
extern unsigned char vtbl_1010fefc[];
extern unsigned char vtbl_1010ff38[];

void *__fastcall Ctor10081d06(void *this_)
{
    unsigned char *p = (unsigned char *)this_;

    *(unsigned int *)(p + 0xc) = 0;
    *(unsigned int *)(p + 8) = 0;
    *(unsigned int *)p = (unsigned int)vtbl_1010fefc;
    *(unsigned int *)(p + 4) = 1;
    return p;
}

void *__fastcall Ctor10081d8e(void *this_)
{
    unsigned char *p = (unsigned char *)this_;

    Ctor10081d06(p);
    *(unsigned int *)(p + 0x10) = 0;
    *(unsigned int *)(p + 0x14) = 0;
    *(unsigned int *)p = (unsigned int)vtbl_1010ff38;
    return p;
}
