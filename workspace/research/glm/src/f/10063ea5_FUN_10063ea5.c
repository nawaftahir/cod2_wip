
__declspec(naked) void FUN_10063ea5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x268]
    jmp L5
    mov eax, ecx
    mov ecx, dword ptr [eax + 0x6c]
    test ecx, ecx
    jne L5
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L5
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [ebp + 0xc]
    test edx, edx
    je L5
    mov ecx, dword ptr [eax + 4]
    mov eax, dword ptr [eax]
    cmp ecx, eax
    jb L5
    sub ecx, eax
    mov dword ptr [edx], ecx
    jmp L5
    and dword ptr [edx], 0
    xor eax, eax
    pop ebp
    ret 8
    }
}
