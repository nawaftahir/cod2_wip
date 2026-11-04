.686
.MODEL FLAT, C
EXTRN sub_1006CA13:PROC
EXTRN sub_1006CBB3:PROC
EXTRN sub_1006CC24:PROC
EXTRN sub_1006E236:PROC
EXTRN sub_1006E56D:PROC
EXTRN sub_1006E5B8:PROC
EXTRN sub_1006E7C8:PROC
EXTRN sub_1006E93E:PROC
EXTRN sub_100715D6:PROC
EXTRN sub_10071A12:PROC
EXTRN sub_1007A6FE:PROC
EXTRN sub_1007AB28:PROC
EXTRN sub_1007B82B:PROC
EXTRN sub_1007B87B:PROC
EXTRN sub_100F78B1:PROC
EXTRN sub_100F78C5:PROC
EXTRN sub_100F78DD:PROC
EXTRN sub_100F78EF:PROC
EXTRN sub_100F7903:PROC
EXTRN sub_100F7917:PROC
EXTRN sub_100F7EBD:PROC
EXTRN sub_100F7EC5:PROC
EXTRN sub_100F7ECD:PROC
EXTRN sub_100F7ED5:PROC
EXTRN sub_100F7EDD:PROC
EXTRN sub_100F7EE5:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_100730ba PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 124
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 88]
    mov dword ptr [ebp - 92], eax
    mov eax, dword ptr [ebx + 92]
    mov dword ptr [ebp - 56], eax
    mov eax, dword ptr [ebx + 24]
    mov dword ptr [ebp - 76], eax
    mov eax, dword ptr [ebx + 4]
    push esi
    mov esi, dword ptr [eax + 24]
    mov eax, esi
    shl eax, 2
    push edi
    xor edi, edi
    push eax
    mov dword ptr [ebp - 28], edi
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 32], edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 36], edi
    mov dword ptr [ebp - 20], esi
    mov dword ptr [ebp - 12], eax
    call sub_100F78B1
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L42
    push dword ptr [ebp - 12]
    call sub_100F78C5
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 28], eax
    je L42
    shl esi, 4
    push esi
    mov dword ptr [ebp - 80], esi
    call sub_100F78DD
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 16], eax
    je L42
    push esi
    call sub_100F78EF
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 32], eax
    je L42
    push dword ptr [ebp - 12]
    call sub_100F7903
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L42
    push dword ptr [ebp - 12]
    call sub_100F7917
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 36], eax
    je L42
    cmp dword ptr [ebp + 12], edi
    mov dword ptr [ebx + 92], edi
    je L1
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1007A6FE
    mov esi, eax
    cmp esi, edi
    jl L43
    xor esi, esi
    cmp dword ptr [ebx + 92], esi
    je L0
    mov dword ptr [ebp - 56], 1
L0:
    cmp dword ptr [ebx + 80], esi
    jne L43
    cmp dword ptr [ebx + 84], esi
    jne L43
L1:
    mov ecx, dword ptr [ebp - 12]
    mov esi, dword ptr [ebx + 24]
    mov edi, dword ptr [ebp - 4]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebx + 24]
    mov edi, dword ptr [ebp + 24]
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor edi, edi
    cmp dword ptr [ebp - 20], edi
    jbe L7
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [ebp + 12], eax
L2:
    mov eax, dword ptr [ebx + 24]
    mov esi, edi
    shl esi, 2
    mov eax, dword ptr [esi + eax]
    cmp eax, -1
    je L3
    push dword ptr [ebp + 12]
    mov ecx, ebx
    push eax
    call sub_1006CA13
    test eax, eax
    jge L4
L3:
    fld qword ptr [ebx + 0000000A0h]
    mov eax, dword ptr [ebp + 12]
    fstp qword ptr [eax]
    fld qword ptr [ebx + 0000000A8h]
    fstp qword ptr [eax + 8]
