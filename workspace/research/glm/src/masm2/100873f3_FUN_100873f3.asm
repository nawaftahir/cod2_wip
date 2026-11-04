.686
.MODEL FLAT, C
EXTRN sub_100863E6:PROC
EXTRN sub_10087A72:PROC
EXTRN sub_10087A77:PROC
EXTRN sub_10087A89:PROC
EXTRN sub_10087A8F:PROC
EXTRN sub_10087A99:PROC
EXTRN sub_10087A9D:PROC
EXTRN sub_10087AA2:PROC
EXTRN sub_10087AAC:PROC
EXTRN sub_10087B03:PROC
EXTRN sub_10087B28:PROC
EXTRN sub_10087B2D:PROC
EXTRN sub_10087BA0:PROC
EXTRN sub_10087BA8:PROC
EXTRN sub_10087BC0:PROC
EXTRN sub_10087C1C:PROC
EXTRN sub_10087C25:PROC
EXTRN sub_10087C28:PROC
EXTRN sub_10087C4B:PROC
EXTRN sub_10087C5B:PROC
EXTRN sub_10087C68:PROC
EXTRN sub_10087C70:PROC
EXTRN sub_10087C71:PROC
EXTRN sub_10087C72:PROC
EXTRN sub_10087C75:PROC
EXTRN sub_10087C9B:PROC
EXTRN sub_10087D19:PROC
EXTRN sub_10087D42:PROC
EXTRN sub_10087D55:PROC
EXTRN sub_10087DA2:PROC
EXTRN sub_10087DCD:PROC
EXTRN sub_10087E31:PROC
EXTRN sub_10087E63:PROC
EXTRN sub_10087EA5:PROC
EXTRN sub_10087EAD:PROC
EXTRN sub_10087EB7:PROC
EXTRN sub_10087EBD:PROC
EXTRN sub_10087EF3:PROC
EXTRN sub_10087F18:PROC
EXTRN sub_10087F1E:PROC
EXTRN sub_10087F30:PROC
EXTRN sub_10087F31:PROC
EXTRN sub_10087F36:PROC
EXTRN sub_10087F40:PROC
EXTRN sub_10087FA1:PROC
EXTRN sub_10087FB9:PROC
EXTRN sub_10087FE2:PROC
EXTRN sub_10087FE8:PROC
EXTRN sub_10088000:PROC
EXTRN sub_1008800E:PROC
EXTRN sub_10088017:PROC
EXTRN sub_10088029:PROC
EXTRN sub_1008806C:PROC
EXTRN sub_10088084:PROC
EXTRN sub_100880B6:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100873f3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 56
    mov mov edx, dword ptr [ebp + 8]
    push push ebx
    push push esi
    mov mov esi, dword ptr [edx]
    mov mov eax, esi
    and and eax, 0FFF00000h
    cmp cmp eax, 050000000h
    push push edi
    mov mov ebx, ecx
    jne sub_10087A77
    mov mov eax, dword ptr [edx + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 36], eax
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test al, 1
    je sub_10087A99
    test test ah, 16
    jne sub_10087AA2
    and and esi, 0FFFFFh
    mov mov dword ptr [ebp + 8], esi
    mov mov dword ptr [ebp - 20], 14
    jbe L3
    mov mov ecx, dword ptr [edx + 8]
    mov mov eax, esi
    lea lea esi, [ecx + eax*4]
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 32], eax
    cmp cmp dword ptr [ebp + 12], 0
    mov mov esi, dword ptr [ecx]
    mov mov eax, dword ptr [ebx + 20]
    jne L0
    mov mov edi, dword ptr [eax + esi*4]
    mov mov esi, dword ptr [ebp - 16]
    mov mov esi, dword ptr [esi]
    jmp L1
    mov mov esi, dword ptr [eax + esi*4]
    mov mov esi, dword ptr [esi + 48]
    mov mov edi, dword ptr [eax + esi*4]
    mov mov esi, dword ptr [ebp - 16]
    mov mov esi, dword ptr [esi]
    mov mov esi, dword ptr [eax + esi*4]
    mov mov esi, dword ptr [esi + 48]
    mov mov esi, dword ptr [eax + esi*4]
    mov mov eax, dword ptr [edi]
    and and dword ptr [ebp - 8], 0
    mov mov dword ptr [ebp - 12], eax
    and and dword ptr [ebp - 12], 4
    mov mov dword ptr [ebp - 4], eax
    je L2
    test test byte ptr [esi], 4
    jne L4
    test test byte ptr [ebp - 4], 8
    je L5
    test test byte ptr [esi], 8
    jne L7
    cmp cmp edi, esi
    jne L8
    mov mov dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp - 12], 0
    je L9
    test test byte ptr [esi], 8
    jne L10
    test test byte ptr [ebp - 4], 8
    je L11
    test test byte ptr [esi], 4
    je L12
    or or dword ptr [ebp - 8], 8
    test test byte ptr [ebp - 4], 2
    je L13
    test test byte ptr [esi], 2
    je L14
    or or dword ptr [ebp - 8], 2
    mov mov eax, dword ptr [ebp - 8]
    and and dword ptr [ebp - 20], eax
    add add dword ptr [ebp - 16], 4
    add add ecx, 4
    dec dec dword ptr [ebp - 32]
    jne L6
    mov mov eax, dword ptr [ebp - 36]
    fld fld qword ptr [g_1019BE20]
    mov mov ecx, dword ptr [ebp - 20]
    or or dword ptr [eax], ecx
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    je L27
L1:
    or or dword ptr [ebp - 32], -1
    fldz fldz
    cmp cmp dword ptr [ebp + 8], eax
    fstp fstp qword ptr [ebp - 56]
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 28], eax
    jbe L24
    mov mov eax, dword ptr [edx + 8]
    mov mov edi, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 24], eax
    lea lea eax, [eax + edi*4]
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [eax]
    mov mov edi, dword ptr [ebp - 24]
    mov mov edi, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 48]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [edi + 48]
