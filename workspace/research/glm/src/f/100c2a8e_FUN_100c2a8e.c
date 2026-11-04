extern void sub_1006c418(void);
extern void sub_10085379(void);
extern void sub_100853b0(void);
extern void sub_10085814(void);
extern void sub_1008585f(void);
extern void sub_10086139(void);
extern void sub_100f65b0(void);

__declspec(naked) void FUN_100c2a8e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    and dword ptr [ebp - 8], 0
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    mov ecx, dword ptr [edi]
    mov edx, ecx
    mov eax, 0xfffff
    and ecx, eax
    and edx, 0xfff00000
    cmp dword ptr [ebp + 0xc], 0
    mov esi, ecx
    mov dword ptr [ebp - 0x10], edx
    mov dword ptr [ebp - 0xc], esi
    je L0
    cmp edx, 0x10f00000
    je L1
    cmp edx, 0x73500000
    je L2
    cmp edx, 0x73600000
    je L3
    cmp edx, 0x73700000
    je L4
    cmp edx, 0x73800000
    jne L5
    and esi, eax
    or esi, 0x73c00000
    jmp L6
    and esi, eax
    or esi, 0x73b00000
    jmp L6
    and esi, eax
    or esi, 0x73a00000
    jmp L6
    and esi, eax
    or esi, 0x73900000
    jmp L6
    mov edx, dword ptr [ebx + 0x14]
    mov ecx, esi
    and ecx, eax
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 0x10]
    mov edi, dword ptr [edx + eax*4]
    mov esi, ecx
    or esi, 0x73000000
    test word ptr [edi + 4], 0x208
    mov dword ptr [ebp - 4], ecx
    je L7
    mov eax, dword ptr [edi]
    test eax, eax
    je L8
    push 0x69
    push eax
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L9
    push 0x49
    push dword ptr [edi]
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L9
    push 0x62
    push dword ptr [edi]
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L9
    push 0x42
    push dword ptr [edi]
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L9
    test byte ptr [edi + 5], 8
    jne L10
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 8], -1
    je L6
    jmp L7
    mov ecx, dword ptr [ebp - 4]
    or ecx, 0x73b00000
    jmp L11
    cmp edx, 0x10f00000
    je L12
    cmp edx, 0x73500000
    je L13
    cmp edx, 0x73600000
    je L14
    cmp edx, 0x73700000
    je L15
    cmp edx, 0x73800000
    jne L5
    and esi, eax
    or esi, 0x74000000
    jmp L6
    and esi, eax
    or esi, 0x73f00000
    jmp L6
    and esi, eax
    or esi, 0x73e00000
    jmp L6
    and esi, eax
    or esi, 0x73d00000
    jmp L6
    mov edx, dword ptr [ebx + 0x14]
    mov ecx, esi
    and ecx, eax
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 0x10]
    mov edi, dword ptr [edx + eax*4]
    mov esi, ecx
    or esi, 0x73100000
    test word ptr [edi + 4], 0x208
    mov dword ptr [ebp - 4], ecx
    je L16
    mov eax, dword ptr [edi]
    test eax, eax
    je L17
    push 0x69
    push eax
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L18
    push 0x49
    push dword ptr [edi]
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L18
    push 0x62
    push dword ptr [edi]
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L18
    push 0x42
    push dword ptr [edi]
    call sub_100f65b0
    test eax, eax
    pop ecx
    pop ecx
    jne L18
    test byte ptr [edi + 5], 8
    jne L19
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 8], -1
    je L6
    jmp L16
    mov ecx, dword ptr [ebp - 4]
    or ecx, 0x73f00000
    mov esi, ecx
    mov dword ptr [ebp - 8], 1
    push 0x74
    call sub_10085814
    test eax, eax
    je L20
    mov ecx, eax
    call sub_10085379
    mov edi, eax
    mov dword ptr [ebp - 4], edi
    jmp L21
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [ebp - 4]
    xor eax, eax
    cmp edi, eax
    je L5
    cmp dword ptr [ebp - 0x10], 0x10f00000
    jne L22
    cmp dword ptr [ebp - 8], eax
    jne L22
    push eax
    push dword ptr [ebp - 0xc]
    push dword ptr [ebp - 0xc]
    jmp L23
    push eax
    mov eax, dword ptr [ebp - 0xc]
    push eax
    add eax, eax
    push eax
    mov ecx, edi
    push esi
    call sub_1008585f
    test eax, eax
    mov ecx, edi
    jl L24
    mov esi, dword ptr [ebp + 8]
    push esi
    call sub_100853b0
    test eax, eax
    jge L25
    mov ecx, edi
    jmp L24
    xor eax, eax
    cmp dword ptr [ebp + 0xc], eax
    je L26
    mov ecx, dword ptr [esi + 0xc]
    mov esi, dword ptr [esi + 0x10]
    mov edi, dword ptr [edi + 0x10]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp - 4]
    mov esi, dword ptr [ebp + 8]
    jmp L27
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push eax
    push eax
    push dword ptr [ebx + 0xa8]
    mov ecx, ebx
    call sub_10086139
    mov ecx, dword ptr [edi + 0x10]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 0x10]
    cmp dword ptr [eax], -1
    je L5
    mov ecx, dword ptr [edi + 0x10]
    mov eax, dword ptr [ebx + 0x14]
    mov edx, dword ptr [esi + 0x10]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 0x18]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [ecx + 0x14], eax
    mov ecx, dword ptr [esi + 4]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [edi + 8]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    xor eax, eax
    cmp dword ptr [ebp - 8], eax
    rep movsb byte ptr es:[edi], byte ptr [esi]
    je L28
    cmp dword ptr [ebx + 8], eax
    mov dword ptr [ebp + 8], eax
    jbe L29
    mov edx, dword ptr [ebx + 0x10]
    mov ecx, dword ptr [ebx + 0x14]
    mov esi, dword ptr [ebx + 8]
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [eax + 4]
    mov edi, dword ptr [edx + edi*4]
    test byte ptr [edi + 5], 1
    je L30
    mov eax, dword ptr [eax + 0xc]
    cmp eax, dword ptr [ebp + 8]
    jb L30
    inc eax
    mov dword ptr [ebp + 8], eax
    add ecx, 4
    dec esi
    jne L31
    cmp dword ptr [ebx + 0x188], -1
    jne L32
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebp + 8]
    mov ecx, ebx
    push dword ptr [ebx + 0x78]
    call sub_10086139
    mov dword ptr [ebx + 0x188], eax
    mov ebx, dword ptr [ebx + 0x188]
    cmp ebx, -1
    jne L33
    mov ecx, dword ptr [ebp - 4]
    push 1
    call sub_1006c418
    xor eax, eax
    jmp L34
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [eax + 4], ebx
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    }
}
