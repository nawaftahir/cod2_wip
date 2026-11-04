
__declspec(naked) void FUN_1001fda0(void)
{
    __asm {
    mov edx, dword ptr [eax]
    mov dword ptr [ecx + 0x14], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 0x18], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 0x1c], edx
    mov edx, dword ptr [eax]
    mov dword ptr [ecx + 0x20], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 0x24], edx
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ecx + 0x28], eax
    ret
    }
}
