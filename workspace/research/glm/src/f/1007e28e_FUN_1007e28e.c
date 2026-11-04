
__declspec(naked) void FUN_1007e28e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    jbe L2
    xor eax, eax
    jmp L2
    mov eax, dword ptr [ebp + 0xc]
    mov edx, eax
    and edx, 3
    lea ecx, [edx + ecx*4]
    mov edx, dword ptr [ebp + 8]
    shr eax, 2
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + ecx*4]
    pop ebp
    ret 0xc
    }
}
