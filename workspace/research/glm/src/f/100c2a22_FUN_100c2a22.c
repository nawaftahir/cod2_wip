
__declspec(naked) void FUN_100c2a22(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x73500000
    je L2
    cmp eax, 0x73600000
    je L2
    cmp eax, 0x73700000
    je L2
    cmp eax, 0x73800000
    je L2
    cmp eax, 0x10f00000
    je L2
    xor eax, eax
    jmp L2
    xor eax, eax
    inc eax
    pop ebp
    ret 4
    }
}
