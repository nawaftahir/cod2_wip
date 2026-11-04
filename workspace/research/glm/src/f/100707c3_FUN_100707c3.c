extern int c_10000000;
extern int c_10300000;
extern int c_10500000;
extern int c_10600000;
extern int c_10700000;
extern int g_1010f780;
extern int g_1019bc88;
extern int g_1019be20;
extern int g_1019beb0;
extern void sub_1006c566(void);
extern void sub_1006e16c(void);
extern void sub_1006e308(void);
extern void sub_100f7865(void);
extern void sub_100f786a(void);
extern void sub_100f916c(void);

__declspec(naked) void FUN_100707c3(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x18
    push ebx
    push esi
    xor eax, eax
    push edi
    mov edi, dword ptr [ebp + 0x18]
    xor esi, esi
    inc eax
    cmp esi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 0xc], eax
    jae L0
    lea eax, [ebp - 0x18]
    push eax
    mov eax, dword ptr [ebp + 0x10]
    push dword ptr [eax + esi*4]
    mov ecx, ebx
    call sub_1006e16c
    test eax, eax
    jl L1
    fld qword ptr g_1019be20
    fld qword ptr [ebp - 0x18]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L2
    and dword ptr [ebp - 8], 0
    fld qword ptr g_1019bc88
    fld qword ptr [ebp - 0x18]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L3
    and dword ptr [ebp - 0xc], 0
    inc esi
    cmp esi, edi
    jb L4
    xor eax, eax
    inc eax
    cmp esi, edi
    jne L5
    cmp dword ptr [ebp - 8], 0
    jne L6
    cmp dword ptr [ebp - 0xc], 0
    je L5
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100f786a
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 4], edx
    je L7
    xor ecx, ecx
    test edi, edi
    jbe L8
    cmp dword ptr [ebp - 8], 0
    je L9
    mov eax, dword ptr [ebx + 0x24]
    jmp L10
    mov eax, dword ptr [ebx + 0x20]
    mov dword ptr [edx + ecx*4], eax
    inc ecx
    cmp ecx, edi
    jb L11
    push edi
    push dword ptr [ebp + 0xc]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    test esi, esi
    jl L12
    push 0
    push 0
    and edi, 0xfffff
    push edx
    or edi, c_10000000
    jmp L13
    cmp eax, edi
    mov ecx, dword ptr [ebp + 0x14]
    jae L14
    mov edx, dword ptr [ecx]
    cmp edx, dword ptr [ecx + eax*4]
    jne L15
    inc eax
    cmp eax, edi
    jb L16
    cmp eax, edi
    jne L17
    lea eax, [ebp - 0x10]
    push eax
    push dword ptr [ecx]
    mov ecx, ebx
    call sub_1006e16c
    test eax, eax
    jl L17
    fld qword ptr [ebp - 0x10]
    call sub_100f916c
    mov dword ptr [ebp - 8], eax
    fild dword ptr [ebp - 8]
    fsubr qword ptr [ebp - 0x10]
    fabs
    fcomp qword ptr g_1010f780
    fnstsw ax
    test ah, 5
    jp L18
    mov eax, dword ptr [ebp - 8]
    cdq
    push 0
    xor eax, edx
    pop ecx
    sub eax, edx
    push ecx
    mov dword ptr [ebp + 0x18], eax
    pop edx
    je L19
    mov esi, eax
    and esi, 1
    inc ecx
    add edx, esi
    shr eax, 1
    jne L20
    mov eax, edx
    dec edx
    neg eax
    sbb eax, eax
    and eax, edx
    mov edx, ecx
    dec ecx
    neg edx
    sbb edx, edx
    and edx, ecx
    add eax, edx
    cmp dword ptr [ebp - 8], 0
    jge L21
    add eax, edi
    mov ecx, dword ptr [ebx + 8]
    test byte ptr [ecx + 0x6c], 0x40
    je L22
    test byte ptr [ebx + 0x14], 0x20
    je L22
    lea ecx, [edi + 1]
    jmp L23
    mov ecx, dword ptr [ecx + 0x64]
    test ecx, ecx
    jne L24
    inc ecx
    imul ecx, edi
    lea ecx, [ecx + ecx + 1]
    cmp eax, ecx
    ja L17
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100f786a
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L7
    xor eax, eax
    test edi, edi
    jbe L25
    mov ecx, dword ptr [ebx + 0x20]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, edi
    jb L26
    push edi
    push dword ptr [ebp + 0xc]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    test esi, esi
    jl L12
    push 0
    push 0
    push dword ptr [ebp - 4]
    mov eax, edi
    push dword ptr [ebp + 0xc]
    and eax, 0xfffff
    mov dword ptr [ebp + 0x14], eax
    or byte ptr [ebp + 0x17], 0x10
    push dword ptr [ebp + 0x14]
    mov ecx, ebx
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 0xc], eax
    call sub_1006e308
    mov esi, eax
    xor edx, edx
    cmp esi, edx
    jl L12
    cmp dword ptr [ebp + 0x18], edx
    je L27
    push edi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    cmp esi, edx
    jl L12
    push edx
    push edx
    push dword ptr [ebp + 0x10]
    mov ecx, ebx
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 8]
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jl L12
    mov edi, 0x20500000
    test byte ptr [ebp + 0x18], 1
    je L28
    mov eax, dword ptr [ebp - 0xc]
    push 0
    push dword ptr [ebp - 4]
    or eax, edi
    push dword ptr [ebp + 0xc]
    mov ecx, ebx
    push dword ptr [ebp + 0xc]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jl L12
    shr dword ptr [ebp + 0x18], 1
    je L27
    mov eax, dword ptr [ebp - 0xc]
    push 4
    push dword ptr [ebp - 4]
    or eax, edi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jge L29
    jmp L12
    xor eax, eax
    cmp dword ptr [ebp - 8], eax
    jge L30
    push eax
    push eax
    push dword ptr [ebp + 0xc]
    mov eax, dword ptr [ebp - 0xc]
    push dword ptr [ebp + 0xc]
    or eax, c_10300000
    push eax
    jmp L31
    fld qword ptr [ebp - 0x10]
    fabs
    fsub qword ptr g_1019beb0
    fabs
    fcomp qword ptr g_1010f780
    fnstsw ax
    test ah, 5
    jp L17
    push edi
    push dword ptr [ebp + 0xc]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    test esi, esi
    jl L12
    push 4
    push 0
    push dword ptr [ebp + 0x10]
    and edi, 0xfffff
    push dword ptr [ebp + 0xc]
    mov eax, edi
    or eax, c_10700000
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jl L12
    fld qword ptr [ebp - 0x10]
    fcomp qword ptr g_1019be20
    fnstsw ax
    test ah, 1
    jne L30
    push 4
    push 0
    push dword ptr [ebp + 0xc]
    or edi, c_10300000
    jmp L13
    mov eax, edi
    shl eax, 3
    push eax
    call sub_100f786a
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    jne L32
    mov esi, 0x8007000e
    jmp L12
    mov edx, dword ptr [ebp - 4]
    mov ecx, edi
    xor eax, eax
    shl ecx, 2
    mov dword ptr [ebp + eax*4 - 0x10], edx
    inc eax
    add edx, ecx
    cmp eax, 2
    jb L33
    push edi
    push dword ptr [ebp - 0x10]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    test esi, esi
    jl L12
    push edi
    push dword ptr [ebp - 0xc]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    test esi, esi
    jl L12
    push edi
    push dword ptr [ebp + 0xc]
    mov ecx, ebx
    call sub_1006c566
    mov esi, eax
    test esi, esi
    jl L12
    push 0
    push 0
    push dword ptr [ebp + 0x10]
    and edi, 0xfffff
    push dword ptr [ebp - 0x10]
    mov eax, edi
    or eax, c_10600000
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jl L12
    push 0
    push dword ptr [ebp - 0x10]
    mov eax, edi
    push dword ptr [ebp + 0x14]
    or eax, 0x20500000
    push dword ptr [ebp - 0xc]
    mov ecx, ebx
    push eax
    push dword ptr [ebp + 8]
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jl L12
    push 4
    push 0
    push dword ptr [ebp - 0xc]
    or edi, c_10500000
    push dword ptr [ebp + 0xc]
    push edi
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006e308
    mov esi, eax
    test esi, esi
    jl L12
    xor esi, esi
    push dword ptr [ebp - 4]
    call sub_100f7865
    pop ecx
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 0x14
    }
}
