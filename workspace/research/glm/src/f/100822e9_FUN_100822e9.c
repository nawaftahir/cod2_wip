
__declspec(naked) void FUN_100822e9(void)
{
    __asm {
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    ret
    }
}
