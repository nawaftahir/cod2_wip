extern void sub_100f7865(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_100840db(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    mov edi, dword ptr [ebp + 0xc]
    test edi, edi
    mov esi, ecx
    mov dword ptr [ebp - 4], esi
    je L0
    cmp dword ptr [ebp + 8], 0
    jne L0
    mov eax, 0x80004005
    jmp L1
    cmp edi, -1
    jne L2
    mov eax, dword ptr [ebp + 8]
    lea edx, [eax + 1]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L3
    sub eax, edx
    inc eax
    mov dword ptr [ebp + 0xc], eax
    mov edi, eax
    test byte ptr [ebp + 0x10], 1
    jne L4
    or dword ptr [ebp + 0x10], 2
    test byte ptr [ebp + 0x10], 2
    je L5
    mov eax, dword ptr [esi + 8]
    jmp L6
    test byte ptr [eax + 8], 2
    je L7
    cmp edi, dword ptr [eax + 4]
    jne L7
    mov esi, dword ptr [ebp + 8]
    mov ecx, edi
    mov edi, dword ptr [eax]
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L8
    mov edi, dword ptr [ebp + 0xc]
    mov esi, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 0x10]
    test eax, eax
    jne L9
    push ebx
    push 0x14
    call sub_100f786a
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L10
    mov eax, 0x8007000e
    jmp L11
    mov ecx, dword ptr [ebp + 0x14]
    test ecx, ecx
    je L12
    mov eax, dword ptr [eax + 0xc]
    mov dword ptr [ecx], eax
    test byte ptr [ebp + 0x10], 1
    je L13
    test byte ptr [ebp + 0x10], 8
    je L13
    push dword ptr [ebp + 8]
    call sub_100f7865
    pop ecx
    xor eax, eax
    jmp L1
    test byte ptr [ebp + 0x10], 1
    jne L14
    push edi
    call sub_100f786a
    test eax, eax
    pop ecx
    mov dword ptr [ebx], eax
    jne L15
    push ebx
    call sub_100f7865
    pop ecx
    jmp L16
    mov esi, dword ptr [ebp + 8]
    mov ecx, edi
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp + 0xc]
    mov esi, dword ptr [ebp - 4]
    jmp L17
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [ebp + 0x10]
    test al, 4
    jne L18
    mov ecx, dword ptr [esi + 4]
    add ecx, 3
    and ecx, 0xfffffffc
    mov dword ptr [esi + 4], ecx
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [ebx + 8], eax
    lea eax, [ebx + 0x10]
    and dword ptr [eax], 0
    mov dword ptr [ebx + 0xc], ecx
    mov dword ptr [ebx + 4], edi
    mov ecx, dword ptr [esi + 0xc]
    add dword ptr [esi + 4], edi
    mov dword ptr [ecx], ebx
    mov dword ptr [esi + 0xc], eax
    mov eax, dword ptr [ebp + 0x14]
    test eax, eax
    je L19
    mov ecx, dword ptr [ebx + 0xc]
    mov dword ptr [eax], ecx
    xor eax, eax
    pop ebx
    pop edi
    pop esi
    leave
    ret 0x10
    }
}
