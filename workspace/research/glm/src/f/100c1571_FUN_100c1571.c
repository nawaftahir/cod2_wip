extern int g_1019bc88;

__declspec(naked) void FUN_100c1571(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 0x54]
    cmp edx, edx
    push ebx
    push esi
    mov esi, dword ptr [eax + 0x48]
    push edi
    jne L0
    cmp dword ptr [eax + 0x58], edx
    jne L0
    or edx, 0xffffffff
    cmp esi, edx
    je L0
    mov eax, dword ptr [ecx + 0x18]
    mov edi, dword ptr [eax + esi*4]
    mov eax, dword ptr [edi]
    mov esi, eax
    and esi, 0xfff00000
    cmp esi, 0x20400000
    jne L0
    and dword ptr [ebp - 4], 0
    and eax, 0xfffff
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [edi + 0xc]
    test eax, eax
    jbe L0
    mov esi, dword ptr [edi + 0x10]
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [esi], ebx
    jne L1
    mov edx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    add esi, 4
    cmp dword ptr [ebp - 4], eax
    jb L2
    cmp edx, -1
    je L0
    mov eax, dword ptr [edi + 8]
    lea esi, [eax + edx*4]
    mov dword ptr [ebp + 8], esi
    mov esi, dword ptr [ebp - 8]
    add edx, esi
    lea esi, [eax + edx*4]
    mov eax, dword ptr [ecx + 0x14]
    mov ebx, dword ptr [esi]
    mov ebx, dword ptr [eax + ebx*4]
    mov edx, dword ptr [ecx + 0x10]
    mov ebx, dword ptr [ebx + 4]
    mov ebx, dword ptr [edx + ebx*4]
    test byte ptr [ebx + 5], 1
    je L3
    mov edx, dword ptr [ebp + 8]
    jmp L4
    mov ebx, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    je L0
    mov edx, esi
    mov esi, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 0x14]
    fld qword ptr g_1019bc88
    mov eax, dword ptr [esi]
    mov eax, dword ptr [ecx + eax*4]
    fld qword ptr [eax + 0x20]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L0
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 0x3c]
    and ecx, 0x1f0000
    cmp ecx, 0x80000
    jne L0
    mov ecx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [eax], edi
    xor eax, eax
    jmp L5
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    }
}
