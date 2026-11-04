.686
.MODEL FLAT, C
EXTRN sub_1008631E:PROC
EXTRN sub_10086358:PROC
EXTRN sub_10087B79:PROC
EXTRN sub_10087B96:PROC
EXTRN sub_1008A98E:PROC
EXTRN sub_1008B179:PROC
EXTRN sub_1008B639:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_1008cb4b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 56
    push ebx
    push esi
    mov esi, ecx
    push edi
    mov dword ptr [ebp - 52], esi
    call sub_1008A98E
    or dword ptr [ebp - 44], 0FFFFFFFFh
    or dword ptr [ebp - 48], 0FFFFFFFFh
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 20], edi
    jbe L22
L0:
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [esi + 24]
    mov ebx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx]
    test ecx, 0FFF00000h
    je L21
    mov eax, ecx
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L21
    cmp eax, 040000000h
    ja L21
    mov eax, dword ptr [ebx + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    mov dword ptr [ebp - 8], edi
    cmp eax, edi
    mov dword ptr [ebp - 56], eax
    jbe L21
L1:
    mov eax, dword ptr [ebx + 12]
    cmp eax, edi
    mov dword ptr [ebp - 28], edi
    mov dword ptr [ebp - 16], edi
    jbe L12
L2:
    imul eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebx + 8]
    mov edi, dword ptr [ebx + 16]
    add eax, edx
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + ecx*4]
    test byte ptr [eax], 1
    mov dword ptr [ebp - 32], ecx
    mov dword ptr [ebp - 40], edx
    je L11
    mov eax, dword ptr [edx + 24]
    mov ecx, dword ptr [edx + 20]
    mov dword ptr [ebp - 36], eax
    jmp L8
L3:
    mov eax, dword ptr [esi + 20]
    and dword ptr [ebp - 12], 0
    mov edi, ecx
    shl edi, 2
    mov eax, dword ptr [eax + edi]
    mov edx, dword ptr [eax + 72]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 12], 0
    jbe L5
    mov edx, dword ptr [eax + 16]
    mov dword ptr [ebp - 24], edx
L4:
    mov edx, dword ptr [ebp - 24]
    cmp dword ptr [edx], ecx
    je L5
    inc dword ptr [ebp - 12]
    mov edx, dword ptr [eax + 12]
    add dword ptr [ebp - 24], 4
    cmp dword ptr [ebp - 12], edx
    jb L4
L5:
    cmp dword ptr [ebp - 36], 0
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 8]
    je L6
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    push dword ptr [ebp - 32]
    call sub_10087B79
    test eax, eax
    je L7
    mov eax, dword ptr [ebp - 40]
    mov dword ptr [eax + 64], 1
    jmp L10
L6:
    push dword ptr [ebp - 32]
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    call sub_10087B96
    test eax, eax
    jne L9
L7:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax]
    mov ecx, dword ptr [eax + 24]
    mov dword ptr [ebp - 36], ecx
    mov ecx, dword ptr [eax + 20]
L8:
    cmp ecx, -1
    jne L3
    jmp L11
L9:
    mov eax, dword ptr [ebp - 40]
    and dword ptr [eax + 64], 0
L10:
    inc dword ptr [ebp - 28]
L11:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebx + 12]
    cmp dword ptr [ebp - 16], eax
    jb L2
    xor edi, edi
L12:
    mov eax, dword ptr [ebx + 12]
    cmp dword ptr [ebp - 28], eax
    jne L20
    test eax, eax
    jbe L19
L13:
    imul eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebx + 8]
    mov ecx, dword ptr [esi + 20]
    add eax, edi
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx + edi*4]
    mov ecx, dword ptr [ecx + edx*4]
    cmp dword ptr [ecx + 64], 0
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edx + ecx*4]
    je L15
    test byte ptr [ecx + 5], 1
    je L14
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L18
L14:
    mov eax, dword ptr [ebp - 44]
    cmp eax, -1
    jne L17
    push ecx
    fld1
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_1008631E
    mov dword ptr [ebp - 44], eax
    jmp L17
