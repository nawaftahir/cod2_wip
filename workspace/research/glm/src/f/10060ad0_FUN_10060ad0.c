
__declspec(naked) void FUN_10060ad0(void)
{
    __asm {
    cmp byte ptr [eax], 0
    mov edx, eax
    je L3
    push esi
    mov cl, byte ptr [edx]
    movsx esi, cl
    cmp esi, 0x41
    jl L3
    cmp esi, 0x5a
    jg L3
    add cl, 0x20
    mov byte ptr [edx], cl
    mov cl, byte ptr [edx + 1]
    inc edx
    test cl, cl
    jne L3
    pop esi
    ret
    }
}
