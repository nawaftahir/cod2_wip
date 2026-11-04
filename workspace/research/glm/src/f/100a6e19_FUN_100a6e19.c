
__declspec(naked) void FUN_100a6e19(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x60500000
    je L2
    cmp eax, 0x60a00000
    je L2
    cmp eax, 0x60000000
    je L2
    cmp eax, 0x72e00000
    je L2
    cmp eax, 0x60700000
    je L2
    cmp eax, 0x60f00000
    je L2
    xor eax, eax
    jmp L2
    xor eax, eax
    inc eax
    pop ebp
    ret 4
    }
}
