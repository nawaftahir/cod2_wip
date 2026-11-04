extern int g_1076ac94;
extern int g_1076ac98;
extern void (__stdcall *fp_1010c174)(void);
extern void (__stdcall *fp_1010c178)(void);
extern void sub_100fdf72(void);
extern void sub_1010119c(void);

__declspec(naked) void __heap_init(void)
{
    __asm {
    xor eax, eax
    cmp dword ptr [esp + 4], eax
    push 0
    sete al
    push 0x1000
    push eax
    call fp_1010c178
    test eax, eax
    mov dword ptr g_1076ac94, eax
    je L2
    call sub_100fdf72
    cmp eax, 3
    mov dword ptr g_1076ac98, eax
    jne L2
    push 0x3f8
    call sub_1010119c
    test eax, eax
    pop ecx
    jne L2
    push dword ptr g_1076ac94
    call fp_1010c174
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
