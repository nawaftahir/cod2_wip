
__declspec(naked) void FUN_1007e262(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    ja L2
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, 4
    ja L2
    mov edx, dword ptr [ebp + 8]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [edx + ecx*4]
    mov eax, dword ptr [ecx + eax*4]
    jmp L2
    xor eax, eax
    pop ebp
    ret 0x10
    }
}
