
__declspec(naked) void FUN_100c2a58(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x74700000
    je L2
    cmp eax, 0x74600000
    je L2
    cmp eax, 0x74400000
    je L2
    cmp eax, 0x74500000
    je L2
    cmp eax, 0x74300000
    je L2
    xor eax, eax
    jmp L2
    xor eax, eax
    inc eax
    pop ebp
    ret 4
    }
}
