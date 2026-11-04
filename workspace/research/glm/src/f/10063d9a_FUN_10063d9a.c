
__declspec(naked) void FUN_10063d9a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 4], 0
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 8], 1
    pop ebp
    ret 4
    }
}
