
__declspec(naked) void __ZeroTail(void)
{
    __asm {
    mov eax, dword ptr [esp + 8]
    push 0x20
    pop ecx
    cdq
    idiv ecx
    push 0x1f
    pop ecx
    sub ecx, edx
    or edx, 0xffffffff
    shl edx, cl
    mov ecx, dword ptr [esp + 4]
    not edx
    test dword ptr [ecx + eax*4], edx
    je L3
    xor eax, eax
    ret
    cmp dword ptr [ecx + eax*4], 0
    jne L3
    inc eax
    cmp eax, 3
    jl L3
    xor eax, eax
    inc eax
    ret
    }
}
