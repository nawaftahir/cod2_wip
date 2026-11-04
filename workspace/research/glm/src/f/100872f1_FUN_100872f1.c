
__declspec(naked) void FUN_100872f1(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov edx, ecx
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx]
    push esi
    push edi
    or ebx, 0xffffffff
    xor edi, edi
    cmp eax, ebx
    mov dword ptr [ebp - 8], edx
    jne L0
    mov esi, dword ptr [ebp + 0xc]
    cmp dword ptr [esi], edi
    jne L0
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebp + 0x10]
    jmp L1
    cmp dword ptr [ebp + 0x10], ebx
    jne L2
    cmp dword ptr [ebp + 0x14], edi
    je L3
    mov esi, eax
    xor ecx, ecx
    cmp esi, ebx
    mov dword ptr [ebp - 4], edi
    je L4
    mov edi, dword ptr [edx + 0x14]
    mov esi, dword ptr [edi + esi*4]
    mov esi, dword ptr [esi + 0x14]
    inc ecx
    cmp esi, ebx
    jne L5
    mov esi, dword ptr [ebp + 0x10]
    cmp esi, ebx
    je L6
    mov edi, dword ptr [edx + 0x14]
    mov edx, dword ptr [edi + esi*4]
    mov esi, dword ptr [edx + 0x14]
    inc dword ptr [ebp - 4]
    cmp esi, ebx
    jne L7
    mov edx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebp - 4]
    mov esi, dword ptr [ebp + 0xc]
    mov edi, dword ptr [esi]
    jbe L8
    mov ebx, dword ptr [edx + 0x14]
    mov esi, ecx
    sub esi, dword ptr [ebp - 4]
    mov eax, dword ptr [ebx + eax*4]
    mov edi, dword ptr [eax + 0x18]
    mov eax, dword ptr [eax + 0x14]
    dec ecx
    dec esi
    jne L9
    cmp dword ptr [ebp - 4], ecx
    mov esi, dword ptr [ebp + 0x14]
    mov edx, dword ptr [ebp + 0x10]
    jbe L10
    mov esi, dword ptr [ebp - 8]
    mov ebx, dword ptr [esi + 0x14]
    mov esi, dword ptr [ebp - 4]
    sub esi, ecx
    mov ecx, esi
    dec ecx
    mov edx, dword ptr [ebx + edx*4]
    mov esi, dword ptr [edx + 0x18]
    mov edx, dword ptr [edx + 0x14]
    jne L11
    cmp edi, esi
    jne L12
    cmp eax, edx
    je L13
    cmp eax, -1
    je L14
    cmp edx, -1
    je L14
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [esi + eax*4]
    mov edx, dword ptr [esi + edx*4]
    mov edi, dword ptr [eax + 0x18]
    mov esi, dword ptr [edx + 0x18]
    mov eax, dword ptr [eax + 0x14]
    mov edx, dword ptr [edx + 0x14]
    jmp L10
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], edi
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], eax
    jmp L3
    mov eax, dword ptr [ebp + 0xc]
    and dword ptr [eax], 0
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax], 0xffffffff
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret 0x10
    }
}
