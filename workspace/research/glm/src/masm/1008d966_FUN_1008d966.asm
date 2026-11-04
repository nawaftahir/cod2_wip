.686
.MODEL FLAT, C
EXTRN sub_1008685E:PROC
EXTRN sub_1008B40D:PROC
EXTRN sub_1008B485:PROC
EXTRN sub_1008B4BC:PROC
EXTRN sub_100F68C2:PROC
EXTRN sub_100F8E93:PROC
EXTRN sub_100F90A7:PROC
EXTRN sub_100F912B:PROC
EXTRN sub_100F9149:PROC
EXTRN g_1010F7A8:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
EXTRN g_1019BEB8:DWORD
.CODE
FUN_1008d966 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov edx, dword ptr [ebp + 12]
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp + 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 48]
    mov ebx, dword ptr [eax + edx*4]
    push edi
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [ebp + 16], ecx
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    test al, 1
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 36], edi
    je L64
    test ah, 16
    jne L64
    mov eax, dword ptr [edi]
    mov ecx, eax
    and ecx, 31
    mov dword ptr [ebp + 12], ecx
    mov ecx, dword ptr [ebx]
    mov edx, ecx
    and edx, 64
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [ebp + 8]
    mov edx, dword ptr [edx]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    mov dword ptr [ebp - 8], edx
    jne L0
    or ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebx], ecx
    jmp L63
L0:
    and eax, 64
    or eax, ecx
    test eax, 00E000000h
    mov dword ptr [ebx], eax
    jne L2
    cmp edx, 010100000h
    je L1
    cmp edx, 010300000h
    je L1
    cmp edx, 010400000h
    je L1
    cmp edx, 010D00000h
    je L1
    cmp edx, 010E00000h
    jne L2
L1:
    mov ecx, dword ptr [edi]
    and ecx, 00E000000h
    or ecx, eax
    mov dword ptr [ebx], ecx
L2:
    cmp edx, 010100000h
    push 4
    pop eax
    je L6
    cmp edx, 010300000h
    je L3
    cmp edx, 010400000h
    je L4
    cmp edx, 010500000h
    je L4
    cmp edx, 010700000h
    jne L7
    jmp L4
L3:
    test byte ptr [ebp + 12], 4
    je L5
    test byte ptr [ebp + 12], 8
    je L5
L4:
    or dword ptr [ebx], eax
    jmp L7
L5:
    mov eax, dword ptr [ebp + 12]
    and eax, 12
    jmp L4
L6:
    mov ecx, dword ptr [ebp + 12]
    shr ecx, 1
    and ecx, eax
    mov eax, dword ptr [ebp + 12]
    and eax, 4
    shl eax, 1
    or ecx, eax
    mov eax, dword ptr [ebp + 12]
    and eax, 0FFFFFFF3h
    or ecx, eax
    or dword ptr [ebx], ecx
L7:
    mov ecx, dword ptr [edi + 4]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax + 4]
    test ch, 1
    je L30
    cmp dword ptr [edi + 8], -1
    jne L30
    mov eax, 010800000h
    xor ecx, ecx
    cmp edx, eax
    ja L18
    je L17
    cmp edx, 010100000h
    je L16
    cmp edx, 010300000h
    je L14
    cmp edx, 010400000h
    je L13
    cmp edx, 010500000h
    je L12
    cmp edx, 010600000h
    je L9
    cmp edx, 010700000h
    jne L64
    cmp dword ptr [ebp - 4], ecx
    jne L8
    fldz
    fcomp qword ptr [edi + 32]
    fnstsw ax
    test ah, 65
    jne L8
    push 010110660h
    push 000000FA3h
    jmp L25
L8:
    fld qword ptr [edi + 32]
    fsqrt
    fdivr qword ptr [g_1019BC88]
    jmp L29
