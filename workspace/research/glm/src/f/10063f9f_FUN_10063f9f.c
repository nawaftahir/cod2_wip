
__declspec(naked) void FUN_10063f9f(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x26c]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [eax + 0x1c], edx
    cmp dword ptr [ecx + 0x278], 0xc
    je L2
    mov eax, dword ptr [ecx + 0x26c]
    dec dword ptr [eax + 0x1c]
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L2
    mov ecx, dword ptr [ecx + 0x26c]
    mov dword ptr [ecx + 0x18], eax
    xor eax, eax
    pop ebp
    ret 8
    }
}
