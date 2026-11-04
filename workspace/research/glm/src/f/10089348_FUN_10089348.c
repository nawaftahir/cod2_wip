
__declspec(naked) void FUN_10089348(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov edx, dword ptr [ecx + 0x6c]
    push ebx
    push esi
    xor esi, esi
    test edx, 0x4000000
    push edi
    mov dword ptr [ebp - 4], esi
    je L8
    mov edx, dword ptr [ecx + 0xc]
    xor eax, eax
    cmp edx, esi
    je L8
    mov esi, dword ptr [ecx + 0x18]
    mov edi, dword ptr [esi]
    inc eax
    test byte ptr [edi + 0x2c], al
    jne L8
    mov dword ptr [ebp - 4], eax
    cmp edx, eax
    mov edi, eax
    jbe L8
    mov edx, dword ptr [esi + edi*4]
    test byte ptr [edx + 0x2c], al
    je L8
    mov edx, dword ptr [ecx + 0x18]
    lea edx, [edx + edi*4]
    mov ebx, dword ptr [edx - 4]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [edx + 0x2c]
    cmp edx, dword ptr [ebx + 0x2c]
    je L8
    inc dword ptr [ebp - 4]
    inc edi
    cmp edi, dword ptr [ecx + 0xc]
    jb L8
    jmp L8
    test edx, 0x8000000
    je L8
    mov ebx, dword ptr [ecx + 0xc]
    cmp ebx, esi
    jbe L8
    mov edi, dword ptr [ecx + 0x18]
    mov dword ptr [ebp - 8], 1
    mov eax, dword ptr [edi + esi*4]
    test byte ptr [eax + 0x2c], 1
    je L8
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 8], ebx
    jae L8
    mov eax, dword ptr [ecx + 0x18]
    lea edx, [eax + esi*4]
    mov eax, dword ptr [edx + 4]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [edx + 0x2c]
    cmp edx, dword ptr [eax + 0x2c]
    jne L8
    inc esi
    inc dword ptr [ebp - 8]
    inc esi
    inc dword ptr [ebp - 8]
    cmp esi, ebx
    jb L8
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
