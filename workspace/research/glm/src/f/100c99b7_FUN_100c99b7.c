extern void sub_100c7b47(void);

__declspec(naked) void FUN_100c99b7(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push dword ptr [ebp + 8]
    call sub_100c7b47
    test eax, eax
    jl L1
    xor eax, eax
    pop ebp
    ret 4
    }
}