L15:
    test byte ptr [ecx + 5], 1
    je L16
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L18
L16:
    mov eax, dword ptr [ebp - 48]
    cmp eax, -1
    jne L17
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_10086358
    mov dword ptr [ebp - 48], eax
L17:
    mov ecx, dword ptr [ebx + 12]
    imul ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ebx + 8]
    add ecx, edi
    mov dword ptr [edx + ecx*4], eax
    mov dword ptr [ebp - 4], 1
L18:
    mov eax, dword ptr [ebx + 12]
    inc edi
    cmp edi, eax
    jb L13
L19:
    xor edi, edi
L20:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 56]
    jb L1
L21:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 12]
    jb L0
L22:
    mov ecx, esi
    mov dword ptr [ebp - 32], edi
    call sub_1008B179
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 24], edi
    jbe L74
L23:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 24]
    mov ebx, dword ptr [eax + ecx*4]
    test word ptr [ebx + 2], 00000FFF0h
    je L73
    and dword ptr [ebp - 16], 0
    cmp dword ptr [ebx + 12], 0
    jbe L30
L24:
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + eax*4]
    mov edi, dword ptr [ecx + 24]
    mov eax, dword ptr [ecx + 20]
    mov dword ptr [ebp - 20], edi
    jmp L28
L25:
    mov edi, eax
    shl edi, 2
    mov dword ptr [ebp - 56], edi
    mov edi, dword ptr [edx + edi]
    test byte ptr [edi], 000000080h
    je L29
    cmp dword ptr [ebp - 20], 0
    fld qword ptr [edi + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    jne L39
    test ah, 68
    jnp L40
L26:
    and dword ptr [ebp - 20], 0
    or eax, 0FFFFFFFFh
L27:
    mov dword ptr [ebp - 4], 1
L28:
    cmp eax, -1
    jne L25
L29:
    inc dword ptr [ebp - 16]
    mov dword ptr [ecx + 20], eax
    mov eax, dword ptr [ebp - 20]
    mov dword ptr [ecx + 24], eax
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ebx + 12]
    jb L24
L30:
    mov ecx, dword ptr [ebx]
    mov eax, ecx
    and eax, 0FFF00000h
    cmp eax, 010F00000h
    je L62
    cmp eax, 011400000h
    je L62
    cmp eax, 020700000h
    je L48
    cmp eax, 020800000h
    je L48
    mov eax, ecx
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L43
    cmp eax, 040000000h
    ja L43
    mov eax, dword ptr [ebx + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    xor edi, edi
    cmp dword ptr [ebx + 12], edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 56], eax
    jbe L36
L31:
    mov ecx, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [ecx + edx*4]
    mov edi, dword ptr [esi + 20]
    mov edi, dword ptr [edi + edx*4]
    cmp dword ptr [edi + 20], -1
    jne L32
    cmp dword ptr [edi + 24], 0
    je L35
L32:
    mov edi, dword ptr [ebp - 8]
    and dword ptr [ebp - 20], 0
    test eax, eax
    mov dword ptr [ecx + edi*4], edx
    jbe L34
L33:
    mov ecx, dword ptr [ebx + 12]
    imul ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [ebx + 8]
    add eax, ecx
    mov eax, dword ptr [edx + eax*4]
    add ecx, edi
    inc dword ptr [ebp - 20]
    mov dword ptr [edx + ecx*4], eax
    mov eax, dword ptr [ebp - 56]
    cmp dword ptr [ebp - 20], eax
    jb L33
L34:
    inc edi
    mov dword ptr [ebp - 8], edi
L35:
    inc dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 12]
    cmp ecx, dword ptr [ebx + 12]
    jb L31
L36:
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebx + 12]
    je L73
    and dword ptr [ebp - 20], 0
    test eax, eax
    jbe L38
    and dword ptr [ebp - 28], 0
    shl ecx, 2
    mov dword ptr [ebp - 48], ecx
