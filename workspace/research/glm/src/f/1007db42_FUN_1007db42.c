
__declspec(naked) void FUN_1007db42(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    pop ebp
    ret 4
    }
}
