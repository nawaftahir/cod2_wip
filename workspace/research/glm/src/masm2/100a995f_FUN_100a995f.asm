.686
.MODEL FLAT, C
EXTRN sub_1006C8B9:PROC
EXTRN sub_1006C9D8:PROC
EXTRN sub_100857B3:PROC
EXTRN sub_1008581E:PROC
EXTRN sub_10085C43:PROC
EXTRN sub_10085CBA:PROC
EXTRN sub_100AA02A:PROC
EXTRN sub_100AA036:PROC
EXTRN sub_100AA062:PROC
EXTRN sub_100AA066:PROC
EXTRN sub_100AA076:PROC
EXTRN sub_100AA07E:PROC
EXTRN sub_100AA081:PROC
EXTRN sub_100AA08B:PROC
EXTRN sub_100AA099:PROC
EXTRN sub_100AA09E:PROC
EXTRN sub_100AA1D1:PROC
EXTRN sub_100AA1E1:PROC
EXTRN sub_100AA23C:PROC
EXTRN sub_100AA2EF:PROC
EXTRN sub_100AA2F8:PROC
EXTRN sub_100AA312:PROC
EXTRN sub_100AA315:PROC
EXTRN sub_100AA31A:PROC
EXTRN sub_100AA357:PROC
EXTRN sub_100AA37B:PROC
EXTRN sub_100AA391:PROC
EXTRN sub_100AA3A7:PROC
EXTRN sub_100AA3AD:PROC
EXTRN sub_100AA3EE:PROC
EXTRN sub_100AA3FD:PROC
EXTRN sub_100AA41B:PROC
EXTRN sub_100AA41F:PROC
EXTRN sub_100AA429:PROC
EXTRN sub_100AA4D2:PROC
EXTRN EXTRN g_1010F7A8:DWORD:DWORD
EXTRN EXTRN g_1010F850:DWORD:DWORD
EXTRN EXTRN g_10116D10:DWORD:DWORD
EXTRN EXTRN g_10116D18:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD48:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_1019BEB0:DWORD:DWORD
.CODE
FUN_100a995f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 090h
    and and dword ptr [ebp - 28], 0
    and and dword ptr [ebp - 16], 0
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ebx + 20]
    push push esi
    mov mov esi, dword ptr [eax]
    mov mov eax, dword ptr [eax + 8]
    and and esi, 0FFFFFh
    push push edi
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [ecx + edi*4]
    lea lea edx, [eax + esi*4]
    mov mov dword ptr [ebp - 8], edx
    mov mov edx, dword ptr [edx]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [ebp - 24], edi
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [edi + edx*4]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [ebx + 088h]
    cmp cmp edx, ecx
    jne L0
    mov mov edx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [edx + 4]
    mov mov edx, dword ptr [edi + edx*4]
    test test byte ptr [edx + 5], 1
    je L1
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [edx]
    and and edx, 0FFF00000h
    cmp cmp edx, 020500000h
    jne L2
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    fld fld qword ptr [ecx + 32]
    and and dword ptr [ebp - 4], 0
    fstp fstp dword ptr [ebp - 36]
    test test esi, esi
    jbe L16
    mov mov edx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ebx + 20]
    sub sub edx, eax
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 24], edx
    mov mov eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + edx]
    mov mov eax, dword ptr [ecx + eax*4]
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 16], edi
    je L8
    mov mov dword ptr [ebp - 12], edi
    jmp L9
    mov mov edx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [edx + 4]
    cmp cmp edx, ecx
    jne L4
    mov mov edi, dword ptr [ebp - 12]
    test test byte ptr [edi + 5], 1
    je L5
    mov mov edi, dword ptr [ebx + 0100h]
    mov mov edi, dword ptr [edi]
    and and edi, 0FFF00000h
    cmp cmp edi, 020500000h
    jne L6
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 20], ecx
    jmp L3
    mov mov edi, dword ptr [ebp - 24]
    cmp cmp dword ptr [edi + 4], ecx
    jne L13
    cmp cmp edx, ecx
    jne L14
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ecx]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 020400000h
    jne L15
    test test esi, esi
    mov mov dword ptr [ebp - 16], 1
    jbe L10
    mov mov edx, dword ptr [ebp - 8]
    mov mov ecx, eax
    sub sub edx, eax
    mov mov dword ptr [ebp - 12], esi
    mov mov edi, dword ptr [ecx]
    cmp cmp edi, dword ptr [edx + ecx]
    je L11
    and and dword ptr [ebp - 16], 0
    add add ecx, 4
    dec dec dword ptr [ebp - 12]
    jne L12
    mov mov ecx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ecx + 60]
    mov mov edx, dword ptr [ebp - 20]
    cmp cmp ecx, dword ptr [edx + 60]
    jne L19
    mov mov edx, 080000h
    cmp cmp ecx, edx
    jne L18
    fld fld dword ptr [g_1019BDA0]
    jmp L20
    test test edx, ecx
    jne L21
    fld1 fld1
    cmp cmp dword ptr [ebp - 16], 0
    mov mov dword ptr [ebp - 20], eax
    jne L22
    fstp fstp st(0)
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, dword ptr [ebp - 40]
    fadd fadd st(0), st(0)
    jmp L7
    mov mov edx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ebx + 0FCh]
    cmp cmp dword ptr [eax + 88], edx
    jne L23
    cmp cmp dword ptr [eax + 84], edx
    jne L24
    test test dword ptr [eax + 60], 01FFE00h
    jne L25
    cmp cmp dword ptr [ebp - 28], 0
    jbe L27
    mov mov edx, dword ptr [eax + 72]
    cmp cmp edx, dword ptr [ebp + edi*4 - 64]
    je L28
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 28]
    jb L27
    cmp cmp edi, dword ptr [ebp - 28]
    jne L29
    mov mov edx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 72]
    inc inc dword ptr [ebp - 28]
    mov mov dword ptr [ebp + edx*4 - 64], eax
    cmp cmp dword ptr [ebp - 16], 0
    jne L30