L37:
    mov esi, dword ptr [ebx + 12]
    imul esi, dword ptr [ebp - 20]
    mov edx, dword ptr [ebx + 8]
    mov edi, dword ptr [ebp - 28]
    mov ecx, dword ptr [ebp - 48]
    add edi, edx
    lea esi, [edx + esi*4]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    inc dword ptr [ebp - 20]
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, edx
    add dword ptr [ebp - 28], ecx
    cmp dword ptr [ebp - 20], eax
    jb L37
L38:
    mov ecx, dword ptr [ebp - 8]
    test ecx, ecx
    je L41
    mov edx, dword ptr [ebx]
    xor edx, ecx
    and edx, 0000FFFFFh
    xor edx, dword ptr [ebx]
    jmp L42
L39:
    test ah, 68
    jnp L26
L40:
    mov edi, dword ptr [ebp - 56]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax]
    mov edi, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ebp - 20], edi
    jmp L27
L41:
    xor edx, edx
L42:
    mov esi, dword ptr [ebp - 52]
    imul eax, ecx
    mov dword ptr [ebx], edx
    mov dword ptr [ebx + 12], ecx
    mov dword ptr [ebx + 4], eax
    jmp L72
L43:
    mov eax, dword ptr [ebx + 12]
    test eax, eax
    je L73
    and dword ptr [ebp - 28], 0
    test eax, eax
    jbe L47
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + 16]
    mov edi, eax
L44:
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 20], -1
    jne L45
    cmp dword ptr [eax + 24], 0
    je L46
L45:
    inc dword ptr [ebp - 28]
L46:
    add ecx, 4
    dec edi
    jne L44
    cmp dword ptr [ebp - 28], 0
    jne L73
L47:
    xor eax, eax
    mov dword ptr [ebx + 4], eax
    mov dword ptr [ebx + 12], eax
    jmp L71
L48:
    mov eax, dword ptr [ebx + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    xor edi, edi
    cmp dword ptr [ebx + 12], edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 28], eax
    jbe L57
L49:
    mov edi, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [esi + 20]
    shl edi, 2
    mov eax, dword ptr [edi + eax]
    mov dword ptr [ebp - 56], eax
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 20], -1
    jne L50
    cmp dword ptr [eax + 24], 0
    je L56
L50:
    mov edx, dword ptr [ebx + 8]
    mov edi, dword ptr [edi + edx]
    mov dword ptr [ebp - 48], edi
    mov edi, dword ptr [ebx + 12]
    add edi, dword ptr [ebp - 8]
    mov edx, dword ptr [edx + edi*4]
    mov edi, dword ptr [ebp - 48]
    mov edi, dword ptr [ecx + edi*4]
    cmp dword ptr [edi + 20], -1
    jne L51
    cmp dword ptr [edi + 24], 0
    jne L51
    mov ecx, dword ptr [ecx + edx*4]
    mov edi, dword ptr [esi + 000000088h]
    mov dword ptr [ecx + 4], edi
    mov dword ptr [eax + 48], edx
    jmp L52
L51:
    mov ecx, dword ptr [ecx + edx*4]
    cmp dword ptr [ecx + 20], -1
    jne L53
    cmp dword ptr [ecx + 24], 0
    jne L53
    mov ecx, dword ptr [esi + 000000088h]
    mov dword ptr [edi + 4], ecx
    mov ecx, dword ptr [ebp - 48]
    mov dword ptr [eax + 48], ecx
L52:
    mov dword ptr [ebp - 32], 1
    jmp L56
L53:
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebp - 56]
    mov edx, dword ptr [ebp - 12]
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebp - 28], 0
    mov dword ptr [eax + edx*4], ecx
    jbe L55
L54:
    mov ecx, dword ptr [ebx + 12]
    imul ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [ebx + 8]
    mov edi, dword ptr [ebp - 8]
    add edi, ecx
    mov edi, dword ptr [eax + edi*4]
    add ecx, edx
    inc dword ptr [ebp - 20]
    mov dword ptr [eax + ecx*4], edi
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 28]
    jb L54
