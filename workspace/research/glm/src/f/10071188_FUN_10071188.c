extern int c_10000001;
extern int c_10100000;
extern int g_1010c728;
extern int g_1019bc88;
extern int g_1019be20;
extern void sub_1006e16c(void);
extern void sub_1007107a(void);

__declspec(naked) void FUN_10071188(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x24
    push ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [ebp + 8]
    push edi
    or ebx, 0xffffffff
    jmp L0
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax + 0x14]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 0x48]
    cmp ecx, ebx
    je L1
    mov eax, dword ptr [eax + 0x18]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi]
    cmp eax, c_10000001
    je L2
    cmp eax, 0x20500001
    jne L3
    lea eax, [ebp - 0x1c]
    push eax
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax]
    mov ecx, esi
    call sub_1006e16c
    test eax, eax
    jl L4
    fld qword ptr [ebp - 0x1c]
    fld qword ptr g_1019bc88
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L4
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + 4]
    jmp L0
    lea eax, [ebp - 0x1c]
    push eax
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax + 4]
    mov ecx, esi
    call sub_1006e16c
    test eax, eax
    jl L1
    fld qword ptr [ebp - 0x1c]
    fld qword ptr g_1019bc88
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax]
    cmp ecx, ebx
    jne L5
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
    mov eax, dword ptr [edi]
    cmp eax, 0x20200001
    jne L6
    lea eax, [ebp - 0x1c]
    push eax
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax]
    mov ecx, esi
    call sub_1006e16c
    test eax, eax
    jl L1
    mov eax, dword ptr [ebp + 0xc]
    fild dword ptr [ebp + 0xc]
    test eax, eax
    jge L7
    fadd qword ptr g_1010c728
    fld qword ptr [ebp - 0x1c]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 4]
    mov dword ptr [ebp + 8], eax
    push 1
    lea eax, [ebp + 8]
    push eax
    push 0
    mov ecx, esi
    call sub_1007107a
    test eax, eax
    jl L1
    mov ebx, dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebx]
    cmp eax, -1
    je L8
    xor ecx, ecx
    cmp dword ptr [ebp + 8], eax
    sete cl
    mov eax, ecx
    jmp L9
    mov esi, dword ptr [esi + 8]
    mov ecx, dword ptr [esi + 0x14]
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + edx*4]
    test byte ptr [eax], 2
    je L1
    mov eax, dword ptr [eax + 4]
    mov esi, dword ptr [esi + 0x10]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    jne L1
    test al, 0x10
    je L1
    test ah, 2
    je L1
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    je L10
    mov esi, dword ptr [edi + 8]
    mov esi, dword ptr [esi]
    mov ecx, dword ptr [ecx + esi*4]
    mov ecx, dword ptr [ecx + 0x30]
    mov dword ptr [eax], ecx
    mov dword ptr [ebx], edx
    xor eax, eax
    inc eax
    jmp L9
    cmp eax, 0x30000001
    jne L1
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax + 0x14]
    mov edi, dword ptr [edi + 8]
    mov ecx, dword ptr [edi + 4]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 0x10]
    mov eax, dword ptr [eax + edx*4]
    mov edx, 0x100
    test dword ptr [eax + 4], edx
    je L1
    cmp dword ptr [ecx + 8], ebx
    jne L1
    fld qword ptr [ecx + 0x20]
    fld qword ptr g_1019be20
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    mov eax, dword ptr [esi + 8]
    mov ebx, dword ptr [eax + 0x14]
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ebx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 0x10]
    mov eax, dword ptr [eax + ebx*4]
    test dword ptr [eax + 4], edx
    je L1
    cmp dword ptr [ecx + 8], -1
    jne L1
    fld qword ptr [ecx + 0x20]
    fld qword ptr g_1019bc88
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 0x14]
    mov edi, dword ptr [edi]
    mov ecx, dword ptr [ecx + edi*4]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 0x10]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 4], 2
    je L1
    cmp dword ptr [ecx + 8], -1
    jne L1
    mov eax, dword ptr [ecx + 0x48]
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + 0x18]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x20400000
    mov dword ptr [ebp - 0x14], ecx
    jne L1
    mov eax, dword ptr [ecx + 0xc]
    and dword ptr [ebp + 8], 0
    test eax, eax
    jbe L11
    mov edx, dword ptr [ecx + 0x10]
    cmp dword ptr [edx], edi
    je L11
    inc dword ptr [ebp + 8]
    add edx, 4
    cmp dword ptr [ebp + 8], eax
    jb L12
    and dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 0x10], 1
    jmp L13
    mov ecx, dword ptr [ebp - 0x14]
    mov eax, dword ptr [ecx + 0xc]
    mov edi, dword ptr [ecx + 8]
    mov ecx, eax
    imul ecx, dword ptr [ebp - 8]
    add ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [esi + 8]
    mov ebx, dword ptr [ecx + 0x14]
    mov ecx, dword ptr [ecx + 0x10]
    mov dword ptr [ebp - 0x18], edx
    mov edx, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [edx + 4]
    mov ecx, dword ptr [ecx + ebx*4]
    test byte ptr [ecx + 4], 2
    je L14
    cmp dword ptr [edx + 8], -1
    jne L14
    mov ecx, dword ptr [edx + 0x48]
    mov edx, dword ptr [esi + 8]
    mov edx, dword ptr [edx + 0x18]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx]
    and edx, 0xfff00000
    cmp edx, c_10100000
    jne L14
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx + 0xc], 0
    jbe L15
    mov edx, dword ptr [ecx + 0x10]
    mov ebx, dword ptr [edx]
    cmp ebx, dword ptr [ebp - 0x18]
    je L15
    inc dword ptr [ebp - 4]
    mov ebx, dword ptr [ecx + 0xc]
    add edx, 4
    cmp dword ptr [ebp - 4], ebx
    jb L16
    imul eax, dword ptr [ebp - 0x10]
    add eax, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + eax*4]
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 4]
    mov ebx, dword ptr [eax + ecx*4]
    lea eax, [ebp - 0x24]
    push eax
    push edi
    mov ecx, esi
    call sub_1006e16c
    test eax, eax
    jl L14
    mov eax, dword ptr [ebp + 0xc]
    fild dword ptr [ebp + 0xc]
    test eax, eax
    jge L17
    fadd qword ptr g_1010c728
    fld qword ptr [ebp - 0x24]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L14
    push 1
    lea eax, [ebp - 0xc]
    push eax
    push 0
    mov ecx, esi
    mov dword ptr [ebp - 0xc], ebx
    call sub_1007107a
    test eax, eax
    jl L14
    mov ebx, dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebx]
    cmp eax, -1
    je L18
    cmp dword ptr [ebp - 0xc], eax
    je L19
    jmp L14
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 0x14]
    mov edx, dword ptr [ebp - 0xc]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx], 2
    je L14
    mov eax, dword ptr [eax + 0x10]
    mov ecx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    jne L14
    test al, 0x10
    je L14
    test ah, 2
    jne L20
    inc dword ptr [ebp - 8]
    dec dword ptr [ebp - 0x10]
    cmp dword ptr [ebp - 8], 2
    jb L21
    jmp L1
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    je L10
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + 0x14]
    mov ecx, dword ptr [ecx + edi*4]
    jmp L22
    }
}
