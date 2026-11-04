.686
.MODEL FLAT, C
EXTRN sub_1006C853:PROC
EXTRN sub_1006C8C3:PROC
EXTRN sub_100853F1:PROC
EXTRN sub_10085460:PROC
EXTRN sub_100854E0:PROC
EXTRN sub_1008574C:PROC
EXTRN sub_100857DB:PROC
EXTRN sub_10085881:PROC
EXTRN sub_100858F0:PROC
EXTRN sub_10085977:PROC
EXTRN sub_10085BDC:PROC
EXTRN sub_10085C76:PROC
EXTRN sub_10085F5D:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A7C:PROC
EXTRN sub_100B9B5C:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100bf075 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000110h
    push ebx
    push esi
    push edi
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp - 28], 0
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [eax]
    xor edi, edi
    inc edi
    push edi
    and esi, 0000FFFFFh
    push esi
    lea ecx, [ebp - 28]
    push ecx
    lea ecx, [ebp - 0000000D0h]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 000000110h]
    push ecx
    push 010119358h
    push eax
    mov ecx, ebx
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 20], 2
    mov dword ptr [ebp - 16], 3
    mov dword ptr [ebp - 12], esi
    call sub_100B9A11
    test eax, eax
    jne L2
    push 116
    call sub_10085881
    test eax, eax
    je L0
    mov ecx, eax
    call sub_100853F1
    mov edi, eax
    mov dword ptr [ebp - 4], edi
    jmp L1
L0:
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [ebp - 4]
L1:
    test edi, edi
    je L25
    push 0
    lea eax, [esi + esi]
    push esi
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 074600000h
    jmp L5
L2:
    push edi
    push esi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000D0h]
    push eax
    lea eax, [ebp - 8]
    push eax
    lea eax, [ebp - 000000110h]
    push eax
    push 0101192F8h
    push dword ptr [ebx + 000000100h]
    mov ecx, ebx
    call sub_100B9A7C
    test eax, eax
    jne L6
    push 116
    call sub_100858F0
    test eax, eax
    je L3
    mov ecx, eax
    call sub_10085460
    mov edi, eax
    mov dword ptr [ebp - 4], edi
    jmp L4
L3:
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [ebp - 4]
L4:
    test edi, edi
    je L25
    push 0
    lea eax, [esi + esi]
    push esi
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 074700000h
L5:
    push eax
    mov ecx, edi
    call sub_10085977
    test eax, eax
    mov dword ptr [ebp - 8], eax
    mov ecx, edi
    jl L30
    push dword ptr [ebx + 000000100h]
    call sub_100854E0
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jl L29
    mov edx, dword ptr [ebx + 000000100h]
    mov edi, dword ptr [edi + 16]
    mov eax, esi
    mov esi, dword ptr [edx + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 4]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [edx + 8]
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    lea esi, [ebp - 0000000D0h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    lea esi, [ebp - 0000000C0h]
    jmp L32
L6:
    push edi
    push esi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000D0h]
    push eax
    lea eax, [ebp - 8]
    push eax
    lea eax, [ebp - 000000110h]
    push eax
    push 0101193B8h
    push dword ptr [ebx + 000000100h]
    mov ecx, ebx
    call sub_100B9B5C
    test eax, eax
    jne L34
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [ebp - 0000000B0h]
    mov eax, dword ptr [edx + eax*4]
    mov edi, dword ptr [eax + 60]
    mov ecx, 000080000h
    cmp edi, ecx
    mov dword ptr [ebp - 8], edi
    jne L8
    xor eax, eax
    test esi, esi
    jbe L14
    mov ecx, esi
    lea esi, [ebp - 0000000A0h]
    lea edi, [ebp - 28]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L7:
    mov ecx, dword ptr [ebp + eax*4 - 0000000B0h]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 56]
    mov dword ptr [ebp + eax*4 - 48], ecx
    inc eax
    cmp eax, dword ptr [ebp - 12]
    jb L7
    jmp L10
L8:
    mov edi, dword ptr [ebp - 0000000A0h]
    mov edi, dword ptr [edx + edi*4]
    mov dword ptr [ebp - 4], edi
    mov edi, dword ptr [edi + 60]
    cmp edi, ecx
    mov dword ptr [ebp - 32], edi
    jne L11
    xor eax, eax
    test esi, esi
    jbe L14
    mov ecx, esi
    lea esi, [ebp - 0000000B0h]
    lea edi, [ebp - 28]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L9:
    mov ecx, dword ptr [ebp + eax*4 - 0000000A0h]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 56]
    mov dword ptr [ebp + eax*4 - 48], ecx
    inc eax
    cmp eax, dword ptr [ebp - 12]
    jb L9
