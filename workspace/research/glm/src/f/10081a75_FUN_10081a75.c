
__declspec(naked) void FUN_10081a75(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 0xc]
    pop ebp
    ret 4
    }
}