L55:
    inc edx
    mov dword ptr [ebp - 12], edx
L56:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebx + 12]
    jb L49
L57:
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebx + 12]
    je L73
    mov edx, dword ptr [ebp - 28]
    and dword ptr [ebp - 20], 0
    test edx, edx
    jbe L59
    and dword ptr [ebp - 28], 0
    shl eax, 2
    mov dword ptr [ebp - 48], eax
L58:
    mov esi, dword ptr [ebx + 12]
    imul esi, dword ptr [ebp - 20]
    mov eax, dword ptr [ebx + 8]
    mov edi, dword ptr [ebp - 28]
    mov ecx, dword ptr [ebp - 48]
    add edi, eax
    lea esi, [eax + esi*4]
    mov eax, ecx
    add dword ptr [ebp - 28], eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    inc dword ptr [ebp - 20]
    cmp dword ptr [ebp - 20], edx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jb L58
L59:
    mov ecx, dword ptr [ebp - 12]
    test ecx, ecx
    je L60
    mov eax, dword ptr [ebx]
    xor eax, ecx
    and eax, 0000FFFFFh
    xor eax, dword ptr [ebx]
    jmp L61
L60:
    xor eax, eax
L61:
    mov esi, dword ptr [ebp - 52]
    imul edx, ecx
    mov dword ptr [ebx + 12], ecx
    mov dword ptr [ebx + 4], edx
    jmp L71
L62:
    xor edi, edi
    cmp edi, dword ptr [ebx + 12]
    mov dword ptr [ebp - 44], edi
    mov dword ptr [ebp - 20], edi
    jae L70
L63:
    mov ecx, dword ptr [ebp - 20]
    mov edx, dword ptr [ebx + 16]
    mov eax, dword ptr [esi + 20]
    shl ecx, 2
    mov edx, dword ptr [ecx + edx]
    mov edx, dword ptr [eax + edx*4]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [ebx + 8]
    mov edx, dword ptr [ecx + edx]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [esi + 16]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    mov eax, dword ptr [ebp - 48]
    je L66
    cmp dword ptr [eax + 8], -1
    jne L66
    mov edx, dword ptr [ebp - 28]
    or byte ptr [edx], 000000080h
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L64
    fld1
    jmp L65
L64:
    fldz
L65:
    fstp qword ptr [edx + 32]
    jmp L68
L66:
    mov eax, dword ptr [eax]
    test al, 4
    je L67
    test al, 8
    je L67
    mov edx, dword ptr [ebp - 28]
    or byte ptr [edx], 000000080h
    jmp L64
L67:
    mov edx, dword ptr [ebp - 28]
    and byte ptr [edx], 127
L68:
    test byte ptr [edx], 000000080h
    jne L69
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [ecx + eax]
    shl edi, 2
    mov dword ptr [edi + eax], edx
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx + eax]
    mov dword ptr [edi + eax], ecx
    mov edi, dword ptr [ebp - 44]
    inc edi
    mov dword ptr [ebp - 44], edi
L69:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebx + 12]
    jb L63
    cmp edi, dword ptr [ebx + 12]
L70:
    je L73
    mov ecx, edi
    and ecx, 0000FFFFFh
    mov eax, edi
    or ecx, 010F00000h
    neg eax
    sbb eax, eax
    and eax, ecx
    mov dword ptr [ebx + 4], edi
    mov dword ptr [ebx + 12], edi
L71:
    mov dword ptr [ebx], eax
L72:
    mov dword ptr [ebp - 4], 1
L73:
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [esi + 12]
    jb L23
    cmp dword ptr [ebp - 32], 0
    je L74
    mov ecx, esi
    call sub_1008B639
L74:
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    pop edi
    pop esi
    sete al
    pop ebx
    leave
    ret
FUN_1008cb4b ENDP
END
