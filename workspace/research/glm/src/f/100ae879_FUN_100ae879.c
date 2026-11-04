
__declspec(naked) void FUN_100ae879(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x18
    push ebx
    xor eax, eax
    cmp dword ptr [ebp + 0xc], eax
    push esi
    push edi
    mov dword ptr [ebp - 0x18], ecx
    mov dword ptr [ebp - 8], eax
    jbe L0
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + eax*4]
    test ecx, ecx
    mov dword ptr [ebp - 0x10], ecx
    je L1
    mov eax, dword ptr [ecx + 0xc]
    cmp eax, dword ptr [ebp + 0x14]
    jb L1
    xor eax, eax
    cmp dword ptr [ebp + 0x14], eax
    mov dword ptr [ebp - 4], 1
    mov dword ptr [ebp - 0x14], eax
    jbe L2
    mov edx, dword ptr [ebp - 0x18]
    mov edx, dword ptr [edx + 0x14]
    mov dword ptr [ebp - 0xc], edx
    mov edx, dword ptr [ebp + 0x10]
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ebp - 0xc]
    mov edi, dword ptr [eax + edx*4]
    xor ebx, ebx
    cmp dword ptr [ebp + 0x18], ebx
    je L3
    cmp ebx, dword ptr [ecx + 0xc]
    jae L4
    mov esi, dword ptr [ecx + 0x10]
    mov eax, dword ptr [esi]
    cmp eax, edx
    je L5
    cmp eax, dword ptr [edi + 0x38]
    je L5
    inc ebx
    add esi, 4
    cmp ebx, dword ptr [ecx + 0xc]
    jb L6
    jmp L5
    cmp ebx, dword ptr [ecx + 0xc]
    jae L4
    mov esi, dword ptr [ecx + 0x10]
    mov eax, dword ptr [esi]
    cmp eax, edx
    jne L7
    cmp dword ptr [edi + 0x3c], 0
    je L5
    cmp eax, dword ptr [edi + 0x38]
    jne L8
    mov ecx, dword ptr [ebp - 0xc]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 0x3c], 0
    mov ecx, dword ptr [ebp - 0x10]
    je L5
    inc ebx
    add esi, 4
    cmp ebx, dword ptr [ecx + 0xc]
    jb L9
    cmp ebx, dword ptr [ecx + 0xc]
    jne L10
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 0x14]
    inc eax
    cmp eax, dword ptr [ebp + 0x14]
    mov dword ptr [ebp - 0x14], eax
    jb L11
    cmp dword ptr [ebp - 4], 0
    jne L2
    mov eax, dword ptr [ebp - 8]
    inc eax
    cmp eax, dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 8], eax
    jb L12
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x14
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ecx*4]
    jmp L13
    }
}
