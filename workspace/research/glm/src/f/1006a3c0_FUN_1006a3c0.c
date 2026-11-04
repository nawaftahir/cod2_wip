
__declspec(naked) void FUN_1006a3c0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 0xc], 0
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [ebp + 0x10]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [ebp + 0x14]
    mov dword ptr [eax + 0x20], ecx
    pop ebp
    ret 0x10
    }
}
