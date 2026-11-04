.686
.MODEL FLAT, C
EXTRN sub_1006C8B9:PROC
EXTRN sub_1006C9D8:PROC
EXTRN sub_100857B3:PROC
EXTRN sub_1008581E:PROC
EXTRN sub_10085C43:PROC
EXTRN sub_10085CBA:PROC
EXTRN g_1010F7A8:DWORD
EXTRN g_1010F850:DWORD
EXTRN g_10116D10:DWORD
EXTRN g_10116D18:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD48:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_1019BEB0:DWORD
.CODE
FUN_100a995f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000090h
    and dword ptr [ebp - 28], 0
    and dword ptr [ebp - 16], 0
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebx + 20]
    push esi
    mov esi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    and esi, 0000FFFFFh
    push edi
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    lea edx, [eax + esi*4]
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edi + 4]
    mov dword ptr [ebp - 24], edi
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [edi + edx*4]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [ebx + 000000088h]
    cmp edx, ecx
    jne L3
    mov edx, dword ptr [ebp - 20]
    mov edx, dword ptr [edx + 4]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 5], 1
    je L3
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx]
    and edx, 0FFF00000h
    cmp edx, 020500000h
    jne L3
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 8]
L0:
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx*4]
    fld qword ptr [ecx + 32]
L1:
    and dword ptr [ebp - 4], 0
    fstp dword ptr [ebp - 36]
    test esi, esi
    jbe L19
    mov edx, dword ptr [ebp - 20]
    mov ecx, dword ptr [ebx + 20]
    sub edx, eax
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 24], edx
L2:
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + edx]
    mov eax, dword ptr [ecx + eax*4]
    xor edi, edi
    cmp dword ptr [ebp - 16], edi
    je L13
    mov dword ptr [ebp - 12], edi
    jmp L14
L3:
    mov edx, dword ptr [ebp - 20]
    mov edx, dword ptr [edx + 4]
    cmp edx, ecx
    jne L4
    mov edi, dword ptr [ebp - 12]
    test byte ptr [edi + 5], 1
    je L4
    mov edi, dword ptr [ebx + 000000100h]
    mov edi, dword ptr [edi]
    and edi, 0FFF00000h
    cmp edi, 020500000h
    jne L4
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 20], ecx
    jmp L0
L4:
    mov edi, dword ptr [ebp - 24]
    cmp dword ptr [edi + 4], ecx
    jne L10
    cmp edx, ecx
    jne L10
    mov ecx, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ecx]
    and ecx, 0FFF00000h
    cmp ecx, 020400000h
    jne L10
    test esi, esi
    mov dword ptr [ebp - 16], 1
    jbe L7
    mov edx, dword ptr [ebp - 8]
    mov ecx, eax
    sub edx, eax
    mov dword ptr [ebp - 12], esi
L5:
    mov edi, dword ptr [ecx]
    cmp edi, dword ptr [edx + ecx]
    je L6
    and dword ptr [ebp - 16], 0
L6:
    add ecx, 4
    dec dword ptr [ebp - 12]
    jne L5
L7:
    mov ecx, dword ptr [ebp - 24]
    mov ecx, dword ptr [ecx + 60]
    mov edx, dword ptr [ebp - 20]
    cmp ecx, dword ptr [edx + 60]
    jne L10
    mov edx, 000080000h
    cmp ecx, edx
    jne L8
    fld dword ptr [g_1019BDA0]
    jmp L9
L8:
    test edx, ecx
    jne L10
    fld1
L9:
    cmp dword ptr [ebp - 16], 0
    mov dword ptr [ebp - 20], eax
    jne L12
    fstp st(0)
L10:
    xor eax, eax
    inc eax
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L12:
    mov eax, dword ptr [ebp - 40]
    fadd st(0), st(0)
    jmp L1
L13:
    mov edx, dword ptr [ebp - 8]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [ecx + edx*4]
    mov dword ptr [ebp - 12], edx
