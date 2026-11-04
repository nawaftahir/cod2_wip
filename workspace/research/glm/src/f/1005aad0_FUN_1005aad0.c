
__declspec(naked) void FUN_1005aad0(void)
{
    __asm {
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 0x10]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 0x20]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 0x30]
    mov dword ptr [eax + 0xc], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [ecx + 0x14]
    mov dword ptr [eax + 0x14], edx
    mov edx, dword ptr [ecx + 0x24]
    mov dword ptr [eax + 0x18], edx
    mov edx, dword ptr [ecx + 0x34]
    mov dword ptr [eax + 0x1c], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 0x20], edx
    mov edx, dword ptr [ecx + 0x18]
    mov dword ptr [eax + 0x24], edx
    mov edx, dword ptr [ecx + 0x28]
    mov dword ptr [eax + 0x28], edx
    mov edx, dword ptr [ecx + 0x38]
    mov dword ptr [eax + 0x2c], edx
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax + 0x30], edx
    mov edx, dword ptr [ecx + 0x1c]
    mov dword ptr [eax + 0x34], edx
    mov edx, dword ptr [ecx + 0x2c]
    mov dword ptr [eax + 0x38], edx
    mov ecx, dword ptr [ecx + 0x3c]
    mov dword ptr [eax + 0x3c], ecx
    ret
    }
}
