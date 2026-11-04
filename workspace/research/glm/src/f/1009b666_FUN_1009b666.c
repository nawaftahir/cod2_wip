extern void sub_10082e0f(void);
extern void sub_10099ad8(void);
extern void sub_10099b4f(void);
extern void sub_10099bdd(void);
extern void sub_10099f62(void);

__declspec(naked) void FUN_1009b666(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x4c
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    xor eax, eax
    cmp dword ptr [ebp + 0x10], eax
    push edi
    mov dword ptr [ebp - 4], ecx
    je L0
    cmp esi, eax
    je L1
    cmp dword ptr [ebp + 0xc], eax
    jne L2
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    cmp esi, eax
    jne L3
    cmp dword ptr [ebp + 0xc], eax
    jne L4
    jmp L1
    lea ecx, [ebp - 0x4c]
    call sub_10082e0f
    lea ecx, [ebp - 0x28]
    call sub_10082e0f
    cmp dword ptr [esi + 4], 9
    push 4
    pop ebx
    jne L5
    mov edi, esi
    jmp L6
    mov ecx, dword ptr [ebp - 4]
    push esi
    lea edi, [ebp - 0x4c]
    mov dword ptr [ebp - 0x3c], ebx
    mov dword ptr [ebp - 0x34], 1
    call sub_10099b4f
    cmp dword ptr [ebp + 0x10], 0
    mov dword ptr [ebp - 0x30], eax
    je L6
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_10099ad8
    test eax, eax
    je L6
    mov dword ptr [ebp - 0x3c], 1
    mov eax, dword ptr [ebp + 0xc]
    cmp dword ptr [eax + 4], 9
    jne L7
    mov esi, eax
    jmp L8
    push dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp - 4]
    lea esi, [ebp - 0x28]
    mov dword ptr [ebp - 0x18], ebx
    mov dword ptr [ebp - 0x10], 1
    call sub_10099b4f
    cmp dword ptr [ebp + 0x10], 0
    mov dword ptr [ebp - 0xc], eax
    je L8
    push dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099ad8
    test eax, eax
    je L8
    mov dword ptr [ebp - 0x18], 1
    mov ecx, dword ptr [edi + 0x10]
    cmp ecx, ebx
    je L9
    mov eax, dword ptr [esi + 0x10]
    cmp eax, ebx
    je L9
    test ecx, ecx
    jne L10
    cmp eax, 3
    je L4
    xor edx, edx
    inc edx
    mov eax, edx
    jmp L11
    xor edx, edx
    inc edx
    cmp ecx, edx
    jne L12
    test eax, eax
    je L13
    cmp eax, edx
    je L14
    cmp eax, 2
    jne L15
    mov eax, dword ptr [esi + 0x18]
    cmp eax, edx
    jne L16
    mov ecx, dword ptr [edi + 0x1c]
    cmp ecx, dword ptr [esi + 0x1c]
    ja L4
    mov esi, dword ptr [esi + 0x1c]
    cmp esi, edx
    jne L17
    cmp dword ptr [edi + 0x1c], eax
    ja L4
    cmp eax, edx
    je L13
    cmp esi, edx
    je L13
    imul eax, esi
    cmp eax, dword ptr [edi + 0x1c]
    jmp L18
    cmp ecx, 2
    jne L19
    test eax, eax
    je L13
    cmp eax, edx
    jne L20
    mov eax, dword ptr [edi + 0x18]
    cmp eax, edx
    jne L21
    mov ecx, dword ptr [edi + 0x1c]
    cmp ecx, dword ptr [esi + 0x1c]
    ja L4
    mov edi, dword ptr [edi + 0x1c]
    cmp edi, edx
    jne L22
    cmp eax, dword ptr [esi + 0x1c]
    ja L4
    cmp eax, edx
    je L13
    cmp edi, edx
    je L13
    imul eax, edi
    cmp eax, dword ptr [esi + 0x1c]
    jmp L18
    cmp eax, 2
    jne L15
    mov eax, dword ptr [edi + 0x18]
    cmp eax, dword ptr [esi + 0x18]
    ja L4
    mov eax, dword ptr [edi + 0x1c]
    cmp eax, dword ptr [esi + 0x1c]
    jbe L13
    jmp L4
    cmp eax, 3
    jne L13
    jmp L4
    cmp ecx, 3
    jne L13
    cmp eax, ecx
    jne L4
    mov esi, dword ptr [esi + 0x14]
    cmp esi, 0xd
    je L13
    cmp esi, 0xf
    jne L23
    mov edi, dword ptr [edi + 0x14]
    cmp edi, esi
    je L13
    cmp edi, 0x10
    je L13
    cmp edi, 0x11
    je L13
    cmp edi, 0x12
    je L13
    cmp edi, 0x13
    jmp L18
    cmp esi, 0x14
    jne L24
    mov edi, dword ptr [edi + 0x14]
    cmp edi, esi
    je L13
    cmp edi, 0x15
    je L13
    cmp edi, 0x16
    je L13
    cmp edi, 0x17
    je L13
    cmp edi, 0x18
    jmp L18
    cmp dword ptr [edi + 0x14], esi
    je L13
    jmp L4
    mov ebx, dword ptr [edi + 0x1c]
    mov eax, dword ptr [esi + 0x1c]
    imul ebx, dword ptr [edi + 0x18]
    imul eax, dword ptr [esi + 0x18]
    cmp dword ptr [ebp + 0x10], 0
    je L25
    cmp ebx, eax
    ja L4
    xor esi, esi
    test ebx, ebx
    jbe L1
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 0x4c]
    push eax
    push esi
    push dword ptr [ebp + 8]
    call sub_10099f62
    test eax, eax
    jl L4
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 0x28]
    push eax
    push esi
    push dword ptr [ebp + 0xc]
    call sub_10099f62
    test eax, eax
    jl L4
    mov ecx, dword ptr [ebp - 4]
    push 1
    lea eax, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x4c]
    push eax
    call L26
    test eax, eax
    je L4
    inc esi
    cmp esi, ebx
    jb L27
    jmp L1
    cmp ecx, dword ptr [esi + 0x10]
    jne L4
    cmp ebx, eax
    jne L4
    xor esi, esi
    test ebx, ebx
    jbe L1
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 0x4c]
    push eax
    push esi
    push dword ptr [ebp + 8]
    call sub_10099f62
    test eax, eax
    jl L4
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 0x28]
    push eax
    push esi
    push dword ptr [ebp + 0xc]
    call sub_10099f62
    test eax, eax
    jl L4
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x4c]
    push eax
    call sub_10099bdd
    test eax, eax
    je L4
    inc esi
    cmp esi, ebx
    jb L28
    xor eax, eax
    inc eax
    jmp L11
    }
}
