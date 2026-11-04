
__declspec(naked) void FUN_10067440(void)
{
    __asm {
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 0xc], ecx
    mov dword ptr [eax + 0x10], 1
    mov dword ptr [eax + 0x14], ecx
    mov dword ptr [eax + 0x18], ecx
    mov dword ptr [eax + 0x1c], ecx
    ret
    }
}
