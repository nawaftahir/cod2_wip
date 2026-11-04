extern int c_10000000;

__declspec(naked) void FUN_10086d6c(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ecx + 0x14]
    mov ecx, dword ptr [ecx + 0x18]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + ebx*4]
    mov edx, dword ptr [edx + 0x48]
    push esi
    mov esi, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x48]
    push edi
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [edi]
    mov edx, ecx
    xor edx, eax
    test edx, 0xfff00000
    jne L0
    mov eax, dword ptr [esi + 0xc]
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L1
    mov edx, dword ptr [esi + 0x10]
    mov dword ptr [ebp + 8], edx
    mov edx, dword ptr [ebp + 8]
    cmp dword ptr [edx], ebx
    je L1
    inc dword ptr [ebp - 4]
    add dword ptr [ebp + 8], 4
    cmp dword ptr [ebp - 4], eax
    jb L2
    mov ebx, dword ptr [edi + 0xc]
    and dword ptr [ebp + 8], 0
    test ebx, ebx
    jbe L3
    mov eax, dword ptr [edi + 0x10]
    mov edx, dword ptr [eax]
    cmp edx, dword ptr [ebp + 0xc]
    je L3
    inc dword ptr [ebp + 8]
    add eax, 4
    cmp dword ptr [ebp + 8], ebx
    jb L4
    mov eax, ecx
    and eax, 0xf0000000
    cmp eax, c_10000000
    jb L5
    cmp eax, 0x40000000
    ja L5
    mov eax, dword ptr [esi + 4]
    and ecx, 0xfffff
    xor edx, edx
    div ecx
    and dword ptr [ebp + 0xc], 0
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jbe L6
    mov ecx, dword ptr [esi + 0xc]
    mov edx, dword ptr [ebp - 4]
    mov eax, ecx
    mov ecx, dword ptr [esi + 8]
    mov esi, dword ptr [ebp + 8]
    lea edx, [ecx + edx*4]
    mov ecx, dword ptr [edi + 8]
    shl eax, 2
    shl ebx, 2
    lea ecx, [ecx + esi*4]
    mov esi, dword ptr [edx]
    cmp esi, dword ptr [ecx]
    jne L0
    inc dword ptr [ebp + 0xc]
    mov esi, dword ptr [ebp + 0xc]
    add ecx, ebx
    add edx, eax
    cmp esi, dword ptr [ebp - 8]
    jb L7
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 4], eax
    jne L0
    xor ecx, dword ptr [edi]
    test ecx, 0xfffff
    jne L0
    mov ecx, dword ptr [esi + 4]
    mov edi, dword ptr [edi + 8]
    mov esi, dword ptr [esi + 8]
    shl ecx, 2
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L6
    xor eax, eax
    jmp L8
    }
}
