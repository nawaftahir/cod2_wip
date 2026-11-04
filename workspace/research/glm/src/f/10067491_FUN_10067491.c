
__declspec(naked) void FUN_10067491(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 4
    jbe L2
    mov eax, 0x80004005
    jmp L2
    mov dword ptr [ecx + 0x10], eax
    xor eax, eax
    pop ebp
    ret 4
    }
}