L4:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [esi + eax]
    cmp ecx, -1
    je L5
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [eax + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov eax, dword ptr [eax + 116]
    cmp eax, dword ptr [ecx + 4]
    je L5
    mov eax, dword ptr [ecx]
    mov ecx, dword ptr [ebp - 8]
    and eax, 31
    mov dword ptr [esi + ecx], eax
    jmp L6
L5:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [esi + eax], 31
L6:
    add dword ptr [ebp + 12], 16
    inc edi
    cmp edi, dword ptr [ebp - 20]
    jb L2
L7:
    mov eax, dword ptr [ebx + 32]
    and dword ptr [ebp - 52], 0
    or dword ptr [ebp - 72], 0FFFFFFFFh
    or dword ptr [ebp - 68], 0FFFFFFFFh
    and dword ptr [ebp - 24], 0
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 44], eax
    mov dword ptr [ebp - 48], 1
L8:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 12]
    mov esi, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 28]
    mov dword ptr [ebp - 88], ecx
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 84], eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 80]
    mov esi, dword ptr [ebp - 16]
    mov edi, dword ptr [ebp - 32]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    or dword ptr [ebp + 12], 0FFFFFFFFh
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 12]
    mov esi, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 36]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor edi, edi
    cmp dword ptr [ebp + 16], edi
    je L10
    mov eax, dword ptr [ebp - 4]
    or dword ptr [ebp + 12], 0FFFFFFFFh
    mov dword ptr [ebx + 24], eax
    push edi
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 16]
    mov ecx, ebx
    mov dword ptr [ebx + 80], edi
    mov dword ptr [ebx + 84], edi
    call sub_1007B82B
    mov esi, eax
    cmp esi, edi
    jl L43
    push 23
    lea eax, [ebp + 12]
    push eax
    lea eax, [ebp - 60]
    push eax
    push eax
    mov edi, 020500001h
    push edi
    push dword ptr [ebp + 16]
    mov ecx, ebx
    call sub_1006E56D
    mov esi, eax
    test esi, esi
    jl L43
    mov eax, dword ptr [ebp + 24]
    or dword ptr [ebp + 12], 0FFFFFFFFh
    mov dword ptr [ebx + 24], eax
    xor eax, eax
    push eax
    mov dword ptr [ebx + 80], eax
    mov dword ptr [ebx + 84], eax
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 16]
    mov ecx, ebx
    call sub_1007B87B
    mov esi, eax
    test esi, esi
    jl L43
    push 23
    lea eax, [ebp + 12]
    push eax
    lea eax, [ebp - 44]
    push eax
    push eax
    push edi
    push dword ptr [ebp + 16]
    mov ecx, ebx
    call sub_1006E5B8
    mov esi, eax
    test esi, esi
    jl L43
    xor eax, eax
    cmp dword ptr [ebx + 88], eax
    jne L9
    cmp dword ptr [ebx + 80], eax
    jne L34
    cmp dword ptr [ebx + 84], eax
    jne L34
L9:
    mov dword ptr [ebx + 80], eax
    mov dword ptr [ebx + 84], eax
    xor edi, edi
L10:
    lea eax, [ebp - 108]
    push eax
    push dword ptr [ebp - 44]
    mov ecx, ebx
    call sub_1006CBB3
    test eax, eax
    jge L11
    fld qword ptr [ebx + 0000000A8h]
    fstp qword ptr [ebp - 108]
    fld qword ptr [ebx + 0000000A0h]
    fstp qword ptr [ebp - 100]
L11:
    fld qword ptr [ebp - 108]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 65
    je L12
    fld qword ptr [ebp - 100]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 5
    jp L13
L12:
    mov dword ptr [ebp - 52], 1
L13:
    cmp dword ptr [ebp - 20], edi
    jbe L23
    mov eax, dword ptr [ebp - 16]
    mov esi, dword ptr [ebp + 24]
    mov edi, dword ptr [ebp - 8]
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [ebp - 20]
    sub edi, esi
    mov dword ptr [ebp - 64], eax
L14:
    mov eax, dword ptr [esi]
    cmp eax, -1
    je L21
    lea ecx, [ebp - 124]
    push ecx
    push eax
    mov ecx, ebx
    call sub_1006CC24
    test eax, eax
    jge L15
    fld qword ptr [ebx + 0000000A0h]
    fstp qword ptr [ebp - 124]
    fld qword ptr [ebx + 0000000A8h]
    fst qword ptr [ebp - 116]
    jmp L16
