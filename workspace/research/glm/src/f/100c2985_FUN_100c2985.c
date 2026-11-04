
__declspec(naked) void FUN_100c2985(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    cmp dword ptr [ebp + 0xc], eax
    jne L14
    xor eax, eax
    jmp L14
    mov eax, dword ptr [ecx + 0x10]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ebx*4]
    test byte ptr [eax + 5], 2
    je L14
    mov eax, 0x80004005
    jmp L14
    push esi
    mov esi, dword ptr [ecx + 8]
    push edi
    xor edi, edi
    test esi, esi
    jbe L14
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx]
    cmp dword ptr [eax + 4], ebx
    jne L14
    cmp dword ptr [eax + 0x30], 0
    je L14
    mov eax, dword ptr [eax + 0xc]
    cmp eax, dword ptr [ebp + 0xc]
    je L14
    cmp eax, dword ptr [ebp + 0x10]
    je L14
    mov ebx, dword ptr [ebp + 8]
    inc edi
    add edx, 4
    cmp edi, esi
    jb L14
    xor edx, edx
    test esi, esi
    jbe L14
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 4], ebx
    jne L14
    mov esi, dword ptr [eax + 0xc]
    cmp esi, dword ptr [ebp + 0xc]
    jne L14
    mov esi, dword ptr [ebp + 0x10]
    jmp L14
    mov eax, 0x80004005
    jmp L14
    cmp esi, dword ptr [ebp + 0x10]
    jne L14
    mov esi, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 0xc], esi
    inc edx
    cmp edx, dword ptr [ecx + 8]
    jb L14
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
    }
}
