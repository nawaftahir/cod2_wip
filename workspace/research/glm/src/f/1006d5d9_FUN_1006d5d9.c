
__declspec(naked) void FUN_1006d5d9(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x18
    cmp dword ptr [ebp + 0xc], 2
    mov dword ptr [ebp - 0x18], ecx
    je L0
    xor eax, eax
    cmp dword ptr [ebp + 0x10], 1
    sete al
    jmp L1
    mov eax, dword ptr [ebp + 0x10]
    imul eax, dword ptr [ebp + 0x14]
    test eax, eax
    je L1
    push ebx
    xor edx, edx
    cmp dword ptr [ebp + 0x14], edx
    push esi
    push edi
    mov dword ptr [ebp - 8], edx
    jbe L2
    mov eax, dword ptr [ecx + 8]
    mov esi, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0x10], esi
    mov dword ptr [ebp - 0x14], eax
    cmp dword ptr [ebp + 0x10], edx
    mov esi, dword ptr [ebp - 0x10]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [esi + eax*4]
    mov esi, dword ptr [eax + 4]
    mov dword ptr [ebp + 0xc], edx
    jbe L3
    mov edx, dword ptr [ecx + 8]
    mov edx, dword ptr [edx + 0x14]
    mov dword ptr [ebp - 0xc], edx
    mov dword ptr [ebp - 4], edi
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx]
    mov ebx, dword ptr [ebp - 0xc]
    mov edx, dword ptr [ebx + edx*4]
    cmp esi, dword ptr [edx + 4]
    jne L4
    mov ebx, dword ptr [ebp - 0x14]
    mov ebx, dword ptr [ebx + esi*4]
    test byte ptr [ebx + 4], 0x40
    je L5
    mov ebx, dword ptr [ebp + 0xc]
    shr ebx, 2
    add ebx, dword ptr [eax + 0xc]
    cmp ebx, dword ptr [edx + 0xc]
    jne L4
    mov ebx, dword ptr [ebp + 0xc]
    and ebx, 3
    add ebx, dword ptr [eax + 0x10]
    cmp ebx, dword ptr [edx + 0x10]
    jmp L6
    mov ebx, dword ptr [eax + 0x48]
    cmp ebx, dword ptr [edx + 0x48]
    jne L4
    mov edx, dword ptr [ebp + 0x14]
    inc dword ptr [ebp + 0xc]
    shl edx, 2
    add dword ptr [ebp - 4], edx
    mov edx, dword ptr [ebp + 0xc]
    cmp edx, dword ptr [ebp + 0x10]
    jb L7
    xor edx, edx
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add edi, 4
    cmp eax, dword ptr [ebp + 0x14]
    jb L8
    cmp dword ptr [ebp + 0x10], edx
    mov dword ptr [ebp - 8], edx
    jbe L4
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov ebx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [ebx]
    mov edx, dword ptr [ecx + eax*4]
    and dword ptr [ebp + 8], 0
    cmp dword ptr [ebp + 0x14], 0
    mov edi, dword ptr [edx + 4]
    jbe L9
    mov eax, dword ptr [ebp - 0x18]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [ebp - 0xc], eax
    mov dword ptr [ebp + 0xc], ebx
    mov eax, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [ebp - 0xc]
    mov esi, dword ptr [esi + eax*4]
    cmp edi, dword ptr [esi + 4]
    jne L10
    mov eax, dword ptr [ebp - 0x14]
    mov eax, dword ptr [eax + edi*4]
    test byte ptr [eax + 4], 0x40
    je L11
    mov eax, dword ptr [ebp + 8]
    shr eax, 2
    add eax, dword ptr [edx + 0xc]
    cmp eax, dword ptr [esi + 0xc]
    jne L10
    mov eax, dword ptr [ebp + 8]
    and eax, 3
    add eax, dword ptr [edx + 0x10]
    cmp eax, dword ptr [esi + 0x10]
    jmp L12
    mov eax, dword ptr [edx + 0x48]
    cmp eax, dword ptr [esi + 0x48]
    jne L10
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    add dword ptr [ebp + 0xc], 4
    cmp eax, dword ptr [ebp + 0x14]
    jb L13
    mov eax, dword ptr [ebp + 0x14]
    inc dword ptr [ebp - 8]
    shl eax, 2
    add ebx, eax
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 0x10]
    jb L14
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
    xor eax, eax
    jmp L15
    }
}
