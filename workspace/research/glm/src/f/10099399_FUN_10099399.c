
__declspec(naked) void FUN_10099399(void)
{
    __asm {
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 0xc], ecx
    mov dword ptr [eax + 0x10], ecx
    mov dword ptr [eax + 0x14], ecx
    ret
    }
}
