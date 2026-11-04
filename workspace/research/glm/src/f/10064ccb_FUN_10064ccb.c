
__declspec(naked) void FUN_10064ccb(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov esi, dword ptr [edi]
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L0
    test cl, cl
    je L1
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L0
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L2
    xor eax, eax
    jmp L3
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jne L4
    mov eax, dword ptr [edx + 4]
    test eax, eax
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 0xc], ecx
    je L5
    test ecx, ecx
    je L6
    mov eax, dword ptr [eax + 0xc]
    test eax, eax
    mov ecx, dword ptr [ecx + 0xc]
    jne L7
    test eax, eax
    jne L4
    test ecx, ecx
    jne L4
    mov edx, dword ptr [edx + 8]
    mov ecx, dword ptr [edi + 8]
    jmp L8
    test ecx, ecx
    je L9
    mov eax, dword ptr [edx + 0x10]
    cmp eax, dword ptr [ecx + 0x10]
    jne L9
    cmp eax, 8
    jg L10
    cmp eax, 5
    jge L11
    test eax, eax
    je L12
    cmp eax, 1
    je L13
    jle L14
    cmp eax, 4
    jg L14
    mov eax, dword ptr [edx + 0x18]
    sub eax, dword ptr [ecx + 0x18]
    neg eax
    sbb eax, eax
    inc eax
    jmp L15
    mov al, byte ptr [edx + 0x18]
    cmp al, byte ptr [ecx + 0x18]
    jne L9
    mov al, byte ptr [edx + 0x19]
    cmp al, byte ptr [ecx + 0x19]
    jne L9
    mov al, byte ptr [edx + 0x1a]
    cmp al, byte ptr [ecx + 0x1a]
    jne L9
    mov al, byte ptr [edx + 0x1b]
    cmp al, byte ptr [ecx + 0x1b]
    je L14
    test edx, edx
    jne L4
    test ecx, ecx
    jne L4
    xor eax, eax
    inc eax
    jmp L16
    fld qword ptr [ecx + 0x18]
    fld qword ptr [edx + 0x18]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L9
    jmp L14
    cmp eax, 9
    je L17
    jle L14
    cmp eax, 0xb
    jg L14
    mov esi, dword ptr [ecx + 0x18]
    mov eax, dword ptr [edx + 0x18]
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L18
    test cl, cl
    je L19
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L18
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L20
    xor eax, eax
    jmp L21
    mov edi, dword ptr [ebp - 8]
    and dword ptr [ebp - 4], 0
    test edi, edi
    mov dword ptr [ebp + 8], 1
    je L22
    mov eax, dword ptr [edi + 0x18]
    mov esi, dword ptr [edx + 0x18]
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [eax]
    jne L23
    test cl, cl
    je L24
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [eax + 1]
    jne L23
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L25
    xor eax, eax
    jmp L26
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    je L27
    mov edi, dword ptr [edi + 0xc]
    inc dword ptr [ebp + 8]
    test edi, edi
    jne L28
    jmp L29
    mov dword ptr [ebp - 4], 1
    mov ecx, dword ptr [ebp + 0xc]
    mov edi, dword ptr [ebp - 0xc]
    jmp L30
    mov eax, dword ptr [edi + 0x18]
    mov esi, dword ptr [ecx + 0x18]
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [eax]
    jne L31
    test cl, cl
    je L32
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [eax + 1]
    jne L31
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L33
    xor eax, eax
    jmp L34
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    mov ecx, dword ptr [ebp + 0xc]
    je L35
    mov edi, dword ptr [edi + 0xc]
    dec dword ptr [ebp + 8]
    test edi, edi
    jne L36
    jmp L37
    mov dword ptr [ebp - 4], 1
    cmp dword ptr [ebp - 4], 0
    je L38
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    sete al
    jmp L15
    mov esi, dword ptr [ecx + 0x18]
    mov eax, dword ptr [edx + 0x18]
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L18
    test cl, cl
    je L19
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L18
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L39
    jmp L19
    sbb eax, eax
    sbb eax, -1
    xor ecx, ecx
    test eax, eax
    sete cl
    mov eax, ecx
    mov ecx, dword ptr [ebp + 0xc]
    test eax, eax
    je L9
    mov edx, dword ptr [edx + 0xc]
    mov ecx, dword ptr [ecx + 0xc]
    test edx, edx
    mov dword ptr [ebp + 0xc], ecx
    jne L40
    jmp L41
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    }
}