L15:
    fld qword ptr [ebp - 116]
L16:
    cmp dword ptr [ebp - 52], 0
    mov ecx, dword ptr [ebp - 40]
    je L17
    fld qword ptr [ebp - 124]
    mov eax, ecx
    fstp qword ptr [eax]
    fstp qword ptr [eax + 8]
    mov edx, dword ptr [ebx + 8]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [edx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax]
    and eax, 31
    mov dword ptr [edi + esi], eax
    jmp L22
L17:
    fld qword ptr [ecx]
    fcomp qword ptr [ebp - 124]
    fnstsw ax
    test ah, 65
    jne L18
    fld qword ptr [ebp - 124]
    fstp qword ptr [ecx]
L18:
    fcom qword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    jne L19
    fstp qword ptr [ecx + 8]
    jmp L20
L19:
    fstp st(0)
L20:
    mov edx, dword ptr [ebx + 8]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [edx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax]
    and dword ptr [edi + esi], eax
    jmp L22
L21:
    mov ecx, dword ptr [ebp - 40]
L22:
    add ecx, 16
    add esi, 4
    dec dword ptr [ebp - 64]
    mov dword ptr [ebp - 40], ecx
    jne L14
    xor edi, edi
L23:
    fld qword ptr [ebp - 108]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L24
    fld qword ptr [ebp - 100]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L35
L24:
    fldz
    fcomp qword ptr [ebp - 108]
    fnstsw ax
    test ah, 1
    jne L25
    fldz
    fcomp qword ptr [ebp - 100]
    fnstsw ax
    test ah, 65
    jp L25
    mov dword ptr [ebx + 88], 1
L25:
    cmp dword ptr [ebp - 48], edi
    je L27
    cmp dword ptr [ebp - 52], edi
    jne L26
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 72]
    push eax
    push dword ptr [ebp - 24]
    mov ecx, ebx
    push dword ptr [ebp + 12]
    call sub_100715D6
    test eax, eax
    mov dword ptr [ebp - 48], 1
    jne L27
L26:
    mov dword ptr [ebp - 48], edi
L27:
    cmp dword ptr [ebp - 20], edi
    jbe L30
    mov esi, dword ptr [ebp + 24]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 20]
    sub ecx, esi
    mov dword ptr [ebp - 40], ecx
    mov dword ptr [ebp - 64], eax
L28:
    mov eax, dword ptr [ecx + esi]
    mov edx, dword ptr [esi]
    cmp eax, edx
    je L29
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + edx*4]
    and word ptr [eax], 00000FE60h
    mov edi, dword ptr [ecx]
    mov edx, dword ptr [eax]
    and edi, 00000019Fh
    or edi, edx
    mov dword ptr [eax], edi
    fld qword ptr [ecx + 32]
    fstp qword ptr [eax + 32]
    xor edi, edi
    fld qword ptr [ecx + 40]
    mov ecx, dword ptr [ebp - 40]
    fstp qword ptr [eax + 40]
L29:
    add esi, 4
    dec dword ptr [ebp - 64]
    jne L28
L30:
    cmp dword ptr [ebp + 20], edi
    je L32
    mov eax, dword ptr [ebp - 4]
    push edi
    push dword ptr [ebp + 20]
    mov ecx, ebx
    push dword ptr [ebp - 44]
    mov dword ptr [ebx + 24], eax
    push dword ptr [ebp + 16]
    mov dword ptr [ebx + 80], edi
    mov dword ptr [ebx + 84], edi
    call sub_10071A12
    mov esi, eax
    cmp esi, edi
    jl L43
    mov eax, dword ptr [ebp + 24]
    push edi
    push dword ptr [ebp + 20]
    mov ecx, ebx
    mov dword ptr [ebx + 24], eax
    mov dword ptr [ebx + 80], edi
    mov dword ptr [ebx + 84], edi
    call sub_1007AB28
    mov esi, eax
    cmp esi, edi
    jl L43
    cmp dword ptr [ebx + 88], edi
    jne L31
    cmp dword ptr [ebx + 80], edi
    jne L35
    cmp dword ptr [ebx + 84], edi
    jne L35
