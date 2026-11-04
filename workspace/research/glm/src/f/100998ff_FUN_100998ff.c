
__declspec(naked) void FUN_100998ff(void)
{
    __asm {
    mov eax, dword ptr [ecx + 0x14]
    test eax, eax
    je L1
    mov edx, dword ptr [eax + 0xc]
    mov dword ptr [ecx + 0x14], edx
    and dword ptr [eax + 0xc], 0
    xor eax, eax
    ret
    }
}
