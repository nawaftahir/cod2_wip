
__declspec(naked) void FUN_1006d594(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    xor edx, edx
    cmp dword ptr [ebp + 0xc], edx
    push esi
    push edi
    jbe L6
    mov ecx, dword ptr [ecx + 8]
    mov esi, dword ptr [ecx + 8]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, esi
    jae L6
    mov edi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edi + eax*4]
    jmp L6
    xor eax, eax
    test eax, eax
    je L6
    cmp dword ptr [eax + 0x68], 0
    je L6
    inc edx
    cmp edx, dword ptr [ebp + 0xc]
    jb L6
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebp
    ret 8
    xor eax, eax
    jmp L6
    }
}