L5:
    mov mov eax, dword ptr [ebp - 12]
    fld fld qword ptr [eax + 32]
    fld fld st(0)
    fld fld dword ptr [ebp - 36]
    fucompp fucompp
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    jp L26
L6:
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp - 4], esi
    jb L17
    fld fld dword ptr [ebp - 36]
    fabs fabs
    fld fld st(0)
    fabs fabs
    fld fld qword ptr [g_1010F7A8]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L33
    mov mov eax, 0400h
    test test dword ptr [ebx + 108], eax
    jne L38
    fld fld qword ptr [g_10116D18]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L34
    mov mov eax, 0800h
    test test dword ptr [ebx + 108], eax
    jne L39
    fld fld qword ptr [g_1019BD48]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L37
    mov mov eax, 01000h
    test test dword ptr [ebx + 108], eax
    jne L41
    fld fld qword ptr [g_1019BEB0]
L9:
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L40
    mov mov eax, 02000h
    test test dword ptr [ebx + 108], eax
    jne L42
    fld fld qword ptr [g_1010F850]
L12:
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L43
    mov mov eax, 04000h
    test test dword ptr [ebx + 108], eax
    je L44
    fstp fstp st(0)
    jmp L45
    fld fld qword ptr [g_10116D10]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    jp L31
    mov mov eax, 08000h
    test test dword ptr [ebx + 108], eax
    je L32
    fld fld dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 16], eax
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp L47
L19:
    or or byte ptr [ebp - 14], 8
    xor xor eax, eax
L20:
    lea lea edi, [ebp - 80]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 8], eax
L21:
    jbe sub_100AA02A
    lea lea ecx, [ebp - 090h]
    mov mov dword ptr [ebp - 24], ecx
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp + eax*4 - 64]
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ecx]
    mov mov edx, eax
    and and edx, 0F0000000h
    cmp cmp edx, 060000000h
    je L35
L23:
    and and eax, 0FF000000h
L24:
    cmp cmp eax, 072000000h
    je L36
    mov mov edi, dword ptr [ebp - 24]
    and and dword ptr [ebp - 32], 0
    and and dword ptr [ebp - 4], 0
    mov mov edx, dword ptr [ecx + 12]
    or or eax, -1
    test test esi, esi
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jbe sub_100AA066
    and and dword ptr [ebp - 44], 0
    test test edx, edx
    jbe sub_100AA062
    mov mov eax, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [ebp - 48], eax
    lea lea edi, [ebp + edi - 090h]
