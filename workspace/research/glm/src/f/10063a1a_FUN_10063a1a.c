
__declspec(naked) void FUN_10063a1a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 0xc], 0
    and dword ptr [eax + 0x10], 0
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [ebp + 0x10]
    mov dword ptr [eax + 8], ecx
    pop ebp
    ret 0xc
    }
}
