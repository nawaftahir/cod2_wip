.686
.MODEL FLAT, C
EXTRN sub_1006C872:PROC
EXTRN sub_100854ED:PROC
EXTRN sub_1008553C:PROC
EXTRN sub_100855BB:PROC
EXTRN sub_100857F1:PROC
EXTRN sub_10085886:PROC
EXTRN sub_1008597D:PROC
EXTRN sub_100859CC:PROC
EXTRN sub_10085A51:PROC
EXTRN sub_10085C7F:PROC
EXTRN sub_10085D20:PROC
EXTRN sub_10085D50:PROC
EXTRN sub_10085E36:PROC
EXTRN sub_100B9C7B:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_100bb9d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000124h
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax]
    push esi
    xor ecx, ecx
    mov esi, eax
    push edi
    xor edi, edi
    inc ecx
    and eax, 0FFF00000h
    and esi, 0000FFFFFh
    cmp eax, 030000000h
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 52], edi
    mov dword ptr [ebp - 68], edi
    mov dword ptr [ebp - 64], ecx
    mov dword ptr [ebp - 60], 2
    mov dword ptr [ebp - 56], 3
    je L0
    mov eax, ecx
    jmp L37
L0:
    cmp esi, edi
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 36], edi
    mov dword ptr [ebp - 32], edi
    mov dword ptr [ebp - 40], edi
    mov dword ptr [ebp - 8], edi
    jbe L18
    mov eax, dword ptr [ebx + 000000100h]
    fld qword ptr [g_1019BE20]
    mov edx, dword ptr [eax + 8]
    mov eax, esi
    shl eax, 2
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 20], eax
    mov eax, esi
    shl eax, 3
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 4], eax
L1:
    mov eax, dword ptr [ebp - 20]
    mov ecx, dword ptr [edx + eax]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edi, dword ptr [ebp - 4]
    mov edi, dword ptr [edx + edi]
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [eax + 4]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebx + 16]
    mov edi, dword ptr [eax + edi*4]
    mov dword ptr [ebp - 44], edi
    mov edi, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + edi*4]
    test byte ptr [eax + 5], 1
    je L2
    fld st(0)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L2
    cmp dword ptr [ecx + 8], -1
    jne L2
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + ecx]
    mov edi, dword ptr [ebp - 8]
    cmp ecx, dword ptr [eax + edi*4]
    jne L2
    mov dword ptr [ebp - 24], 1
    jmp L3
L2:
    mov dword ptr [ebp - 32], 1
L3:
    mov eax, dword ptr [ebp - 44]
    test byte ptr [eax + 5], 1
    je L4
    mov ecx, dword ptr [ebp - 48]
    fld st(0)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L4
    cmp dword ptr [ecx + 8], -1
    jne L4
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 20]
    mov ecx, dword ptr [eax + ecx]
    mov edi, dword ptr [ebp - 8]
    cmp ecx, dword ptr [eax + edi*4]
    jne L4
    mov dword ptr [ebp - 36], 1
    jmp L5
L4:
    mov dword ptr [ebp - 40], 1
L5:
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    add dword ptr [ebp - 20], 4
    cmp dword ptr [ebp - 8], esi
    jb L1
    xor edi, edi
    fstp st(0)
    cmp dword ptr [ebp - 24], edi
    je L8
    cmp dword ptr [ebp - 32], edi
    jne L8
    push 116
    call sub_1008597D
    cmp eax, edi
    je L6
    mov ecx, eax
    call sub_100854ED
    jmp L7
L6:
    xor eax, eax
L7:
    cmp eax, edi
    mov dword ptr [ebp - 12], eax
    je L12
    push edi
    push esi
    lea ecx, [esi + esi]
    and esi, 0000FFFFFh
    or esi, 070B00000h
    jmp L14
L8:
    cmp dword ptr [ebp - 36], edi
    je L18
    cmp dword ptr [ebp - 40], edi
    jne L18
    cmp dword ptr [ebp + 8], edi
    je L9
    xor eax, eax
    inc eax
    jmp L37
L9:
    push 116
    call sub_100859CC
    cmp eax, edi
    je L10
    mov ecx, eax
    call sub_1008553C
    jmp L11
L10:
    xor eax, eax
L11:
    cmp eax, edi
    mov dword ptr [ebp - 12], eax
    jne L13