L2:
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 48], edi
L3:
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [edi + 4]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 5], 1
    je L15
    cmp cmp dword ptr [edi + 8], -1
L7:
    jne L16
    mov mov dword ptr [ebp - 20], 1
    jmp L17
L8:
    and and dword ptr [ebp - 20], 0
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 5], 1
    je L18
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp dword ptr [eax + 8], -1
    jne L19
    mov mov dword ptr [ebp - 16], 1
    jmp L20
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [ebp - 20], 0
    je L21
    fld fld qword ptr [edi + 32]
L11:
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L25
    cmp cmp dword ptr [ebp - 16], 0
    je L23
    mov mov eax, dword ptr [ebp - 4]
    fld fld qword ptr [eax + 32]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L26
    cmp cmp dword ptr [ebp - 20], 0
    je L29
    cmp cmp dword ptr [ebp - 16], 0
    je L28
    mov mov eax, dword ptr [ebp - 4]
    fld fld qword ptr [eax + 32]
    fmul fmul qword ptr [edi + 32]
    fadd fadd qword ptr [ebp - 56]
    fstp fstp qword ptr [ebp - 56]
    inc inc dword ptr [ebp - 8]
    jmp L30
    fld fld qword ptr [edi + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L32
    mov mov eax, dword ptr [ebp - 44]
    jmp L31
    cmp cmp dword ptr [ebp - 16], 0
    je L33
    mov mov eax, dword ptr [ebp - 4]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L34
    mov mov eax, dword ptr [ebp - 48]
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 32], eax
    inc inc dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 40]
    mov mov edi, dword ptr [ebp - 28]
    add add dword ptr [ebp - 24], 4
    add add eax, 4
    cmp cmp edi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 40], eax
    jb L22
    cmp cmp dword ptr [ebp - 12], 1
    jne L35
    mov mov eax, dword ptr [ebp + 8]
    dec dec eax
    cmp cmp eax, dword ptr [ebp - 8]
    jne L36
    fld fld qword ptr [ebp - 56]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L37
    mov mov eax, dword ptr [ebp - 36]
    fstp fstp st(0)
    mov mov ecx, dword ptr [ebp - 32]
    and and dword ptr [edx], 0
    mov mov dword ptr [eax + 48], ecx
    jmp L38
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp + 8], ecx
    jne L39
    push push ecx
    fstp fstp st(0)
    fld fld qword ptr [ebp - 56]
    push push ecx
    xor xor eax, eax
    fstp fstp qword ptr [esp]
    push push eax
    push push eax
    mov mov dword ptr [edx], eax
    push push dword ptr [ebx + 120]
    mov mov ecx, ebx
    call sub_100863E6
    mov mov ecx, dword ptr [ebp - 36]
    mov mov dword ptr [ecx + 48], eax
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ecx + 48], eax
    xor xor eax, eax
    jmp sub_10087D19
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 32], eax
    jbe sub_10087BA8
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [ebp - 16], eax
    lea lea esi, [eax + ecx*4]
    mov mov dword ptr [ebp - 40], ecx
    cmp cmp dword ptr [ebp + 12], 0
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx]
    mov mov edi, dword ptr [esi]
    mov mov ecx, dword ptr [eax + ecx*4]
    je L40
    mov mov ecx, dword ptr [ecx + 48]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [edi + 48]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je L41
    cmp cmp dword ptr [ecx + 8], -1
    jne L42
    fld fld qword ptr [ecx + 32]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10087A72
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edi + ecx*4]
    test test byte ptr [ecx + 5], 1
    je sub_10087A89
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10087A8F
    fld fld qword ptr [eax + 32]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10087A9D
    inc inc dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 12]
    jmp sub_10087AAC
    inc inc dword ptr [ebp - 8]
    and and dword ptr [ebp - 12], 0
    add add dword ptr [ebp - 16], 4
    add add esi, 4
    dec dec dword ptr [ebp - 40]
    jne L43