L14:
    mov edx, dword ptr [ebx + 0000000FCh]
    cmp dword ptr [eax + 88], edx
    jne L10
    cmp dword ptr [eax + 84], edx
    jne L10
    test dword ptr [eax + 60], 0001FFE00h
    jne L10
    cmp dword ptr [ebp - 28], 0
    jbe L16
L15:
    mov edx, dword ptr [eax + 72]
    cmp edx, dword ptr [ebp + edi*4 - 64]
    je L16
    inc edi
    cmp edi, dword ptr [ebp - 28]
    jb L15
L16:
    cmp edi, dword ptr [ebp - 28]
    jne L17
    mov edx, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 72]
    inc dword ptr [ebp - 28]
    mov dword ptr [ebp + edx*4 - 64], eax
L17:
    cmp dword ptr [ebp - 16], 0
    jne L18
    mov eax, dword ptr [ebp - 12]
    fld qword ptr [eax + 32]
    fld st(0)
    fld dword ptr [ebp - 36]
    fucompp
    fnstsw ax
    fstp st(0)
    test ah, 68
    jp L10
L18:
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 4], esi
    jb L2
L19:
    fld dword ptr [ebp - 36]
    fabs
    fld st(0)
    fabs
    fld qword ptr [g_1010F7A8]
    fucompp
    fnstsw ax
    test ah, 68
    jp L20
    mov eax, 000000400h
    test dword ptr [ebx + 108], eax
    jne L24
L20:
    fld qword ptr [g_10116D18]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    mov eax, 000000800h
    test dword ptr [ebx + 108], eax
    jne L24
L21:
    fld qword ptr [g_1019BD48]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L22
    mov eax, 000001000h
    test dword ptr [ebx + 108], eax
    jne L24
L22:
    fld qword ptr [g_1019BEB0]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L23
    mov eax, 000002000h
    test dword ptr [ebx + 108], eax
    jne L24
L23:
    fld qword ptr [g_1010F850]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L25
    mov eax, 000004000h
    test dword ptr [ebx + 108], eax
    je L25
L24:
    fstp st(0)
    jmp L26
L25:
    fld qword ptr [g_10116D10]
    fld st(1)
    fucompp
    fnstsw ax
    fstp st(0)
    test ah, 68
    jp L10
    mov eax, 000008000h
    test dword ptr [ebx + 108], eax
    je L10
L26:
    fld dword ptr [ebp - 36]
    mov dword ptr [ebp - 16], eax
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L27
    or byte ptr [ebp - 14], 8
L27:
    xor eax, eax
    lea edi, [ebp - 80]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    cmp dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 8], eax
    jbe L35
    lea ecx, [ebp - 000000090h]
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [ebp - 12], eax
L28:
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp + eax*4 - 64]
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx]
    mov edx, eax
    and edx, 0F0000000h
    cmp edx, 060000000h
    je L10
    and eax, 0FF000000h
    cmp eax, 072000000h
    je L10
    mov edi, dword ptr [ebp - 24]
    and dword ptr [ebp - 32], 0
    and dword ptr [ebp - 4], 0
    mov edx, dword ptr [ecx + 12]
    or eax, 0FFFFFFFFh
    test esi, esi
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jbe L34
L29:
    and dword ptr [ebp - 44], 0
    test edx, edx
    jbe L33
    mov eax, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [ebp - 12]
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [ebp - 48], eax
    lea edi, [ebp + edi - 000000090h]
L30:
    mov eax, dword ptr [ebp - 40]
    mov edx, dword ptr [ebp - 48]
    cmp dword ptr [edx], eax
    jne L32
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 4]
    lea edx, [ebp + edx*4 - 80]
    inc dword ptr [edx]
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [edi], eax
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 61], 2
    je L31
    fld dword ptr [ebp - 36]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jnp L10
L31:
    inc dword ptr [ebp - 32]
L32:
    inc dword ptr [ebp - 44]
    mov edx, dword ptr [ecx + 12]
    add dword ptr [ebp - 48], 4
    add edi, 4
    cmp dword ptr [ebp - 44], edx
    jb L30
