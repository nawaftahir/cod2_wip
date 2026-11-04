extern int g_101a4684;
extern void sub_100f7254(void);
extern void sub_100f7ccd(void);
extern void sub_100fb119(void);

__declspec(naked) void _toupper(void)
{
    __asm {
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr g_101a4684
    je L1
    call sub_100f7ccd
    push dword ptr [esp + 4]
    push eax
    call sub_100f7254
    pop ecx
    pop ecx
    ret
    }
}
