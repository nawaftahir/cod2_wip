
__declspec(naked) void FUN_1006d76d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    cmp dword ptr [ebp + 0xc], 2
    push esi
    mov esi, ecx
    mov dword ptr [ebp - 0x10], esi
    je L0
    xor eax, eax
    inc eax
    cmp eax, dword ptr [ebp + 0x10]
    sbb eax, eax
    neg eax
    jmp L1
    mov eax, dword ptr [ebp + 0x10]
    imul eax, dword ptr [ebp + 0x14]
    test eax, eax
    je L1
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 0x10], 0
    push ebx
    push edi
    jbe L2
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov ebx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [ebx]
    mov edx, dword ptr [ecx + eax*4]
    and dword ptr [ebp + 0xc], 0
    cmp dword ptr [ebp + 0x14], 0
    mov edi, dword ptr [edx + 4]
    jbe L3
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [ebp - 0xc], eax
    mov dword ptr [ebp - 4], ebx
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [ebp - 0xc]
    mov esi, dword ptr [esi + eax*4]
    cmp edi, dword ptr [esi + 4]
    jne L4
    mov eax, dword ptr [ebp - 0x14]
    mov eax, dword ptr [eax + edi*4]
    test byte ptr [eax + 4], 0x40
    je L5
    mov eax, dword ptr [ebp + 0xc]
    shr eax, 2
    add eax, dword ptr [edx + 0xc]
    cmp eax, dword ptr [esi + 0xc]
    jne L4
    mov eax, dword ptr [ebp + 0xc]
    and eax, 3
    add eax, dword ptr [edx + 0x10]
    cmp eax, dword ptr [esi + 0x10]
    jmp L6
    mov eax, dword ptr [edx + 0x48]
    cmp eax, dword ptr [esi + 0x48]
    jne L4
    inc dword ptr [ebp + 0xc]
    mov eax, dword ptr [ebp + 0xc]
    add dword ptr [ebp - 4], 4
    cmp eax, dword ptr [ebp + 0x14]
    jb L7
    mov esi, dword ptr [ebp - 0x10]
    mov eax, dword ptr [ebp + 0x14]
    inc dword ptr [ebp - 8]
    shl eax, 2
    add ebx, eax
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 0x10]
    jb L8
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 0x14], 0
    jbe L4
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    and dword ptr [ebp + 8], 0
    cmp dword ptr [ebp + 0x10], 0
    mov esi, dword ptr [eax + 4]
    jbe L9
    mov edx, dword ptr [ebp - 0x10]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 0x14]
    mov dword ptr [ebp - 0xc], edx
    mov dword ptr [ebp + 0xc], edi
    mov edx, dword ptr [ebp + 0xc]
    mov edx, dword ptr [edx]
    mov ebx, dword ptr [ebp - 0xc]
    mov edx, dword ptr [ebx + edx*4]
    cmp esi, dword ptr [edx + 4]
    jne L10
    mov ebx, dword ptr [ebp - 0x14]
    mov ebx, dword ptr [ebx + esi*4]
    test byte ptr [ebx + 4], 0x40
    je L11
    mov ebx, dword ptr [ebp + 8]
    shr ebx, 2
    add ebx, dword ptr [eax + 0xc]
    cmp ebx, dword ptr [edx + 0xc]
    jne L10
    mov ebx, dword ptr [ebp + 8]
    and ebx, 3
    add ebx, dword ptr [eax + 0x10]
    cmp ebx, dword ptr [edx + 0x10]
    jmp L12
    mov ebx, dword ptr [eax + 0x48]
    cmp ebx, dword ptr [edx + 0x48]
    jne L10
    mov edx, dword ptr [ebp + 0x14]
    inc dword ptr [ebp + 8]
    shl edx, 2
    add dword ptr [ebp + 0xc], edx
    mov edx, dword ptr [ebp + 0x10]
    cmp dword ptr [ebp + 8], edx
    jb L13
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add edi, 4
    cmp eax, dword ptr [ebp + 0x14]
    jb L14
    xor eax, eax
    inc eax
    pop edi
    pop ebx
    pop esi
    leave
    ret 0x10
    xor eax, eax
    jmp L15
    }
}
