.686
.MODEL FLAT, C
EXTRN sub_100863E6:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100873f3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 56
    mov edx, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [edx]
    mov eax, esi
    and eax, 0FFF00000h
    cmp eax, 050000000h
    push edi
    mov ebx, ecx
    jne L63
    mov eax, dword ptr [edx + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 16]
    mov dword ptr [ebp - 36], eax
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    test al, 1
    je L63
    test ah, 16
    jne L63
    and esi, 0000FFFFFh
    mov dword ptr [ebp + 8], esi
    mov dword ptr [ebp - 20], 14
    jbe L11
    mov ecx, dword ptr [edx + 8]
    mov eax, esi
    lea esi, [ecx + eax*4]
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 32], eax
L0:
    cmp dword ptr [ebp + 12], 0
    mov esi, dword ptr [ecx]
    mov eax, dword ptr [ebx + 20]
    jne L1
    mov edi, dword ptr [eax + esi*4]
    mov esi, dword ptr [ebp - 16]
    mov esi, dword ptr [esi]
    jmp L2
L1:
    mov esi, dword ptr [eax + esi*4]
    mov esi, dword ptr [esi + 48]
    mov edi, dword ptr [eax + esi*4]
    mov esi, dword ptr [ebp - 16]
    mov esi, dword ptr [esi]
    mov esi, dword ptr [eax + esi*4]
    mov esi, dword ptr [esi + 48]
L2:
    mov esi, dword ptr [eax + esi*4]
    mov eax, dword ptr [edi]
    and dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 12], eax
    and dword ptr [ebp - 12], 4
    mov dword ptr [ebp - 4], eax
    je L3
    test byte ptr [esi], 4
    jne L5
L3:
    test byte ptr [ebp - 4], 8
    je L4
    test byte ptr [esi], 8
    jne L5
L4:
    cmp edi, esi
    jne L6
L5:
    mov dword ptr [ebp - 8], 4
L6:
    cmp dword ptr [ebp - 12], 0
    je L7
    test byte ptr [esi], 8
    jne L8
L7:
    test byte ptr [ebp - 4], 8
    je L9
    test byte ptr [esi], 4
    je L9
L8:
    or dword ptr [ebp - 8], 8
L9:
    test byte ptr [ebp - 4], 2
    je L10
    test byte ptr [esi], 2
    je L10
    or dword ptr [ebp - 8], 2
L10:
    mov eax, dword ptr [ebp - 8]
    and dword ptr [ebp - 20], eax
    add dword ptr [ebp - 16], 4
    add ecx, 4
    dec dword ptr [ebp - 32]
    jne L0
L11:
    mov eax, dword ptr [ebp - 36]
    fld qword ptr [g_1019BE20]
    mov ecx, dword ptr [ebp - 20]
    or dword ptr [eax], ecx
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    je L28
    or dword ptr [ebp - 32], 0FFFFFFFFh
    fldz
    cmp dword ptr [ebp + 8], eax
    fstp qword ptr [ebp - 56]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 28], eax
    jbe L26
    mov eax, dword ptr [edx + 8]
    mov edi, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebx + 20]
    mov esi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 24], eax
    lea eax, [eax + edi*4]
    mov dword ptr [ebp - 40], eax
L12:
    mov eax, dword ptr [eax]
    mov edi, dword ptr [ebp - 24]
    mov edi, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 48]
    mov edi, dword ptr [ecx + edi*4]
    mov edi, dword ptr [edi + 48]
    mov dword ptr [ebp - 44], eax
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 48], edi
    mov edi, dword ptr [ecx + edi*4]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 5], 1
    je L13
    cmp dword ptr [edi + 8], -1
    jne L13
    mov dword ptr [ebp - 20], 1
    jmp L14
L13:
    and dword ptr [ebp - 20], 0
L14:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 5], 1
    je L15
    mov eax, dword ptr [ebp - 4]
    cmp dword ptr [eax + 8], -1
    jne L15
    mov dword ptr [ebp - 16], 1
    jmp L16
L15:
    and dword ptr [ebp - 16], 0
L16:
    cmp dword ptr [ebp - 20], 0
    je L17
    fld qword ptr [edi + 32]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L19
L17:
    cmp dword ptr [ebp - 16], 0
    je L18
    mov eax, dword ptr [ebp - 4]
    fld qword ptr [eax + 32]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L19
L18:
    cmp dword ptr [ebp - 20], 0
    je L21
    cmp dword ptr [ebp - 16], 0
    je L20
    mov eax, dword ptr [ebp - 4]
    fld qword ptr [eax + 32]
    fmul qword ptr [edi + 32]
    fadd qword ptr [ebp - 56]
    fstp qword ptr [ebp - 56]
L19:
    inc dword ptr [ebp - 8]
    jmp L23
