
__declspec(naked) void FUN_10067704(void)
{
    __asm {
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 0x18], ecx
    mov dword ptr [eax + 0x1c], 1
    mov dword ptr [eax + 0x2c], ecx
    mov dword ptr [eax + 0x30], ecx
    ret
    }
}
