extern int g_101a4684;
extern void sub_100f7ccd(void);
extern void sub_100fb119(void);
extern void sub_10106b50(void);

__declspec(naked) void _wctomb(void)
{
    __asm {
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr g_101a4684
    je L1
    call sub_100f7ccd
    push dword ptr [esp + 8]
    push dword ptr [esp + 8]
    push eax
    call sub_10106b50
    add esp, 0xc
    ret
    }
}
