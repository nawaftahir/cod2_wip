
__declspec(naked) void FUN_10064c94(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    test edx, edx
    mov eax, 0x632d80f
    je L3
    mov cl, byte ptr [edx]
    test cl, cl
    je L3
    imul eax, eax, 0x13
    movsx ecx, cl
    add eax, ecx
    inc edx
    mov cl, byte ptr [edx]
    test cl, cl
    jne L3
    push 0x7f
    xor edx, edx
    pop ecx
    div ecx
    mov eax, edx
    jmp L3
    xor eax, eax
    pop ebp
    ret 4
    }
}
