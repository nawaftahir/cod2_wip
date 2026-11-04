
__declspec(naked) void FUN_100855b0(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x73100000
    je L1
    cmp eax, 0x73300000
    je L1
    cmp eax, 0x73d00000
    je L1
    cmp eax, 0x73e00000
    je L1
    cmp eax, 0x73f00000
    je L1
    cmp eax, 0x74000000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