L33:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], esi
    jb L29
L34:
    cmp dword ptr [ebp - 32], edx
    jne L10
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 24], 16
    add dword ptr [ebp - 12], 16
    cmp eax, dword ptr [ebp - 28]
    jb L28
L35:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 28], 0
    jbe L49
    lea eax, [ebp - 000000090h]
    mov dword ptr [ebp - 24], eax
L36:
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ebx + 24]
    shl ecx, 2
    mov eax, dword ptr [ebp + ecx - 64]
    mov esi, dword ptr [ebp + ecx - 80]
    shl eax, 2
    mov edi, dword ptr [eax + edx]
    cmp esi, dword ptr [edi + 12]
    mov dword ptr [ebp - 40], eax
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 32], esi
    je L39
    push 116
    call sub_10085C43
    test eax, eax
    je L37
    mov ecx, eax
    call sub_100857B3
    mov dword ptr [ebp - 4], eax
    jmp L38
L37:
    and dword ptr [ebp - 4], 0
L38:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L50
    push 0
    push esi
    push dword ptr [edi + 4]
    push dword ptr [edi]
    call sub_10085CBA
    mov ecx, dword ptr [ebp - 4]
    mov esi, eax
    test esi, esi
    jl L51
    push edi
    call sub_1008581E
    mov esi, eax
    test esi, esi
    push 1
    jl L52
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [edx + 8]
    mov esi, dword ptr [eax + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, eax
    call sub_1006C8B9
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp - 40]
    mov esi, dword ptr [ebp - 32]
    mov dword ptr [edx + ecx], eax
    mov dword ptr [ebp - 12], eax
    mov edi, eax
L39:
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L48
    mov eax, dword ptr [ebp - 24]
    mov dword ptr [ebp - 12], eax
L40:
    mov edx, dword ptr [ebp - 4]
    cmp edx, 4
    mov eax, edx
    jae L42
    mov ecx, dword ptr [ebp - 12]
L41:
    cmp dword ptr [ecx], -1
    jne L42
    inc eax
    add ecx, 4
    cmp eax, 4
    jb L41
L42:
    mov esi, dword ptr [edi + 16]
    and dword ptr [ebp - 20], 0
    mov ecx, eax
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 16]
    shl ecx, 2
    mov eax, dword ptr [ecx + eax]
    mov dword ptr [esi + edx*4], eax
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebp - 16]
    or dword ptr [eax + 60], edx
    cmp dword ptr [ebx + 8], 0
    jbe L47
L43:
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [ebp - 20]
    mov esi, dword ptr [eax + edx*4]
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [esi + 56]
    cmp edx, dword ptr [ecx + eax]
    jne L46
    fld dword ptr [ebp - 36]
    mov eax, dword ptr [ebp - 16]
    fcomp dword ptr [g_1019BC84]
    and eax, 0FFF7FFFFh
    or dword ptr [esi + 60], eax
    mov edx, dword ptr [esi + 60]
    fnstsw ax
    test ah, 5
    jp L46
    mov eax, 000080000h
    test eax, edx
    je L44
    and edx, 0FFF7FFFFh
    jmp L45
L44:
    or edx, eax
L45:
    mov dword ptr [esi + 60], edx
L46:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebx + 8]
    jb L43
L47:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp - 12], 4
    cmp eax, dword ptr [ebp - 32]
    jb L40
L48:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 24], 16
    cmp eax, dword ptr [ebp - 28]
    jb L36
L49:
    mov eax, dword ptr [ebx + 000000100h]
    and dword ptr [eax], 0
    xor eax, eax
    jmp L11
L50:
    mov eax, 08007000Eh
    jmp L11
L51:
    push 1
    jmp L53
L52:
    mov ecx, dword ptr [ebp - 4]
L53:
    call sub_1006C9D8
    mov eax, esi
    jmp L11
FUN_100a995f ENDP
END