L9:
    cmp dword ptr [ebp - 4], ecx
    jne L10
    fld qword ptr [g_1019BE20]
    fld qword ptr [edi + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L64
L10:
    fldz
    fcomp qword ptr [edi + 32]
    fnstsw ax
    test ah, 65
    jne L11
    push 010110648h
    push 000000FA2h
    jmp L25
L11:
    fld qword ptr [edi + 32]
    fldln2
    fxch st(1)
    fyl2x
    fld qword ptr [g_1010F7A8]
    fldln2
    fxch st(1)
    fyl2x
    fdivp st(1)
    jmp L29
L12:
    fld qword ptr [g_1010F7A8]
    fld qword ptr [edi + 32]
    call sub_100F9149
    jmp L29
L13:
    fld qword ptr [edi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_100F8E93
    test eax, eax
    pop ecx
    pop ecx
    je L26
    fld qword ptr [edi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_100F68C2
    fsubr qword ptr [edi + 32]
    pop ecx
    pop ecx
    jmp L29
L14:
    cmp dword ptr [ebp - 4], ecx
    jne L15
    fld qword ptr [edi + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L26
L15:
    fld1
    fdiv qword ptr [edi + 32]
    jmp L29
L16:
    fld qword ptr [edi + 32]
    fchs
    jmp L29
L17:
    fld qword ptr [edi + 32]
    fsin
    jmp L29
L18:
    cmp edx, 010900000h
    je L28
    cmp edx, 010A00000h
    je L23
    cmp edx, 010B00000h
    je L20
    cmp edx, 010C00000h
    je L19
    cmp edx, 010D00000h
    je L26
    cmp edx, 010E00000h
    jne L64
    jmp L26
L19:
    fld qword ptr [edi + 32]
    fld1
    fpatan
    jmp L29
L20:
    cmp dword ptr [ebp - 4], ecx
    jne L22
    fld qword ptr [edi + 32]
    fcomp qword ptr [g_1019BEB8]
    fnstsw ax
    test ah, 5
    jnp L21
    fld qword ptr [edi + 32]
    fcomp qword ptr [g_1019BC88]
    fnstsw ax
    test ah, 65
    jne L22
L21:
    push 010110630h
    push 000000FA6h
    jmp L25
L22:
    fld qword ptr [edi + 32]
    call sub_100F912B
    jmp L29
L23:
    cmp dword ptr [ebp - 4], ecx
    jne L27
    fld qword ptr [edi + 32]
    fcomp qword ptr [g_1019BEB8]
    fnstsw ax
    test ah, 5
    jnp L24
    fld qword ptr [edi + 32]
    fcomp qword ptr [g_1019BC88]
    fnstsw ax
    test ah, 65
    jne L27
L24:
    push 01011061Ch
    push 000000FA5h
L25:
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 60]
    push esi
    call sub_1008B40D
    add esp, 16
L26:
    fldz
    jmp L29
L27:
    fld qword ptr [edi + 32]
    call sub_100F90A7
    jmp L29
L28:
    fld qword ptr [edi + 32]
    fcos
L29:
    push ecx
    push ecx
    fstp qword ptr [esp]
    jmp L61
L30:
    mov al, byte ptr [ebp + 12]
    test al, 1
    je L31
    cmp edx, 010400000h
    je L60
L31:
    test al, 2
    je L32
    cmp edx, 010400000h
    je L60
L32:
    test al, 8
    je L34
    cmp edx, 010600000h
    je L33
    cmp edx, 010700000h
    jne L34
    xor edi, edi
    cmp dword ptr [ebp - 4], edi
    jne L64
    mov eax, dword ptr [ebp + 8]
    push 010110660h
    push 000000FA3h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B485
    fldz
    add esp, 8
    fstp qword ptr [esp]
    push edi
    push edi
    jmp L62
L33:
    cmp dword ptr [ebp - 4], 0
    jne L64
    test al, 4
    jne L64
    mov eax, dword ptr [ebp + 8]
    push 010110648h
    push 000000FA2h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B4BC
    add esp, 16
    jmp L64
L34:
    test ch, 2
    je L35
    cmp edx, 010D00000h
    je L60
    cmp edx, 010E00000h
    je L60
L35:
    cmp dword ptr [ebp - 4], 0
    jne L64
    test cl, 2
    je L64
    cmp edx, 010100000h
    mov edx, 0FFF00000h
    jne L36
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [edi + 72]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 010100000h
    je L39
L36:
    cmp dword ptr [ebp - 8], 010300000h
    jne L37
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [edi + 72]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 010300000h
    je L39
L37:
    cmp dword ptr [ebp - 8], 010500000h
    jne L38
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [edi + 72]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 010600000h
    je L39
L38:
    cmp dword ptr [ebp - 8], 010600000h
    jne L44
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [edi + 72]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 010500000h
    jne L44
L39:
    and dword ptr [ebp + 8], 0
    cmp dword ptr [eax + 12], 0
    jbe L42
    mov ecx, dword ptr [eax + 16]
    jmp L41
L40:
    mov ecx, dword ptr [ebp + 12]
L41:
    mov edx, dword ptr [ebp + 16]
    cmp dword ptr [ecx], edx
    je L42
    inc dword ptr [ebp + 8]
    add ecx, 4
    mov dword ptr [ebp + 12], ecx
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, dword ptr [eax + 12]
    jb L40
L42:
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, dword ptr [eax + 12]
    jae L43
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 48]
    jmp L63
L43:
    mov edx, 0FFF00000h
L44:
    cmp dword ptr [ebp - 8], 010300000h
    jne L51
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [edi + 72]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx]
    and eax, edx
    cmp eax, 020500000h
    jne L51
    mov edi, dword ptr [ecx + 12]
    xor edx, edx
    test edi, edi
    jbe L46
    mov eax, dword ptr [ecx + 16]
L45:
    mov ebx, dword ptr [eax]
    cmp ebx, dword ptr [ebp + 16]
    je L46
    inc edx
    add eax, 4
    cmp edx, edi
    jb L45
L46:
    mov eax, dword ptr [ecx + 12]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + 8]
    and dword ptr [ebp + 12], 0
    mov dword ptr [ebp - 16], edi
    mov edi, eax
    shl edi, 2
    mov dword ptr [ebp - 32], edi
    mov edi, eax
    neg edi
    shl edi, 2
    lea ebx, [ecx + edx*4]
    add eax, edx
    lea ecx, [ecx + eax*4]
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 12], ecx
    mov edx, 0FFF00000h