L26:
    mov mov eax, dword ptr [ebp - 40]
    mov mov edx, dword ptr [ebp - 48]
    cmp cmp dword ptr [edx], eax
    jne sub_100AA076
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 4]
    lea lea edx, [ebp + edx*4 - 80]
    inc inc dword ptr [edx]
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [edx + 16]
    mov mov dword ptr [edi], eax
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 61], 2
    je sub_100AA099
    fld fld dword ptr [ebp - 36]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L44
    inc inc dword ptr [ebp - 32]
    inc inc dword ptr [ebp - 44]
    mov mov edx, dword ptr [ecx + 12]
    add add dword ptr [ebp - 48], 4
    add add edi, 4
    cmp cmp dword ptr [ebp - 44], edx
    jb sub_100AA07E
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], esi
    jb sub_100AA066
    cmp cmp dword ptr [ebp - 32], edx
    jne L46
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 24], 16
    add add dword ptr [ebp - 12], 16
    cmp cmp eax, dword ptr [ebp - 28]
    jb sub_100AA036
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 28], 0
    jbe sub_100AA2EF
    lea lea eax, [ebp - 090h]
    mov mov dword ptr [ebp - 24], eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebx + 24]
    shl shl ecx, 2
    mov mov eax, dword ptr [ebp + ecx - 64]
    mov mov esi, dword ptr [ebp + ecx - 80]
    shl shl eax, 2
    mov mov edi, dword ptr [eax + edx]
    cmp cmp esi, dword ptr [edi + 12]
    mov mov dword ptr [ebp - 40], eax
L31:
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 32], esi
    je sub_100AA23C
    push push 116
L32:
    call sub_10085C43
    test test eax, eax
    je sub_100AA1D1
    mov mov ecx, eax
    call sub_100857B3
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100AA1E1
    and and dword ptr [ebp - 4], 0
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    je sub_100AA357
    push push 0
    push push esi
    push push dword ptr [edi + 4]
    push push dword ptr [edi]
    call sub_10085CBA
    mov mov ecx, dword ptr [ebp - 4]
    mov mov esi, eax
    test test esi, esi
    jl sub_100AA37B
    push push edi
    call sub_1008581E
    mov mov esi, eax
    test test esi, esi
    push push 1
    jl sub_100AA391
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edx + 8]
    mov mov esi, dword ptr [eax + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, eax
    call sub_1006C8B9
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [ebp - 40]
    mov mov esi, dword ptr [ebp - 32]
    mov mov dword ptr [edx + ecx], eax
    mov mov dword ptr [ebp - 12], eax
    mov mov edi, eax
    and and dword ptr [ebp - 4], 0
    test test esi, esi
    jbe sub_100AA3A7
    mov mov eax, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 12], eax
L39:
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp edx, 4
    mov mov eax, edx
    jae sub_100AA312
    mov mov ecx, dword ptr [ebp - 12]
    cmp cmp dword ptr [ecx], -1
    jne sub_100AA31A
    inc inc eax
    add add ecx, 4
    cmp cmp eax, 4
    jb sub_100AA315
L41:
    mov mov esi, dword ptr [edi + 16]
    and and dword ptr [ebp - 20], 0
    mov mov ecx, eax
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 16]
    shl shl ecx, 2
    mov mov eax, dword ptr [ecx + eax]
    mov mov dword ptr [esi + edx*4], eax
L42:
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebp - 16]
L43:
    or or dword ptr [eax + 60], edx
    cmp cmp dword ptr [ebx + 8], 0
    jbe sub_100AA3EE
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebp - 20]
    mov mov esi, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [esi + 56]
    cmp cmp edx, dword ptr [ecx + eax]
    jne sub_100AA3FD
    fld fld dword ptr [ebp - 36]
    mov mov eax, dword ptr [ebp - 16]
    fcomp fcomp dword ptr [g_1019BC84]
    and and eax, 0FFF7FFFFh
L46:
    or or dword ptr [esi + 60], eax
    mov mov edx, dword ptr [esi + 60]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100AA41B
    mov mov eax, 080000h
    test test eax, edx
    je sub_100AA41F
    and and edx, 0FFF7FFFFh
    jmp sub_100AA429
    or or edx, eax
    mov mov dword ptr [esi + 60], edx
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebx + 8]
    jb sub_100AA3EE
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp - 12], 4
    cmp cmp eax, dword ptr [ebp - 32]
    jb sub_100AA3AD
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 24], 16
    cmp cmp eax, dword ptr [ebp - 28]
L47:
    jb sub_100AA2F8
    mov mov eax, dword ptr [ebx + 0100h]
    and and dword ptr [eax], 0
    xor xor eax, eax
    jmp sub_100AA081
    mov mov eax, 08007000Eh
    jmp sub_100AA08B
    push push 1
    jmp sub_100AA4D2
    mov mov ecx, dword ptr [ebp - 4]
    call sub_1006C9D8
    mov mov eax, esi
    jmp sub_100AA09E
FUN_100a995f ENDP
END
