
__declspec(naked) void FUN_1007e20e(void)
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
    shr edx, 2
    lea ecx, [ecx + edx*4]
    and eax, 3
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 0xc
    }
}