L12:
    mov eax, 08007000Eh
    jmp L37
L13:
    push edi
    push esi
    lea ecx, [esi + esi]
    and esi, 0000FFFFFh
    or esi, 070C00000h
L14:
    push ecx
    mov ecx, eax
    push esi
    call sub_10085A51
    cmp eax, edi
    mov dword ptr [ebp - 4], eax
    jl L35
    push dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebp - 12]
    call sub_100855BB
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L35
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [eax + 16]
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 12]
    mov edi, dword ptr [eax + 16]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [eax + 8]
    mov ecx, edx
    mov edx, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [edx + 8]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 16]
    mov edx, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [edx + 8]
    add edi, ecx
    cmp dword ptr [ebp - 24], 0
    je L15
    add esi, ecx
    jmp L16
L15:
    add esi, dword ptr [ebp - 28]
L16:
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L17:
    mov eax, dword ptr [ebx + 0000000FCh]
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_10085D50
    mov dword ptr [ebp - 4], eax
    jmp L35
L18:
    xor eax, eax
    cmp dword ptr [ebp + 8], edi
    mov ecx, ebx
    sete al
    push eax
    push esi
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 0000000E4h]
    push eax
    lea eax, [ebp - 52]
    push eax
    lea eax, [ebp - 000000124h]
    push eax
    push 0101188F8h
    push dword ptr [ebx + 000000100h]
    call sub_100B9C7B
    cmp eax, edi
    mov dword ptr [ebp - 4], eax
    jne L36
    xor edi, edi
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 8], edi
L19:
    and dword ptr [ebp - 4], 0
L20:
    xor edx, edx
    test esi, esi
    mov dword ptr [ebp - 44], edx
    jbe L32
    mov ecx, dword ptr [ebx + 20]
L21:
    mov eax, dword ptr [ebp - 8]
    shl eax, 2
    lea edi, [eax + edx]
    mov edi, dword ptr [ebp + edi*4 - 0000000E4h]
    mov dword ptr [ebp - 32], edi
    mov edi, edx
    sub edi, eax
    mov eax, dword ptr [ebp + edi*4 - 0000000D4h]
    mov edi, dword ptr [ebp - 4]
    mov dword ptr [ebp - 20], eax
    lea eax, [edi + edx]
    sub edx, edi
    mov edx, dword ptr [ebp + edx*4 - 0000000B4h]
    mov edi, dword ptr [ebp - 20]
    mov edi, dword ptr [ecx + edi*4]
    mov edi, dword ptr [edi + 4]
    mov eax, dword ptr [ebp + eax*4 - 0000000C4h]
    mov dword ptr [ebp - 36], edx
    mov edx, dword ptr [ecx + edx*4]
    mov dword ptr [ebp - 16], edx
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [edx + edi*4]
    mov dword ptr [ebp - 28], edi
    mov edi, dword ptr [ebp - 16]
    mov edi, dword ptr [edi + 4]
    mov edx, dword ptr [edx + edi*4]
    mov edi, dword ptr [ebp - 32]
    mov dword ptr [ebp - 48], edx
    mov edx, dword ptr [ecx + edi*4]
    mov edx, dword ptr [edx + 56]
    cmp edx, eax
    mov dword ptr [ebp - 40], edx
    je L22
    mov edx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx + 56]
    cmp edx, edi
    je L22
    cmp dword ptr [ebp - 40], -1
    je L23
    cmp dword ptr [ebp - 40], edx
    jne L23
L22:
    mov edx, dword ptr [ecx + edi*4]
    mov edi, dword ptr [edx + 60]
    mov edx, dword ptr [ecx + eax*4]
    xor edi, 000080000h
    cmp edi, dword ptr [edx + 60]
    jne L23
    mov edx, dword ptr [ebp - 20]
    cmp edx, dword ptr [ebp - 36]
    jne L23
    xor edi, edi
    inc edi
    jmp L28
L23:
    cmp dword ptr [ebp - 32], eax
    jne L27
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 56]
    cmp edx, dword ptr [ebp - 36]
    je L24
    mov edi, dword ptr [ebp - 16]
    mov edi, dword ptr [edi + 56]
    cmp edi, dword ptr [ebp - 20]
    je L24
    cmp edx, -1
    je L25
    cmp edx, edi
    jne L25
