
__declspec(naked) void FUN_10082816(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    jne L2
    xor eax, eax
    jmp L2
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    pop ebp
    ret 4
    }
}