L20:
    mov mov eax, dword ptr [ebp - 36]
    xor xor ecx, ecx
    cmp cmp eax, ecx
    je sub_10087C4B
    cmp cmp dword ptr [ebp - 8], 2
    jne sub_10087B03
    test test byte ptr [ebx + 108], 32
    je sub_10087C5B
    cmp cmp dword ptr [ebp - 8], 1
    je sub_10087B28
    cmp cmp eax, dword ptr [ebp - 12]
    je sub_10087B2D
    test test byte ptr [ebx + 108], 6
    jne sub_10087C70
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 8], ecx
    je sub_10087C72
    mov mov dword ptr [ebp - 8], ecx
L22:
    mov mov ecx, dword ptr [ebp + 8]
    shl shl ecx, 2
    mov mov dword ptr [ebp - 40], eax
L23:
    mov mov dword ptr [ebp - 36], ecx
    mov mov dword ptr [ebp - 16], ecx
    cmp cmp dword ptr [ebp + 12], 0
    mov mov ecx, dword ptr [edx + 8]
    mov mov esi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebx + 20]
    mov mov edi, dword ptr [eax + esi*4]
    jne sub_10087BA0
    mov mov dword ptr [ebp - 12], edi
    mov mov edi, dword ptr [ebp - 16]
    mov mov edi, dword ptr [edi + ecx]
    jmp sub_10087BC0
    mov mov edi, dword ptr [edi + 48]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov dword ptr [ebp - 12], edi
L26:
    mov mov edi, dword ptr [ebp - 16]
    mov mov edi, dword ptr [edi + ecx]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [edi + 48]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
L29:
    je sub_10087C1C
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10087C25
    fld fld qword ptr [eax + 32]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10087C75
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_10087C68
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10087C71
    fld fld qword ptr [eax + 32]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10087C9B
    mov mov eax, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ecx + eax*4], esi
    mov mov eax, dword ptr [edx + 8]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [ecx + eax]
    add add dword ptr [ebp - 36], 4
    mov mov dword ptr [esi + eax], ecx
    mov mov eax, dword ptr [ebp - 40]
    add add dword ptr [ebp - 16], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 40], eax
    jb sub_10087C28
    mov mov eax, dword ptr [edx + 8]
    fstp fstp st(0)
    mov mov ecx, dword ptr [ebp - 8]
