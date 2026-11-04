
__declspec(naked) void FUN_1008af0b(void)
{
    __asm {
    xor eax, eax
    cmp dword ptr [ecx + 8], eax
    jbe L2
    mov edx, dword ptr [ecx + 0x14]
    mov edx, dword ptr [edx + eax*4]
    mov dword ptr [edx + 0x30], eax
    inc eax
    cmp eax, dword ptr [ecx + 8]
    jb L2
    xor eax, eax
    ret
    }
}
