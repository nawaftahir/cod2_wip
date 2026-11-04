
__declspec(naked) void FUN_100827f5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L2
    push dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx]
    call dword ptr [eax]
    jmp L2
    xor eax, eax
    cmp dword ptr [ebp + 0xc], eax
    sete al
    pop ebp
    ret 8
    }
}
