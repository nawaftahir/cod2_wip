
__declspec(naked) void __IsZeroMan(void)
{
    __asm {
    xor eax, eax
    mov ecx, dword ptr [esp + 4]
    cmp dword ptr [ecx + eax*4], 0
    jne L2
    inc eax
    cmp eax, 3
    jl L2
    xor eax, eax
    inc eax
    ret
    xor eax, eax
    ret
    }
}