L31:
    mov dword ptr [ebx + 80], edi
    mov dword ptr [ebx + 84], edi
L32:
    cmp dword ptr [ebx + 92], edi
    jne L33
    inc dword ptr [ebp - 24]
    cmp dword ptr [ebp - 24], 000000400h
    jb L8
    jmp L35
L33:
    mov ecx, dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 32]
    push ecx
    push dword ptr [ebp - 84]
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebp - 16]
    push dword ptr [ebp - 88]
    mov dword ptr [ebp - 16], edx
    mov edx, dword ptr [ebp - 36]
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], ecx
    mov ecx, ebx
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 36], eax
    call sub_1006E7C8
    cmp dword ptr [ebp - 24], edi
    mov dword ptr [ebx + 76], edi
    mov dword ptr [ebx + 80], edi
    mov dword ptr [ebx + 84], edi
    jne L35
    mov dword ptr [ebp - 56], 1
    jmp L35
L34:
    xor edi, edi
L35:
    mov eax, 000000400h
    cmp dword ptr [ebp - 24], eax
    jne L36
    push eax
    push 01010F8F8h
    push 000000DB7h
    push dword ptr [ebp + 8]
    push ebx
    call sub_1006E236
    add esp, 20
    jmp L40
L36:
    mov eax, dword ptr [ebp - 20]
    cmp eax, edi
    jbe L39
    mov edx, dword ptr [ebp - 4]
    mov esi, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 16]
    sub esi, edx
    mov dword ptr [ebp + 24], eax
L37:
    mov eax, dword ptr [edx]
    cmp eax, -1
    je L38
    mov edi, dword ptr [ebx + 8]
    fld qword ptr [ecx]
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    fstp qword ptr [eax + 32]
    fld qword ptr [ecx + 8]
    fstp qword ptr [eax + 40]
    mov edi, dword ptr [esi + edx]
    or edi, 000000180h
    mov dword ptr [eax], edi
L38:
    add ecx, 16
    add edx, 4
    dec dword ptr [ebp + 24]
    jne L37
L39:
    mov ecx, dword ptr [ebp - 12]
    mov edi, dword ptr [ebp - 76]
    mov esi, dword ptr [ebp - 4]
    mov eax, ecx
    shr ecx, 2
    mov dword ptr [ebx + 24], edi
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    cmp dword ptr [ebp - 24], 0
    rep movsb byte ptr es:[edi], byte ptr [esi]
    je L41
    cmp dword ptr [ebp - 48], 0
    je L41
    cmp dword ptr [ebx + 80], 0
    jne L41
    cmp dword ptr [ebx + 84], 0
    jne L41
    mov ecx, dword ptr [ebp - 72]
    push 0
    push 0
    lea eax, [ebp - 68]
    push eax
    mov eax, dword ptr [ebx + 24]
    lea eax, [eax + ecx*4]
    push eax
    push 010000001h
    push dword ptr [ebp + 16]
    mov ecx, ebx
    call sub_1006E93E
    test eax, eax
    jge L41
L40:
    mov esi, 080004005h
    jmp L43
L41:
    xor esi, esi
    jmp L43
L42:
    mov esi, 08007000Eh
L43:
    mov eax, dword ptr [ebp - 76]
    push dword ptr [ebp - 4]
    mov dword ptr [ebx + 24], eax
    call sub_100F7EBD
    push dword ptr [ebp - 28]
    call sub_100F7EC5
    push dword ptr [ebp - 16]
    call sub_100F7ECD
    push dword ptr [ebp - 32]
    call sub_100F7ED5
    push dword ptr [ebp - 8]
    call sub_100F7EDD
    push dword ptr [ebp - 36]
    call sub_100F7EE5
    mov eax, dword ptr [ebp - 92]
    mov dword ptr [ebx + 88], eax
    mov eax, dword ptr [ebp - 56]
    add esp, 24
    mov dword ptr [ebx + 92], eax
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 20
FUN_100730ba ENDP
END
