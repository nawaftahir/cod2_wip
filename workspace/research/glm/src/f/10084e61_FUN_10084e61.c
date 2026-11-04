extern void sub_10065b05(void);
extern void sub_10065c5a(void);
extern void sub_10066f75(void);
extern void sub_1006770d(void);
extern void sub_1006775e(void);
extern void sub_10084997(void);

__declspec(naked) void FUN_10084e61(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x2b0
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x18]
    test edi, edi
    je L3
    and dword ptr [edi], 0
    lea ecx, [ebp - 0x2b0]
    call sub_10065b05
    push dword ptr [ebp + 0x10]
    lea ecx, [ebp - 0x2b0]
    push dword ptr [ebp + 0xc]
    push 0
    push dword ptr [ebp + 8]
    call sub_10066f75
    mov esi, eax
    test esi, esi
    jl L3
    push dword ptr [ebp + 0x1c]
    lea eax, [ebp - 0x2b0]
    push edi
    push dword ptr [ebp + 0x14]
    push eax
    call sub_10084997
    mov esi, eax
    test esi, esi
    jl L3
    lea ecx, [ebp - 0x298]
    call sub_1006775e
    test eax, eax
    je L3
    mov esi, 0x88760b59
    cmp dword ptr [ebp + 0x1c], 0
    je L3
    push dword ptr [ebp + 0x1c]
    lea ecx, [ebp - 0x298]
    call sub_1006770d
    lea ecx, [ebp - 0x2b0]
    call sub_10065c5a
    pop edi
    mov eax, esi
    pop esi
    leave
    ret 0x18
    }
}
