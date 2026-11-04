extern int g_1076ac68;
extern int g_1076ac6c;
extern void (__stdcall *fp_1010c0dc)(void);

__declspec(naked) void ___sbh_heap_check(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x138
    mov eax, dword ptr g_1076ac68
    lea eax, [eax + eax*4]
    shl eax, 2
    push eax
    push dword ptr g_1076ac6c
    call fp_1010c0dc
    test eax, eax
    je L0
    or eax, 0xffffffff
    leave
    ret
    push ebx
    mov ebx, dword ptr g_1076ac6c
    push esi
    push edi
    xor edi, edi
    cmp dword ptr g_1076ac68, edi
    mov dword ptr [ebp - 0x34], ebx
    mov dword ptr [ebp - 0x1c], edi
    jg L1
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    xor edi, edi
    mov esi, dword ptr [ebx + 0x10]
    push 0x41c4
    push esi
    call fp_1010c0dc
    test eax, eax
    jne L2
    mov eax, dword ptr [ebx + 0xc]
    mov dword ptr [ebp - 8], eax
    lea eax, [esi + 0x144]
    mov dword ptr [ebp - 0x24], eax
    mov eax, dword ptr [ebx + 8]
    add esi, 0xc4
    mov dword ptr [ebp - 0x20], eax
    mov dword ptr [ebp - 0x10], edi
    mov dword ptr [ebp - 0x14], edi
    mov dword ptr [ebp - 0xc], edi
    mov dword ptr [ebp - 0x38], esi
    jmp L3
    xor edi, edi
    mov dword ptr [ebp - 0x28], edi
    mov dword ptr [ebp - 0x18], edi
    mov dword ptr [ebp - 4], edi
    push 0x40
    xor eax, eax
    cmp dword ptr [ebp - 0x20], eax
    pop ecx
    lea edi, [ebp - 0x138]
    rep stosd dword ptr es:[edi], eax
    jl L4
    push 0x8000
    push dword ptr [ebp - 8]
    call fp_1010c0dc
    test eax, eax
    jne L5
    mov edx, dword ptr [ebp - 8]
    xor ebx, ebx
    add edx, 0xffc
    cmp dword ptr [edx - 0xff4], -1
    lea esi, [edx - 0xff0]
    jne L6
    cmp dword ptr [edx], -1
    jne L6
    mov ecx, dword ptr [esi]
    test cl, 1
    mov edi, ecx
    je L7
    dec ecx
    cmp ecx, 0x400
    jg L8
    inc dword ptr [ebp - 4]
    jmp L9
    mov eax, ecx
    sar eax, 4
    dec eax
    cmp eax, 0x3f
    jle L10
    push 0x3f
    pop eax
    lea eax, [ebp + eax*4 - 0x138]
    inc dword ptr [eax]
    cmp ecx, 0x10
    jl L11
    test cl, 0xf
    jne L11
    cmp ecx, 0xff0
    jg L11
    lea eax, [ecx + esi]
    cmp dword ptr [eax - 4], edi
    jne L12
    mov esi, eax
    cmp esi, edx
    jb L13
    jne L12
    add edx, 0x1000
    inc ebx
    cmp ebx, 8
    jl L14
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 0x24]
    cmp dword ptr [edi], eax
    jne L15
    xor esi, esi
    and dword ptr [ebp - 4], 0
    lea ebx, [edi + 8]
    mov eax, dword ptr [ebx - 4]
    cmp eax, edi
    mov dword ptr [ebp - 0x2c], edi
    mov dword ptr [ebp - 0x30], ebx
    je L16
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [ebp + esi*4 - 0x138]
    je L17
    mov ecx, dword ptr [ebp - 8]
    cmp eax, ecx
    jb L18
    add ecx, 0x8000
    cmp eax, ecx
    jae L18
    mov ecx, eax
    and ecx, 0xfffff000
    add ecx, 0xc
    lea edx, [ecx + 0xff0]
    cmp ecx, edx
    je L19
    cmp ecx, eax
    je L20
    mov ebx, dword ptr [ecx]
    and ebx, 0xfffffffe
    add ecx, ebx
    cmp ecx, edx
    mov ebx, dword ptr [ebp - 0x30]
    jne L21
    cmp ecx, edx
    je L19
    mov ecx, dword ptr [eax]
    sar ecx, 4
    dec ecx
    cmp ecx, 0x3f
    jle L22
    push 0x3f
    pop ecx
    cmp ecx, esi
    jne L23
    mov ecx, dword ptr [ebp - 0x2c]
    cmp dword ptr [eax + 8], ecx
    jne L24
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp - 0x2c], eax
    mov eax, dword ptr [eax + 4]
    cmp eax, edi
    jne L25
    cmp dword ptr [ebp - 4], 0
    je L16
    cmp esi, 0x20
    mov eax, 0x80000000
    jge L26
    mov ecx, esi
    shr eax, cl
    or dword ptr [ebp - 0x28], eax
    or dword ptr [ebp - 0x10], eax
    jmp L16
    lea ecx, [esi - 0x20]
    shr eax, cl
    or dword ptr [ebp - 0x18], eax
    or dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [ebp - 0x2c]
    cmp dword ptr [eax + 4], edi
    jne L27
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [ebp + esi*4 - 0x138]
    jne L27
    cmp dword ptr [ebx], eax
    jne L28
    inc esi
    cmp esi, 0x40
    mov edi, ebx
    jl L29
    mov esi, dword ptr [ebp - 0x38]
    mov ebx, dword ptr [ebp - 0x34]
    mov eax, dword ptr [ebp - 0x28]
    cmp eax, dword ptr [esi - 0x80]
    jne L30
    mov eax, dword ptr [ebp - 0x18]
    cmp eax, dword ptr [esi]
    jne L30
    add dword ptr [ebp - 8], 0x8000
    add dword ptr [ebp - 0x24], 0x204
    shl dword ptr [ebp - 0x20], 1
    inc dword ptr [ebp - 0xc]
    add esi, 4
    cmp dword ptr [ebp - 0xc], 0x20
    mov dword ptr [ebp - 0x38], esi
    jl L31
    mov eax, dword ptr [ebp - 0x10]
    cmp eax, dword ptr [ebx]
    jne L32
    mov eax, dword ptr [ebp - 0x14]
    cmp eax, dword ptr [ebx + 4]
    jne L32
    add ebx, 0x14
    inc dword ptr [ebp - 0x1c]
    mov eax, dword ptr [ebp - 0x1c]
    cmp eax, dword ptr g_1076ac68
    mov dword ptr [ebp - 0x34], ebx
    jl L33
    jmp L34
    push -2
    pop eax
    jmp L35
    push -4
    jmp L36
    push -6
    jmp L36
    push -8
    jmp L36
    push -7
    jmp L36
    push -5
    jmp L36
    push -9
    jmp L36
    push -0xb
    jmp L36
    push -0xc
    jmp L36
    push -0xd
    jmp L36
    push -0xa
    jmp L36
    push -0xf
    jmp L36
    push -0xe
    jmp L36
    push -0x10
    jmp L36
    push -0x11
    jmp L36
    }
}
