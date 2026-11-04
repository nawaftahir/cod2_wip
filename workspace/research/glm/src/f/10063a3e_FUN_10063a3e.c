
__declspec(naked) void FUN_10063a3e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 8], 0
    and dword ptr [eax + 0xc], 0
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 4], ecx
    pop ebp
    ret 8
    }
}
