
__declspec(naked) void FUN_1007e0a4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    cmp eax, 4
    jbe L2
    xor eax, eax
    jmp L2
    mov ecx, dword ptr [ebp + 0xc]
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 0xc
    }
}
