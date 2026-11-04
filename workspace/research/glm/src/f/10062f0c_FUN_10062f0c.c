
__declspec(naked) void FUN_10062f0c(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [eax]
    pop ebp
    ret 4
    }
}
