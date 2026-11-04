extern void sub_10067750(void);

__declspec(naked) void FUN_10063d5f(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    mov edx, dword ptr [ebp + 8]
    je L2
    test edx, edx
    jne L2
    mov eax, 0x8876086c
    jmp L2
    push dword ptr [ebp + 0x14]
    mov dword ptr [ecx + 0x64], edx
    push dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 0x68], eax
    push 1
    push 0
    push eax
    push edx
    call sub_10067750
    test eax, eax
    jl L2
    xor eax, eax
    pop ebp
    ret 0x10
    }
}
