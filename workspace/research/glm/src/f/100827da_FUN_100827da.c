
__declspec(naked) void FUN_100827da(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [eax + 4]
    sub eax, dword ptr [ecx + 4]
    neg eax
    sbb eax, eax
    inc eax
    pop ebp
    ret 4
    }
}
