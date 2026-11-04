/* 0x10081d8e: derived ctor; calls base then extends */
extern void *__fastcall Ctor10081d06(void *this_);

void *__fastcall Ctor10081d8e(void *this_)
{
    unsigned char *p = (unsigned char *)this_;

    Ctor10081d06(p);
    *(unsigned int *)(p + 0x10) = 0;
    *(unsigned int *)(p + 0x14) = 0;
    *(unsigned int *)p = 0x1010ff38;
    return p;
}
