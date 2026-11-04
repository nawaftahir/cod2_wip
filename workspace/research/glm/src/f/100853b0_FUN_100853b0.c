
__declspec(naked) void FUN_100853b0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L2
    mov eax, 0x80004005
    jmp L2
    mov eax, dword ptr [eax + 0x3c]
    mov dword ptr [ecx + 0x3c], eax
    xor eax, eax
    pop ebp
    ret 4
    }
}
