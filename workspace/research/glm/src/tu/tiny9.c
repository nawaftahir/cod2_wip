/* 0x1006518e: promote view record pointer to active, clear pending,
   tail into the shared activate path (/Gr: ECX = this). */
extern unsigned int g_101ac95c;
extern void __fastcall Tail_100639c9(void *this_);

void __fastcall FUN_1006518e(void *this_)
{
    unsigned char *p = (unsigned char *)this_;

    g_101ac95c = *(unsigned int *)(p + 0x2a8);
    *(unsigned int *)(p + 0x2a4) = 0;
    Tail_100639c9(this_);
}
