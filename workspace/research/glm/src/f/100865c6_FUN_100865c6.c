
__declspec(naked) void FUN_100865c6(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 0xc], eax
    jbe L2
    or eax, 0xffffffff
    jmp L2
    sbb eax, eax
    neg eax
    pop ebp
    ret 0xc
    }
}
