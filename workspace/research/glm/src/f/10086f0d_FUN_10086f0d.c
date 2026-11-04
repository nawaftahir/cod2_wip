
__declspec(naked) void FUN_10086f0d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, -1
    je L5
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax], 0x20
    jne L5
    mov ecx, dword ptr [eax + 0x38]
    cmp ecx, -1
    je L5
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx], 0x20
    jne L5
    mov eax, dword ptr [eax + 8]
    cmp eax, -1
    jne L5
    xor eax, eax
    jmp L5
    xor eax, eax
    inc eax
    pop ebp
    ret 4
    }
}
