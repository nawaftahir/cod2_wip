/* 0x100822e9: thiscall 3-field zero ctor */
void *__fastcall Ctor100822e9(void *this_)
{
    unsigned char *p = (unsigned char *)this_;
    unsigned int z;

    z = 0;
    *(unsigned int *)p = z;
    *(unsigned int *)(p + 4) = z;
    *(unsigned int *)(p + 8) = z;
    return p;
}
