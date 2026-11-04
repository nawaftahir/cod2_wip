
__declspec(naked) void FUN_10062db3(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    je L0
    and dword ptr [eax], 0
    push ebx
    mov ebx, dword ptr [ebp + 0x14]
    test ebx, ebx
    je L1
    and dword ptr [ebx], 0
    mov edx, dword ptr [ebp + 8]
    test edx, edx
    jne L2
    mov eax, 0x8876086c
    jmp L3
    push edi
    mov edi, dword ptr [edx]
    mov eax, edi
    mov ecx, 0xffff0000
    and eax, ecx
    cmp eax, 0x46580000
    je L4
    cmp eax, 0x54580000
    je L4
    cmp eax, 0x7ffe0000
    je L4
    cmp eax, 0x7fff0000
    je L4
    cmp eax, 0xfffe0000
    je L4
    cmp eax, ecx
    je L4
    mov eax, 0x88760b59
    jmp L5
    lea ecx, [edx + 4]
    mov edx, 0xffff
    push esi
    mov eax, dword ptr [ecx]
    test eax, eax
    js L6
    mov esi, eax
    and esi, edx
    cmp esi, edx
    je L7
    cmp esi, 0xfffe
    jne L8
    shr eax, 0x10
    and eax, 0x7fff
    cmp eax, 1
    jbe L9
    mov esi, dword ptr [ebp + 0xc]
    cmp esi, dword ptr [ecx + 4]
    jne L9
    mov edx, dword ptr [ebp + 0x10]
    test edx, edx
    je L10
    add ecx, 8
    mov dword ptr [edx], ecx
    test ebx, ebx
    je L11
    lea eax, [eax*4 - 4]
    mov dword ptr [ebx], eax
    xor eax, eax
    pop esi
    pop edi
    pop ebx
    pop ebp
    ret 0x10
    mov ebx, edi
    and ebx, edx
    cmp ebx, 0x200
    jb L12
    shr eax, 0x18
    and eax, 0xf
    lea ecx, [ecx + eax*4]
    jmp L6
    cmp esi, 0x51
    jne L6
    add ecx, 0x14
    mov ebx, dword ptr [ebp + 0x14]
    add ecx, 4
    jmp L13
    xor eax, eax
    inc eax
    jmp L14
    }
}
