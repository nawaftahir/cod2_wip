
__declspec(naked) void FUN_10099ab4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L3
    xor eax, eax
    jmp L3
    cmp dword ptr [eax + 4], 9
    jne L3
    xor ecx, ecx
    cmp dword ptr [eax + 0x10], ecx
    sete cl
    mov eax, ecx
    pop ebp
    ret 4
    }
}
