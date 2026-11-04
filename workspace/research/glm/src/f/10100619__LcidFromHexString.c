
__declspec(naked) void _LcidFromHexString(void)
{
    __asm {
    xor eax, eax
    jmp L4
    inc edx
    cmp cl, 0x61
    jl L4
    cmp cl, 0x66
    jg L4
    add cl, 0xd9
    jmp L4
    cmp cl, 0x41
    jl L4
    cmp cl, 0x46
    jg L4
    add cl, 0xf9
    add eax, 0xffffffd
    movsx ecx, cl
    shl eax, 4
    add eax, ecx
    mov cl, byte ptr [edx]
    test cl, cl
    jne L4
    ret
    }
}