L24:
    mov edx, dword ptr [eax + 60]
    mov edi, dword ptr [ebp - 16]
    xor edx, 000080000h
    cmp edx, dword ptr [edi + 60]
    je L26
L25:
    mov edi, dword ptr [ebp - 28]
    mov edx, 000000100h
    test dword ptr [edi + 4], edx
    je L27
    mov edi, dword ptr [ebp - 48]
    test dword ptr [edi + 4], edx
    je L27
    fld qword ptr [eax + 32]
    mov eax, dword ptr [ebp - 16]
    fchs
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L27
L26:
    xor eax, eax
    inc eax
    mov edi, eax
    jmp L29
L27:
    xor edi, edi
L28:
    xor eax, eax
L29:
    mov edx, dword ptr [ebp - 44]
    test edx, edx
    jne L30
    mov dword ptr [ebp - 24], eax
    jmp L31
L30:
    cmp dword ptr [ebp - 24], eax
    je L31
    xor edi, edi
L31:
    test edi, edi
    je L33
    inc edx
    cmp edx, esi
    mov dword ptr [ebp - 44], edx
    jb L21
L32:
    test edi, edi
    jne L38
L33:
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp - 4], 8
    jb L20
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], 2
    jb L19
L34:
    mov dword ptr [ebp - 4], 1
L35:
    mov ecx, dword ptr [ebp - 12]
    test ecx, ecx
    je L36
    push 1
    call sub_1006C872
L36:
    mov eax, dword ptr [ebp - 4]
L37:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L38:
    push 116
    call sub_10085C7F
    xor edi, edi
    cmp eax, edi
    je L39
    mov ecx, eax
    call sub_100857F1
    mov ecx, eax
    jmp L40
L39:
    xor ecx, ecx
L40:
    cmp ecx, edi
    mov dword ptr [ebp - 12], ecx
    jne L41
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L36
L41:
    cmp dword ptr [ebp - 24], edi
    je L48
    cmp dword ptr [ebp - 8], 1
    je L49
L42:
    cmp dword ptr [ebp - 8], edi
    jne L44
L43:
    mov ecx, dword ptr [ebp - 12]
    push edi
    push esi
    lea eax, [esi + esi]
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 070C00000h
    push eax
    call sub_10085D20
    cmp eax, edi
    mov dword ptr [ebp - 4], eax
    jl L35
L44:
    push dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebp - 12]
    call sub_10085886
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L35
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, esi
    mov esi, dword ptr [eax + 16]
    mov eax, dword ptr [ebp - 12]
    mov edi, dword ptr [eax + 16]
    shl ecx, 2
    mov dword ptr [ebp - 16], ecx
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + 8]
    shl ecx, 4
    mov edx, ecx
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 28], edx
    lea esi, [ebp + edx - 0000000E4h]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [eax + 8]
    mov ecx, edx
    add edi, ecx
    shr ecx, 2
    lea esi, [ebp - 0000000D4h]
    sub esi, dword ptr [ebp - 28]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edx, dword ptr [eax + 8]
    mov esi, dword ptr [edx]
    mov edi, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + edi]
    mov ecx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx + edx*4]
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx]
    mov esi, dword ptr [ecx + esi*4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ecx + 4]
    cmp edx, dword ptr [esi + 4]
    mov dword ptr [ebp - 28], edi
    jne L45
    mov edi, dword ptr [ecx + 12]
    cmp edi, dword ptr [esi + 12]
    je L34
    mov edi, dword ptr [ebp - 28]
L45:
    cmp edx, dword ptr [edi + 4]
    jne L46
    mov ecx, dword ptr [ecx + 12]
    cmp ecx, dword ptr [edi + 12]
    je L34
L46:
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L17
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp - 52]
    test eax, eax
    jbe L47
    mov edi, dword ptr [ebp + 12]
    mov ecx, eax
    lea esi, [ebp - 000000124h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L47:
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ecx], eax
    jmp L36
L48:
    cmp dword ptr [ebp - 8], edi
    jne L50
L49:
    push edi
    push esi
    lea eax, [esi + esi]
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 070B00000h
    push eax
    call sub_10085E36
    cmp eax, edi
    mov dword ptr [ebp - 4], eax
    jl L35
    xor edi, edi
    cmp dword ptr [ebp - 24], edi
    jne L42
L50:
    cmp dword ptr [ebp - 8], 1
    je L43
    jmp L44
FUN_100bb9d8 ENDP
END
