
__declspec(naked) void FUN_1008430d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 4], ecx
    pop ebp
    ret 8
    }
}
