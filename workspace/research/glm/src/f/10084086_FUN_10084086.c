
__declspec(naked) void FUN_10084086(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 4], 0
    mov dword ptr [eax], ecx
    lea ecx, [eax + 8]
    and dword ptr [ecx], 0
    mov dword ptr [eax + 0xc], ecx
    pop ebp
    ret 4
    }
}
