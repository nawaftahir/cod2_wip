extern void sub_10065b05(void);
extern void sub_10065c5b(void);
extern void sub_10067067(void);
extern void sub_1006770e(void);
extern void sub_1006775f(void);
extern void sub_10084998(void);

__declspec(naked) void FUN_100850af(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x2b0
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x1c]
    test edi, edi
    je L3
    and dword ptr [edi], 0
    lea ecx, [ebp - 0x2b0]
    call sub_10065b05
    push dword ptr [ebp + 0x14]
    lea ecx, [ebp - 0x2b0]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10067067
    mov esi, eax
    test esi, esi
    jl L3
    push dword ptr [ebp + 0x20]
    lea eax, [ebp - 0x2b0]
    push edi
    push dword ptr [ebp + 0x18]
    push eax
    call sub_10084998
    mov esi, eax
    test esi, esi
    jl L3
    lea ecx, [ebp - 0x298]
    call sub_1006775f
    test eax, eax
    je L3
    mov esi, 0x88760b59
    cmp dword ptr [ebp + 0x20], 0
    je L3
    push dword ptr [ebp + 0x20]
    lea ecx, [ebp - 0x298]
    call sub_1006770e
    lea ecx, [ebp - 0x2b0]
    call sub_10065c5b
    pop edi
    mov eax, esi
    pop esi
    leave
    ret 0x1c
    }
}
