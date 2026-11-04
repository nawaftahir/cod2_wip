/* 0x10081a02: thiscall buffer-free + vtable reset (/Gr, /O1). */
extern unsigned char vtbl_1010fefc[];
extern void __cdecl P_free(void *);

void __fastcall Dtor10081a02(void *this_)
{
    void *v;

    v = *(void **)((char *)this_ + 0xc);
    *(unsigned int *)this_ = (unsigned int)vtbl_1010fefc;
    P_free(v);
}
