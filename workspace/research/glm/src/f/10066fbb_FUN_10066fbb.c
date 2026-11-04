extern void sub_10063ab2(void);
extern void sub_10063d3c(void);
extern void sub_10066413(void);
extern void sub_100f7879(void);

__declspec(naked) void FUN_10066fbb(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0x70
    mov esi, ecx
    call sub_100f7879
    test eax, eax
    pop ecx
    je L4
    mov ecx, eax
    call sub_10063ab2
    jmp L4
    xor eax, eax
    test eax, eax
    mov dword ptr [esi + 0x268], eax
    jne L4
    mov eax, 0x8007000e
    jmp L4
    lea ecx, [esi + 0x18]
    push ecx
    push esi
    push dword ptr [ebp + 0x10]
    mov ecx, eax
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10063d3c
    test eax, eax
    jl L4
    push dword ptr [ebp + 0x14]
    mov ecx, esi
    call sub_10066413
    test eax, eax
    jl L4
    mov eax, dword ptr [esi + 0x268]
    mov dword ptr [esi + 0x26c], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [esi + 0x270], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 0x14
    }
}