L47:
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [ebx]
    mov dword ptr [ebp - 28], ecx
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test byte ptr [eax + 4], 2
    je L50
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 72]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 010700000h
    jne L50
    and dword ptr [ebp + 8], 0
    cmp dword ptr [eax + 12], 0
    jbe L49
    mov ecx, dword ptr [eax + 16]
L48:
    mov ebx, dword ptr [ecx]
    cmp ebx, dword ptr [ebp - 20]
    je L49
    inc dword ptr [ebp + 8]
    mov ebx, dword ptr [eax + 12]
    add ecx, 4
    cmp dword ptr [ebp + 8], ebx
    jb L48
L49:
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 28]
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [eax + ebx*4], ecx
    je L55
    mov ebx, dword ptr [ebp - 4]
L50:
    mov ecx, dword ptr [ebp - 12]
    add ebx, dword ptr [ebp - 32]
    inc dword ptr [ebp + 12]
    add ecx, edi
    cmp dword ptr [ebp + 12], 2
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 12], ecx
    jb L47
    mov ebx, dword ptr [ebp - 24]
    mov edi, dword ptr [ebp - 36]
L51:
    cmp dword ptr [ebp - 8], 010500000h
    jne L64
    mov ecx, dword ptr [edi + 72]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 020500000h
    jne L64
    mov ecx, dword ptr [eax + 12]
    and dword ptr [ebp + 8], 0
    test ecx, ecx
    jbe L53
    mov edi, dword ptr [eax + 16]
    mov dword ptr [ebp + 12], edi
L52:
    mov edi, dword ptr [ebp + 12]
    mov edi, dword ptr [edi]
    cmp edi, dword ptr [ebp + 16]
    je L53
    inc dword ptr [ebp + 8]
    add dword ptr [ebp + 12], 4
    cmp dword ptr [ebp + 8], ecx
    jb L52
L53:
    and dword ptr [ebp + 12], 0
    mov eax, dword ptr [eax + 8]
    mov edi, dword ptr [esi + 20]
    shl ecx, 2
    mov dword ptr [ebp - 32], ecx
    mov ecx, dword ptr [ebp + 8]
    lea eax, [eax + ecx*4]
    mov dword ptr [ebp + 16], eax
L54:
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edi + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test byte ptr [eax + 4], 2
    je L59
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 72]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 010600000h
    jne L59
    and dword ptr [ebp + 8], 0
    cmp dword ptr [eax + 12], 0
    jbe L58
    mov ecx, dword ptr [eax + 16]
    jmp L57
L55:
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 48]
    mov ecx, dword ptr [ebp - 24]
    mov dword ptr [ecx + 48], eax
    jmp L64
L56:
    mov ecx, dword ptr [ebp - 36]
L57:
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    cmp dword ptr [ecx], edi
    je L58
    inc dword ptr [ebp + 8]
    add ecx, 4
    mov dword ptr [ebp - 36], ecx
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, dword ptr [eax + 12]
    jb L56
L58:
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [eax]
    test al, 4
    je L59
    test al, 8
    jne L60
L59:
    mov eax, dword ptr [ebp + 16]
    add eax, dword ptr [ebp - 32]
    inc dword ptr [ebp + 12]
    cmp dword ptr [ebp + 12], 2
    mov dword ptr [ebp + 16], eax
    jb L54
    jmp L64
L60:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
L61:
    push 0
    push 0
L62:
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_1008685E
L63:
    mov dword ptr [ebx + 48], eax
L64:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret 12
FUN_1008d966 ENDP
END
