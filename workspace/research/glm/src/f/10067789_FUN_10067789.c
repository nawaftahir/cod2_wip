
__declspec(naked) void FUN_10067789(void)
{
    __asm {
    mov edi, edi
    push ebx
    push esi
    mov esi, dword ptr [ecx + 4]
    cmp dword ptr [ecx], esi
    jae L8
    mov eax, dword ptr [ecx]
    mov bl, byte ptr [eax]
    cmp bl, 0xa
    je L8
    cmp bl, 0x5c
    jne L8
    lea edx, [eax + 1]
    cmp edx, esi
    jae L8
    cmp byte ptr [edx], 0xa
    jne L8
    add eax, 2
    jmp L8
    cmp bl, 0x5c
    jne L8
    lea edx, [eax + 2]
    cmp edx, esi
    jae L8
    cmp byte ptr [eax + 1], 0xd
    jne L8
    cmp byte ptr [edx], 0xa
    jne L8
    add eax, 3
    inc dword ptr [ecx + 0x1c]
    jmp L8
    inc eax
    mov dword ptr [ecx], eax
    cmp eax, dword ptr [ecx + 4]
    jb L8
    xor eax, eax
    pop esi
    pop ebx
    ret
    xor eax, eax
    inc eax
    jmp L8
    }
}
