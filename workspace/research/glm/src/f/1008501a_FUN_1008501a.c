extern void sub_10065b05(void);
extern void sub_10065c5d(void);
extern void sub_10066ff6(void);
extern void sub_10067710(void);
extern void sub_10067761(void);
extern void sub_1008499a(void);

__declspec(naked) void FUN_1008501a(void)
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
    push 1
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10066ff6
    mov esi, eax
    test esi, esi
    jl L3
    push dword ptr [ebp + 0x20]
    lea eax, [ebp - 0x2b0]
    push edi
    push dword ptr [ebp + 0x18]
    push eax
    call sub_1008499a
    mov esi, eax
    test esi, esi
    jl L3
    lea ecx, [ebp - 0x298]
    call sub_10067761
    test eax, eax
    je L3
    mov esi, 0x88760b59
    cmp dword ptr [ebp + 0x20], 0
    je L3
    push dword ptr [ebp + 0x20]
    lea ecx, [ebp - 0x298]
    call sub_10067710
    lea ecx, [ebp - 0x2b0]
    call sub_10065c5d
    pop edi
    mov eax, esi
    pop esi
    leave
    ret 0x1c
    }
}
