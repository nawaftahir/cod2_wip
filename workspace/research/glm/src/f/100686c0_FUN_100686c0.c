extern void sub_100677e4(void);
extern void sub_1006796f(void);
extern void sub_100679f3(void);
extern void sub_10067b01(void);
extern void sub_10067b4b(void);
extern void sub_10067fa7(void);
extern void sub_100680d0(void);
extern void sub_10068174(void);
extern void sub_100681f2(void);
extern void sub_1006842e(void);
extern void sub_10068533(void);
extern void sub_10068576(void);
extern void sub_100f8541(void);

__declspec(naked) void FUN_100686c0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, ecx
    mov dword ptr [esi + 0x28], eax
    mov eax, dword ptr [esi + 0x18]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov dword ptr [edi + 0x10], eax
    mov eax, dword ptr [esi + 0x1c]
    xor ebx, ebx
    mov dword ptr [edi + 0x14], eax
    call sub_10067fa7
    test eax, eax
    je L0
    mov dword ptr [edi], 0xc
    jmp L1
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [edi + 0x10], eax
    mov eax, dword ptr [esi + 0x1c]
    mov dword ptr [edi + 0x14], eax
    mov eax, dword ptr [esi]
    cmp eax, dword ptr [esi + 4]
    jb L2
    mov dword ptr [edi], 0xd
    jmp L1
    mov cl, byte ptr [eax]
    cmp cl, 0x30
    jl L3
    cmp cl, 0x39
    jle L4
    cmp cl, 0x2e
    jne L5
    lea ecx, [edi + 8]
    push ecx
    push eax
    mov ecx, esi
    call sub_100677e4
    mov ebx, eax
    test ebx, ebx
    mov ecx, esi
    je L6
    mov dword ptr [edi], 5
    mov eax, dword ptr [esi]
    push edi
    add eax, ebx
    push eax
    call sub_10067b01
    add ebx, eax
    jmp L1
    lea eax, [edi + 8]
    push eax
    push dword ptr [esi]
    call sub_100680d0
    mov ebx, eax
    test ebx, ebx
    mov ecx, esi
    jne L7
    lea eax, [edi + 8]
    push eax
    push dword ptr [esi]
    call sub_10068174
    mov ebx, eax
    test ebx, ebx
    mov ecx, esi
    jne L7
    lea eax, [edi + 8]
    push eax
    push dword ptr [esi]
    call sub_100681f2
    mov ebx, eax
    test ebx, ebx
    je L8
    mov ecx, esi
    mov dword ptr [edi], 2
    mov eax, dword ptr [esi]
    add eax, ebx
    push edi
    push eax
    call sub_10067b4b
    jmp L9
    cmp cl, 0x27
    jne L10
    lea ecx, [edi + 8]
    push ecx
    push eax
    mov ecx, esi
    call sub_10068533
    mov ebx, eax
    test ebx, ebx
    je L8
    mov dword ptr [edi], 2
    jmp L1
    cmp cl, 0x22
    jne L11
    lea ecx, [edi + 8]
    push ecx
    push eax
    mov ecx, esi
    call sub_10068576
    mov ebx, eax
    test ebx, ebx
    je L8
    mov dword ptr [edi], 0xa
    jmp L1
    test byte ptr [esi + 0x28], 4
    je L12
    cmp cl, 0x3c
    jne L12
    lea ecx, [edi + 8]
    push ecx
    push eax
    mov ecx, esi
    call sub_10068576
    mov ebx, eax
    test ebx, ebx
    je L8
    mov dword ptr [edi], 0xb
    jmp L1
    movsx eax, cl
    push eax
    call sub_100f8541
    test eax, eax
    pop ecx
    jne L13
    mov eax, dword ptr [esi]
    cmp byte ptr [eax], 0x5f
    jne L8
    test byte ptr [esi + 0x28], 2
    je L14
    lea eax, [edi + 8]
    push eax
    push dword ptr [esi]
    mov ecx, esi
    call sub_1006842e
    mov ebx, eax
    test ebx, ebx
    je L14
    and dword ptr [edi], 0
    jmp L1
    lea eax, [edi + 8]
    push eax
    push dword ptr [esi]
    mov ecx, esi
    call sub_1006796f
    mov ebx, eax
    test ebx, ebx
    je L8
    mov dword ptr [edi], 9
    jmp L1
    lea eax, [edi + 8]
    push eax
    push dword ptr [esi]
    mov ecx, esi
    call sub_100679f3
    mov ebx, eax
    mov dword ptr [edi], 1
    mov eax, dword ptr [esi]
    mov dword ptr [edi + 0x18], eax
    mov dword ptr [edi + 0x1c], ebx
    add dword ptr [esi], ebx
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    pop ebp
    ret 8
    }
}
