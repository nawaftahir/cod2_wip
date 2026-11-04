
__declspec(naked) void FUN_100855e8(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x20700000
    je L1
    cmp eax, 0x73400000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
