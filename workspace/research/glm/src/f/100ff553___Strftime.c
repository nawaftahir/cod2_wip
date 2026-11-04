extern int g_101a4684;
extern void sub_100f7cd0(void);
extern void sub_100fb11c(void);
extern void sub_100ff4bb(void);

__declspec(naked) void __Strftime(void)
{
    __asm {
    push ebp
    mov ebp, esp
    call sub_100fb11c
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr g_101a4684
    je L1
    call sub_100f7cd0
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    push eax
    call sub_100ff4bb
    add esp, 0x18
    pop ebp
    ret
    }
}
