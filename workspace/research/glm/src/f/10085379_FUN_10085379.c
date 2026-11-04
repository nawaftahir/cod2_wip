
__declspec(naked) void FUN_10085379(void)
{
    __asm {
    mov eax, ecx
    or dword ptr [eax + 0x30], 0xffffffff
    or dword ptr [eax + 0x34], 0xffffffff
    xor ecx, ecx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 0xc], ecx
    mov dword ptr [eax + 0x10], ecx
    mov dword ptr [eax + 0x14], ecx
    mov dword ptr [eax + 0x18], ecx
    mov dword ptr [eax + 0x1c], ecx
    mov dword ptr [eax + 0x20], ecx
    mov dword ptr [eax + 0x24], ecx
    mov dword ptr [eax + 0x28], ecx
    mov dword ptr [eax + 0x2c], ecx
    mov dword ptr [eax + 0x38], ecx
    mov dword ptr [eax + 0x3c], ecx
    ret
    }
}
