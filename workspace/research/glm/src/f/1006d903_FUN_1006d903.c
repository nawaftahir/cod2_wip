extern void sub_10063776(void);

__declspec(naked) void FUN_1006d903(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x18
    and dword ptr [ebp - 0xc], 0
    or dword ptr [ebp - 4], 0xffffffff
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 4]
    test eax, eax
    je L0
    cmp dword ptr [eax + 4], 4
    jne L0
    mov eax, dword ptr [eax + 0x1c]
    test eax, eax
    mov dword ptr [ebp - 8], eax
    je L1
    push esi
    push edi
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + 8]
    test edi, edi
    je L2
    cmp dword ptr [edi + 4], 6
    jne L2
    cmp dword ptr [edi + 0x10], 2
    jne L2
    mov eax, dword ptr [edi + 0x14]
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 0x18]
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L3
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L3
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L5
    xor eax, eax
    jmp L6
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jne L2
    mov edi, dword ptr [edi + 0x18]
    cmp dword ptr [edi + 0x3c], eax
    je L2
    test byte ptr [edi + 0x18], 2
    jne L2
    mov eax, dword ptr [edi + 0x1c]
    xor ecx, ecx
    cmp eax, ecx
    je L7
    lea edx, [ebp - 0x18]
    push edx
    push ecx
    push dword ptr [eax + 0x18]
    call sub_10063776
    test eax, eax
    jl L8
    mov ecx, dword ptr [ebp - 0x14]
    jmp L7
    or ecx, 0xffffffff
    mov eax, ecx
    mov edx, 0xffff0000
    and eax, edx
    je L9
    mov esi, dword ptr [ebx + 0x10]
    and esi, edx
    cmp eax, esi
    jne L2
    mov eax, ecx
    mov edx, 0xffff
    and eax, edx
    je L10
    mov esi, dword ptr [ebx + 0x10]
    and esi, edx
    cmp eax, esi
    jne L2
    cmp dword ptr [ebp - 4], -1
    je L11
    cmp ecx, dword ptr [ebp - 4]
    jbe L2
    mov dword ptr [ebp - 0xc], edi
    mov dword ptr [ebp - 4], ecx
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 0xc]
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jne L12
    pop edi
    pop esi
    mov eax, dword ptr [ebp - 0xc]
    jmp L13
    xor eax, eax
    pop ebx
    leave
    ret 4
    }
}
