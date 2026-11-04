
__declspec(naked) void _strncpy(void)
{
    __asm {
    mov ecx, dword ptr [esp + 0xc]
    push edi
    test ecx, ecx
    je L0
    push esi
    push ebx
    mov ebx, ecx
    mov esi, dword ptr [esp + 0x14]
    test esi, 3
    mov edi, dword ptr [esp + 0x10]
    jne L1
    shr ecx, 2
    jne L2
    jmp L3
    mov al, byte ptr [esi]
    add esi, 1
    mov byte ptr [edi], al
    add edi, 1
    sub ecx, 1
    je L4
    test al, al
    je L5
    test esi, 3
    jne L1
    mov ebx, ecx
    shr ecx, 2
    jne L2
    and ebx, 3
    je L4
    mov al, byte ptr [esi]
    add esi, 1
    mov byte ptr [edi], al
    add edi, 1
    test al, al
    je L6
    sub ebx, 1
    jne L3
    mov eax, dword ptr [esp + 0x10]
    pop ebx
    pop esi
    pop edi
    ret
    test edi, 3
    je L7
    mov byte ptr [edi], al
    add edi, 1
    sub ecx, 1
    je L8
    test edi, 3
    jne L9
    mov ebx, ecx
    shr ecx, 2
    jne L10
    mov byte ptr [edi], al
    add edi, 1
    sub ebx, 1
    jne L11
    pop ebx
    pop esi
    mov eax, dword ptr [esp + 8]
    pop edi
    ret
    mov dword ptr [edi], edx
    add edi, 4
    sub ecx, 1
    je L12
    mov edx, 0x7efefeff
    mov eax, dword ptr [esi]
    add edx, eax
    xor eax, 0xffffffff
    xor eax, edx
    mov edx, dword ptr [esi]
    add esi, 4
    test eax, 0x81010100
    je L13
    test dl, dl
    je L14
    test dh, dh
    je L15
    test edx, 0xff0000
    je L16
    test edx, 0xff000000
    jne L13
    mov dword ptr [edi], edx
    jmp L17
    and edx, 0xffff
    mov dword ptr [edi], edx
    jmp L17
    and edx, 0xff
    mov dword ptr [edi], edx
    jmp L17
    xor edx, edx
    mov dword ptr [edi], edx
    add edi, 4
    xor eax, eax
    sub ecx, 1
    je L18
    xor eax, eax
    mov dword ptr [edi], eax
    add edi, 4
    sub ecx, 1
    jne L19
    and ebx, 3
    jne L11
    mov eax, dword ptr [esp + 0x10]
    pop ebx
    pop esi
    pop edi
    ret
    }
}