L33:
    mov mov esi, dword ptr [ebp + 8]
    shl shl ecx, 2
    lea lea edi, [eax + ecx]
    shl shl esi, 2
    add add esi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L34:
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebp - 8]
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp esi, ecx
    jne sub_10087D42
    mov mov eax, 020500001h
    jmp sub_10087D55
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 050000000h
    mov mov dword ptr [edx], eax
    lea lea eax, [esi + esi]
    mov mov dword ptr [edx + 4], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 8], esi
    mov mov dword ptr [edx + 12], ecx
    setne setne al
    mov mov dword ptr [ebp + 8], esi
    mov mov dword ptr [ebp - 32], eax
    jmp sub_10087DA2
    fstp fstp st(0)
    mov mov dword ptr [edx], ecx
    jmp sub_10087F31
    fstp fstp st(0)
    cmp cmp dword ptr [ebp + 8], 1
    jbe sub_10087DCD
    cmp cmp dword ptr [ebp + 8], 2
    jne sub_10087F36
    test test byte ptr [ebx + 108], 32
    jne sub_10087F40
    mov mov eax, dword ptr [ebp + 8]
    xor xor esi, esi
    test test eax, eax
    mov mov dword ptr [ebp - 8], esi
    jbe sub_10087EA5
    mov mov edi, eax
    shl shl edi, 2
    mov mov dword ptr [ebp - 40], edi
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_10087E31
    mov mov eax, dword ptr [edx + 8]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [eax + esi*4]
    mov mov eax, dword ptr [edi + eax]
    mov mov esi, dword ptr [ecx + esi*4]
    mov mov ecx, dword ptr [ecx + eax*4]
    jmp sub_10087E63
    mov mov ecx, dword ptr [edx + 8]
    mov mov esi, dword ptr [ecx + esi*4]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov esi, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [esi + 48]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov esi, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_10087EB7
L39:
    cmp cmp dword ptr [esi + 8], -1
    jne sub_10087EBD
    fld fld qword ptr [esi + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10087EF3
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_10087F18
    cmp cmp dword ptr [ecx + 8], -1
    jne sub_10087F1E
    fld fld qword ptr [ecx + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10087F30
    mov mov esi, dword ptr [ebp - 8]
    mov mov edi, dword ptr [ebp - 40]
    inc inc esi
    add add edi, 4
    cmp cmp esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp - 40], edi
    jb sub_10087EAD
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp - 8], ecx
    jne sub_10088000
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [ebp - 8], eax
    jbe sub_10087FE2
    shl shl ecx, 2
    mov mov dword ptr [ebp - 36], ecx
    cmp cmp dword ptr [ebp + 12], 0
    mov mov ecx, dword ptr [edx + 8]
    lea lea esi, [ecx + eax*4]
    jne sub_10087FA1
    mov mov eax, dword ptr [esi]
    mov mov edi, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edi + eax*4]
    jmp sub_10087FB9
    mov mov eax, dword ptr [ebx + 20]
    mov mov edi, dword ptr [esi]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [edi + 48]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_1008800E
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10088017
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10088029
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [ecx + eax]
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 36], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 8], eax
    jb sub_10087FE8
    push push 2
    pop pop eax
    cmp cmp dword ptr [ebp + 8], eax
    jne sub_1008806C
    mov mov dword ptr [edx], 020400001h
    mov mov dword ptr [edx + 4], eax
    jmp sub_10088084
    mov mov dword ptr [edx], 010000001h
L41:
    mov mov dword ptr [edx + 4], 1
    mov mov dword ptr [ebp - 32], 1
L43:
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 32], eax
    sete sete al
    jmp sub_100880B6
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100873f3 ENDP
END