L20:
    fld qword ptr [edi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L24
    mov eax, dword ptr [ebp - 44]
    jmp L22
L21:
    cmp dword ptr [ebp - 16], 0
    je L24
    mov eax, dword ptr [ebp - 4]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L24
    mov eax, dword ptr [ebp - 48]
L22:
    inc dword ptr [ebp - 12]
    mov dword ptr [ebp - 32], eax
L23:
    inc dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 40]
    mov edi, dword ptr [ebp - 28]
    add dword ptr [ebp - 24], 4
    add eax, 4
    cmp edi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 40], eax
    jb L12
L24:
    cmp dword ptr [ebp - 12], 1
    jne L25
    mov eax, dword ptr [ebp + 8]
    dec eax
    cmp eax, dword ptr [ebp - 8]
    jne L25
    fld qword ptr [ebp - 56]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L25
    mov eax, dword ptr [ebp - 36]
    fstp st(0)
    mov ecx, dword ptr [ebp - 32]
    and dword ptr [edx], 0
    mov dword ptr [eax + 48], ecx
    jmp L27
L25:
    xor eax, eax
L26:
    mov ecx, dword ptr [ebp - 8]
    cmp dword ptr [ebp + 8], ecx
    jne L28
    push ecx
    fstp st(0)
    fld qword ptr [ebp - 56]
    push ecx
    xor eax, eax
    fstp qword ptr [esp]
    push eax
    push eax
    mov dword ptr [edx], eax
    push dword ptr [ebx + 120]
    mov ecx, ebx
    call sub_100863E6
    mov ecx, dword ptr [ebp - 36]
    mov dword ptr [ecx + 48], eax
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ecx + 48], eax
L27:
    xor eax, eax
    jmp L64
L28:
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, eax
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 32], eax
    jbe L46
    mov eax, dword ptr [edx + 8]
    mov dword ptr [ebp - 16], eax
    lea esi, [eax + ecx*4]
    mov dword ptr [ebp - 40], ecx
L29:
    cmp dword ptr [ebp + 12], 0
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx]
    mov edi, dword ptr [esi]
    mov ecx, dword ptr [eax + ecx*4]
    je L30
    mov ecx, dword ptr [ecx + 48]
    mov edi, dword ptr [eax + edi*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov edi, dword ptr [edi + 48]
L30:
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L31
    cmp dword ptr [ecx + 8], -1
    jne L31
    fld qword ptr [ecx + 32]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L32
L31:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edi + ecx*4]
    test byte ptr [ecx + 5], 1
    je L33
    cmp dword ptr [eax + 8], -1
    jne L33
    fld qword ptr [eax + 32]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L33
L32:
    inc dword ptr [ebp - 36]
    inc dword ptr [ebp - 12]
    jmp L34
L33:
    inc dword ptr [ebp - 8]
    and dword ptr [ebp - 12], 0
L34:
    add dword ptr [ebp - 16], 4
    add esi, 4
    dec dword ptr [ebp - 40]
    jne L29
    mov eax, dword ptr [ebp - 36]
    xor ecx, ecx
    cmp eax, ecx
    je L46
    cmp dword ptr [ebp - 8], 2
    jne L35
    test byte ptr [ebx + 108], 32
    je L46
L35:
    cmp dword ptr [ebp - 8], 1
    je L36
    cmp eax, dword ptr [ebp - 12]
    je L36
    test byte ptr [ebx + 108], 6
    jne L46
L36:
    xor eax, eax
    cmp dword ptr [ebp - 8], ecx
    je L45
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 8]
    shl ecx, 2
    mov dword ptr [ebp - 40], eax
    mov dword ptr [ebp - 36], ecx
    mov dword ptr [ebp - 16], ecx
L37:
    cmp dword ptr [ebp + 12], 0
    mov ecx, dword ptr [edx + 8]
    mov esi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebx + 20]
    mov edi, dword ptr [eax + esi*4]
    jne L38
    mov dword ptr [ebp - 12], edi
    mov edi, dword ptr [ebp - 16]
    mov edi, dword ptr [edi + ecx]
    jmp L39
L38:
    mov edi, dword ptr [edi + 48]
    mov edi, dword ptr [eax + edi*4]
    mov dword ptr [ebp - 12], edi
    mov edi, dword ptr [ebp - 16]
    mov edi, dword ptr [edi + ecx]
    mov edi, dword ptr [eax + edi*4]
    mov edi, dword ptr [edi + 48]
L39:
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L40
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [eax + 8], -1
    jne L40
    fld qword ptr [eax + 32]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L42
L40:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L41
    mov eax, dword ptr [ebp - 4]
    cmp dword ptr [eax + 8], -1
    jne L41
    fld qword ptr [eax + 32]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L42
