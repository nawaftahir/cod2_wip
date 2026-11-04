
__declspec(naked) void _GetPrimaryLen(void)
{
    __asm {
    xor eax, eax
    mov cl, byte ptr [edx]
    inc edx
    cmp cl, 0x41
    jl L4
    cmp cl, 0x5a
    jle L4
    cmp cl, 0x61
    jl L4
    cmp cl, 0x7a
    jg L4
    inc eax
    jmp L4
    ret
    }
}
