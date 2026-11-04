extern void sub_10063776(void);
extern void sub_10099bdd(void);

__declspec(naked) void FUN_1009b381(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x1c
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 0x1c]
    mov dword ptr [ebp - 4], ecx
    xor ecx, ecx
    test eax, eax
    sete cl
    push edi
    mov edi, dword ptr [ebp + 0xc]
    xor edx, edx
    test edi, edi
    sete dl
    cmp edx, ecx
    je L0
    or eax, 0xffffffff
    jmp L1
    test edi, edi
    push esi
    je L2
    lea ecx, [ebp - 0x10]
    push ecx
    push 0
    push dword ptr [eax + 0x18]
    call sub_10063776
    test eax, eax
    jl L3
    lea eax, [ebp - 0x1c]
    push eax
    push 0
    push dword ptr [edi + 0x18]
    call sub_10063776
    test eax, eax
    jl L3
    mov eax, dword ptr [ebp - 0xc]
    cmp eax, dword ptr [ebp - 0x18]
    je L2
    or eax, 0xffffffff
    pop esi
    pop edi
    pop ebx
    leave
    ret 0x10
    mov eax, dword ptr [ebx + 0x1c]
    mov esi, dword ptr [eax + 0x18]
    mov eax, dword ptr [edi + 0x18]
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L4
    test cl, cl
    je L5
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L4
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L6
    xor eax, eax
    jmp L7
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jne L8
    mov edx, dword ptr [ebx + 0x24]
    mov esi, dword ptr [ebp + 0x10]
    jmp L9
    test esi, esi
    je L10
    mov eax, dword ptr [edx + 8]
    mov eax, dword ptr [eax + 0x18]
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + 0x18]
    mov edi, dword ptr [eax + 0x1c]
    cmp edi, dword ptr [ecx + 0x1c]
    jne L8
    push dword ptr [ecx + 0x20]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [eax + 0x20]
    call sub_10099bdd
    test eax, eax
    je L8
    jmp L11
    mov eax, dword ptr [edx + 8]
    cmp dword ptr [eax + 4], 6
    je L12
    mov edx, dword ptr [edx + 0xc]
    test edx, edx
    jne L13
    jmp L12
    mov eax, dword ptr [esi + 8]
    cmp dword ptr [eax + 4], 6
    je L9
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L14
    test edx, edx
    jne L15
    jmp L16
    test edx, edx
    jne L8
    test esi, esi
    jne L8
    xor eax, eax
    jmp L17
    }
}
