
__declspec(naked) void __isnan(void)
{
    __asm {
    mov eax, dword ptr [esp + 0xa]
    mov ecx, 0x7ff8
    and eax, ecx
    cmp ax, 0x7ff0
    jne L3
    test dword ptr [esp + 8], 0x7ffff
    jne L3
    cmp dword ptr [esp + 4], 0
    jne L3
    cmp ax, cx
    jne L3
    xor eax, eax
    inc eax
    ret
    xor eax, eax
    ret
    }
}