L10:
    mov esi, dword ptr [ebp - 12]
    jmp L14
L11:
    cmp esi, 1
    jne L33
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    mov edi, 0FFF00000h
    mov ecx, 010100000h
    je L12
    mov edx, dword ptr [ebx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [eax]
    mov edx, eax
    and edx, edi
    cmp edx, ecx
    jne L12
    and eax, 0000FFFFFh
    cmp eax, esi
    jne L12
    cmp dword ptr [ebp - 8], 0
    jne L12
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebp - 0000000A0h]
    jmp L13
L12:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    je L33
    mov edx, dword ptr [ebx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [eax]
    mov edx, eax
    and edx, edi
    cmp edx, ecx
    jne L33
    and eax, 0000FFFFFh
    cmp eax, 1
    jne L33
    cmp dword ptr [ebp - 32], 0
    jne L33
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebp - 0000000B0h]
L13:
    mov dword ptr [ebp - 28], eax
L14:
    and dword ptr [ebp - 4], 0
    xor eax, eax
    inc eax
    test esi, esi
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 8], eax
    jbe L22
    fld qword ptr [g_1019BC88]
    fld qword ptr [g_1019BE20]
L15:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + eax*4 - 0000000D0h]
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [ecx + eax*4]
    mov edi, dword ptr [edx + 4]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edi*4]
    mov edi, 000000100h
    test dword ptr [eax + 4], edi
    jne L16
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp - 12], 0
L16:
    fld st(1)
    fld qword ptr [edx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L17
    and dword ptr [ebp - 8], 0
L17:
    fld st(0)
    fld qword ptr [edx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L18
    and dword ptr [ebp - 12], 0
L18:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + eax*4 - 0000000C0h]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edx*4]
    xor edx, edx
    test dword ptr [eax + 4], edi
    jne L19
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 12], edx
L19:
    fld st(0)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L20
    mov dword ptr [ebp - 8], edx
L20:
    fld st(1)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L21
    mov dword ptr [ebp - 12], edx
L21:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], esi
    jb L15
    cmp dword ptr [ebp - 8], edx
    fstp st(0)
    fstp st(0)
    jne L22
    cmp dword ptr [ebp - 12], edx
    je L33
L22:
    push 116
    call sub_10085BDC
    test eax, eax
    je L23
    mov ecx, eax
    call sub_1008574C
    mov edi, eax
    mov dword ptr [ebp - 4], edi
    jmp L24
L23:
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [ebp - 4]
L24:
    test edi, edi
    jne L26
L25:
    mov eax, 08007000Eh
    jmp L34
L26:
    mov eax, esi
    and eax, 0000FFFFFh
    cmp dword ptr [ebp - 8], 0
    je L27
    or eax, 074600000h
    jmp L28
L27:
    or eax, 074700000h
L28:
    push 0
    push esi
    lea ecx, [esi + esi]
    push ecx
    push eax
    mov ecx, edi
    call sub_10085C76
    test eax, eax
    mov dword ptr [ebp - 8], eax
    mov ecx, edi
    jl L30
    push dword ptr [ebx + 000000100h]
    call sub_100857DB
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jge L31
L29:
    mov ecx, edi
L30:
    push 1
    call sub_1006C853
    mov eax, dword ptr [ebp - 8]
    jmp L34
L31:
    mov edx, dword ptr [ebx + 000000100h]
    mov edi, dword ptr [edi + 16]
    mov eax, esi
    mov esi, dword ptr [edx + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 4]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [edx + 8]
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    lea esi, [ebp - 28]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    lea esi, [ebp - 48]
L32:
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [edx + 8]
    mov ecx, eax
    shr ecx, 2
    add edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebx + 000000100h]
    push edx
    call sub_10085F5D
    mov ecx, dword ptr [ebp - 4]
    push 1
    mov esi, eax
    call sub_1006C8C3
    mov eax, esi
    jmp L34
L33:
    xor eax, eax
    inc eax
L34:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100bf075 ENDP
END
