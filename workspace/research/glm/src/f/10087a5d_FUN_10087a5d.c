extern int c_10000000;

__declspec(naked) void FUN_10087a5d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0xc]
    cmp dword ptr [ebp + 8], edx
    push edi
    mov edi, ecx
    jne L0
    xor eax, eax
    inc eax
    jmp L1
    mov eax, dword ptr [edi + 0x14]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    push esi
    mov esi, dword ptr [edi + 0x10]
    mov ecx, dword ptr [esi + ecx*4]
    test byte ptr [ecx + 4], 2
    jne L2
    xor eax, eax
    jmp L3
    mov eax, dword ptr [eax + 0x48]
    mov ecx, dword ptr [edi + 0x18]
    mov esi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi]
    and eax, 0xfff00000
    cmp eax, c_10000000
    push ebx
    jne L4
    mov ebx, dword ptr [esi + 0xc]
    xor eax, eax
    test ebx, ebx
    jbe L5
    mov ecx, dword ptr [esi + 0x10]
    cmp dword ptr [ecx], edx
    je L5
    inc eax
    add ecx, 4
    cmp eax, ebx
    jb L6
    mov ecx, dword ptr [esi + 8]
    push dword ptr [ecx + eax*4]
    mov ecx, edi
    push dword ptr [ebp + 8]
    call L7
    test eax, eax
    je L8
    xor eax, eax
    inc eax
    jmp L9
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [esi]
    and eax, 0xfff00000
    cmp eax, 0x20500000
    jne L10
    mov ecx, dword ptr [esi + 0xc]
    xor ebx, ebx
    test ecx, ecx
    jbe L11
    mov eax, dword ptr [esi + 0x10]
    cmp dword ptr [eax], edx
    je L11
    inc ebx
    add eax, 4
    cmp ebx, ecx
    jb L12
    mov eax, dword ptr [esi + 8]
    push dword ptr [eax + ebx*4]
    mov ecx, edi
    push dword ptr [ebp + 8]
    call L7
    test eax, eax
    jne L13
    mov eax, dword ptr [esi + 0xc]
    mov ecx, dword ptr [esi + 8]
    add eax, ebx
    push dword ptr [ecx + eax*4]
    mov ecx, edi
    push dword ptr [ebp + 8]
    call L7
    test eax, eax
    jne L13
    xor eax, eax
    pop ebx
    pop esi
    pop edi
    pop ebp
    ret 8
    }
}