L41:
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 8]
    mov dword ptr [ecx + eax*4], esi
    mov eax, dword ptr [edx + 8]
    mov ecx, dword ptr [ebp - 16]
    mov esi, dword ptr [ebp - 36]
    mov ecx, dword ptr [ecx + eax]
    add dword ptr [ebp - 36], 4
    mov dword ptr [esi + eax], ecx
L42:
    mov eax, dword ptr [ebp - 40]
    add dword ptr [ebp - 16], 4
    inc eax
    cmp eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 40], eax
    jb L37
    mov eax, dword ptr [edx + 8]
    fstp st(0)
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [ebp + 8]
    shl ecx, 2
    lea edi, [eax + ecx]
    shl esi, 2
    add esi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebp - 8]
    xor ecx, ecx
    inc ecx
    cmp esi, ecx
    jne L43
    mov eax, 020500001h
    jmp L44
L43:
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 050000000h
L44:
    mov dword ptr [edx], eax
    lea eax, [esi + esi]
    mov dword ptr [edx + 4], eax
    xor eax, eax
    cmp dword ptr [ebp + 8], esi
    mov dword ptr [edx + 12], ecx
    setne al
    mov dword ptr [ebp + 8], esi
    mov dword ptr [ebp - 32], eax
    jmp L47
L45:
    fstp st(0)
    mov dword ptr [edx], ecx
    jmp L64
L46:
    fstp st(0)
L47:
    cmp dword ptr [ebp + 8], 1
    jbe L48
    cmp dword ptr [ebp + 8], 2
    jne L62
    test byte ptr [ebx + 108], 32
    jne L62
L48:
    mov eax, dword ptr [ebp + 8]
    xor esi, esi
    test eax, eax
    mov dword ptr [ebp - 8], esi
    jbe L54
    mov edi, eax
    shl edi, 2
    mov dword ptr [ebp - 40], edi
L49:
    cmp dword ptr [ebp + 12], 0
    jne L50
    mov eax, dword ptr [edx + 8]
    mov ecx, dword ptr [ebx + 20]
    mov esi, dword ptr [eax + esi*4]
    mov eax, dword ptr [edi + eax]
    mov esi, dword ptr [ecx + esi*4]
    mov ecx, dword ptr [ecx + eax*4]
    jmp L51
L50:
    mov ecx, dword ptr [edx + 8]
    mov esi, dword ptr [ecx + esi*4]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [edi + ecx]
    mov esi, dword ptr [eax + esi*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov esi, dword ptr [esi + 48]
    mov ecx, dword ptr [ecx + 48]
    mov esi, dword ptr [eax + esi*4]
    mov ecx, dword ptr [eax + ecx*4]
L51:
    mov eax, dword ptr [esi + 4]
    mov edi, dword ptr [ebx + 16]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L52
    cmp dword ptr [esi + 8], -1
    jne L52
    fld qword ptr [esi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L53
L52:
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L54
    cmp dword ptr [ecx + 8], -1
    jne L54
    fld qword ptr [ecx + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L54
L53:
    mov esi, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 40]
    inc esi
    add edi, 4
    cmp esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 40], edi
    jb L49
L54:
    mov ecx, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 8], ecx
    jne L62
    xor eax, eax
    test ecx, ecx
    mov dword ptr [ebp - 8], eax
    jbe L59
    shl ecx, 2
    mov dword ptr [ebp - 36], ecx
L55:
    cmp dword ptr [ebp + 12], 0
    mov ecx, dword ptr [edx + 8]
    lea esi, [ecx + eax*4]
    jne L56
    mov eax, dword ptr [esi]
    mov edi, dword ptr [ebx + 20]
    mov eax, dword ptr [edi + eax*4]
    jmp L57
L56:
    mov eax, dword ptr [ebx + 20]
    mov edi, dword ptr [esi]
    mov edi, dword ptr [eax + edi*4]
    mov edi, dword ptr [edi + 48]
    mov eax, dword ptr [eax + edi*4]
L57:
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L58
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [eax + 8], -1
    jne L58
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L58
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [ecx + eax]
    mov dword ptr [esi], eax
L58:
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 36], 4
    inc eax
    cmp eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    jb L55
L59:
    push 2
    pop eax
    cmp dword ptr [ebp + 8], eax
    jne L60
    mov dword ptr [edx], 020400001h
    mov dword ptr [edx + 4], eax
    jmp L61
L60:
    mov dword ptr [edx], 010000001h
    mov dword ptr [edx + 4], 1
L61:
    mov dword ptr [ebp - 32], 1
L62:
    xor eax, eax
    cmp dword ptr [ebp - 32], eax
    sete al
    jmp L64
L63:
    xor eax, eax
    inc eax
L64:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100873f3 ENDP
END
