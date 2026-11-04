
__declspec(naked) void FUN_10068c26(void)
{
    __asm {
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 0x34], ecx
    mov dword ptr [eax + 0x58], ecx
    mov dword ptr [eax + 0x5c], ecx
    mov dword ptr [eax + 0x60], ecx
    mov dword ptr [eax + 0x78], ecx
    ret
    }
}
