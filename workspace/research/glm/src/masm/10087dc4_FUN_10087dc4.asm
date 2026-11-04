.686
.MODEL FLAT, C
EXTRN sub_1008652B:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_10087dc4 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx*4]
    cmp dword ptr [eax + 8], -1
    mov dword ptr [ebp - 12], edi
    jne L1
    test byte ptr [eax], 1
    je L1
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx + 4], 2
    jne L2
L1:
    mov eax, 080004005h
    jmp L42
L2:
    mov ecx, dword ptr [edi + 24]
    mov eax, dword ptr [eax + 72]
    mov edx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edx + 12]
    xor ecx, ecx
    test eax, eax
    push esi
    jbe L4
    mov esi, dword ptr [edx + 16]
L3:
    cmp dword ptr [esi], ebx
    je L4
    inc ecx
    add esi, 4
    cmp ecx, eax
    jb L3
L4:
    cmp ecx, eax
    je L40
    mov esi, dword ptr [edx]
    and esi, 0FFF00000h
    cmp esi, 010000000h
    jne L5
    push dword ptr [ebp + 28]
    mov eax, dword ptr [edx + 8]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [eax + ecx*4]
    jmp L6
L5:
    cmp esi, 020500000h
    jne L7
    push dword ptr [ebp + 28]
    mov edx, dword ptr [edx + 8]
    push dword ptr [ebp + 24]
    mov esi, dword ptr [edx + ecx*4]
    push dword ptr [ebp + 20]
    add eax, ecx
    push dword ptr [ebp + 16]
    mov ebx, dword ptr [edx + eax*4]
    push dword ptr [ebp + 12]
    mov ecx, edi
    push esi
    call L0
    test eax, eax
    jl L41
    cmp esi, ebx
    je L12
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push ebx
L6:
    mov ecx, edi
    call L0
    test eax, eax
    jl L41
    jmp L12
L7:
    cmp esi, 020200000h
    jne L13
    mov edx, dword ptr [edx + 8]
    mov esi, dword ptr [edx + ecx*4]
    add eax, ecx
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, -1
    mov ebx, 000000100h
    je L8
    cmp edx, eax
    jne L9
L8:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 20], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test dword ptr [eax + 4], ebx
    je L9
    mov eax, dword ptr [ebp + 20]
    cmp dword ptr [eax + 8], -1
    jne L9
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [ecx]
    cmp eax, -1
    je L15
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    fld qword ptr [eax + 32]
    mov edi, dword ptr [edi + esi*4]
    fcomp qword ptr [edi + 32]
    fnstsw ax
    test ah, 5
    jp L12
    jmp L15
L9:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L10
    cmp esi, eax
    jne L40
L10:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 20], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test dword ptr [eax + 4], ebx
    je L40
    mov eax, dword ptr [ebp + 20]
    cmp dword ptr [eax + 8], -1
    jne L40
    mov ecx, dword ptr [ebp + 28]
    mov eax, dword ptr [ecx]
    cmp eax, -1
    je L11
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    fld qword ptr [eax + 32]
    mov edi, dword ptr [edi + edx*4]
    fcomp qword ptr [edi + 32]
    fnstsw ax
    test ah, 65
    jne L12
L11:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], esi
    mov dword ptr [ecx], edx
L12:
    xor eax, eax
    jmp L41
L13:
    cmp esi, 020300000h
    jne L18
    mov edx, dword ptr [edx + 8]
    mov esi, dword ptr [edx + ecx*4]
    add eax, ecx
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, -1
    mov ebx, 000000100h
    je L14
    cmp edx, eax
    jne L16
L14:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 28], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test dword ptr [eax + 4], ebx
    je L16
    mov eax, dword ptr [ebp + 28]
    cmp dword ptr [eax + 8], -1
    jne L16
    mov ecx, dword ptr [ebp + 24]
    mov eax, dword ptr [ecx]
    cmp eax, -1
    je L15
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    fld qword ptr [eax + 32]
    mov edi, dword ptr [edi + esi*4]
    fcomp qword ptr [edi + 32]
    fnstsw ax
    test ah, 65
    jne L12
L15:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], edx
    mov dword ptr [ecx], esi
    jmp L12
L16:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L17
    cmp esi, eax
    jne L40
L17:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 28], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test dword ptr [eax + 4], ebx
    je L40
    mov eax, dword ptr [ebp + 28]
    cmp dword ptr [eax + 8], -1
    jne L40
    mov ecx, dword ptr [ebp + 20]
    mov eax, dword ptr [ecx]
    cmp eax, -1
    je L11
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    fld qword ptr [eax + 32]
    mov edi, dword ptr [edi + edx*4]
    fcomp qword ptr [edi + 32]
    fnstsw ax
    test ah, 5
    jp L12
    jmp L11
L18:
    cmp esi, 030000000h
    jne L40
    mov eax, dword ptr [edx + 12]
    mov esi, dword ptr [edx + 8]
    mov edi, dword ptr [edi + 20]
    lea ebx, [ecx + eax]
    mov ebx, dword ptr [esi + ebx*4]
    mov ebx, dword ptr [edi + ebx*4]
    lea eax, [ecx + eax*2]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [edi + eax*4]
    mov esi, dword ptr [ebp - 12]
    mov edi, dword ptr [esi + 16]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [edi + eax*4]
    mov dword ptr [ebp - 8], ebx
    mov ebx, 000000100h
    test dword ptr [eax + 4], ebx
    je L40
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [eax + 8], -1
    jne L40
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test dword ptr [eax + 4], ebx
    je L40
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 8], -1
    jne L40
    mov eax, dword ptr [ebp - 8]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L19
    mov eax, dword ptr [ebp + 8]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L20
L19:
    mov eax, dword ptr [ebp - 8]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L40
    mov eax, dword ptr [ebp + 8]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L40
L20:
    mov eax, dword ptr [edx + 8]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 4], 2
    je L40
    mov edx, dword ptr [eax + 72]
    mov eax, dword ptr [esi + 24]
    mov edi, dword ptr [eax + edx*4]
    mov eax, dword ptr [edi]
    and eax, 0FFF00000h
    cmp eax, 020400000h
    mov dword ptr [ebp - 4], eax
    je L21
    cmp eax, 010100000h
    jne L40
L21:
    mov eax, dword ptr [edi + 12]
    and dword ptr [ebp + 8], 0
    test eax, eax
    jbe L23
    mov edx, dword ptr [edi + 16]
    mov dword ptr [ebp - 12], edx
L22:
    mov edx, dword ptr [ebp - 12]
    cmp dword ptr [edx], ecx
    je L23
    inc dword ptr [ebp + 8]
    add dword ptr [ebp - 12], 4
    cmp dword ptr [ebp + 8], eax
    jb L22
L23:
    cmp dword ptr [ebp - 4], 010100000h
    jne L24
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_1008652B
    mov ecx, dword ptr [ebp + 8]
    mov edx, eax
    cmp edx, -1
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + ecx*4]
    jne L32
    mov eax, 08007000Eh
    jmp L41
L24:
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [edi + 8]
    mov edx, eax
    neg edx
    shl edx, 2
    add ecx, eax
    lea ecx, [edi + ecx*4]
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 12], ecx
L25:
    mov ecx, dword ptr [ebp - 12]
    mov edi, dword ptr [ecx]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edi*4]
    mov dword ptr [ebp - 20], edi
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [ebp - 16], ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edi*4]
    test byte ptr [ecx + 4], 2
    je L26
    mov ecx, dword ptr [ebp - 16]
    mov edi, dword ptr [ecx + 72]
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + edi*4]
    mov edi, dword ptr [ecx]
    and edi, 0FFF00000h
    cmp edi, 010100000h
    je L27
L26:
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 12], edx
    cmp dword ptr [ebp - 4], 2
    jb L25
    mov edx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 12]
    jmp L31
L27:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ecx + 12], 0
    jbe L30
    mov edx, dword ptr [ecx + 16]
    jmp L29
L28:
    mov edx, dword ptr [ebp - 16]
L29:
    mov edi, dword ptr [ebp - 20]
    cmp edi, dword ptr [edx]
    je L30
    inc dword ptr [ebp - 12]
    add edx, 4
    mov dword ptr [ebp - 16], edx
    mov edx, dword ptr [ebp - 12]
    cmp edx, dword ptr [ecx + 12]
    jb L28
L30:
    imul eax, dword ptr [ebp - 4]
    add eax, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp - 24]
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 12]
    mov ecx, dword ptr [eax + ecx*4]
L31:
    cmp dword ptr [ebp - 4], 2
    je L40
L32:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L33
    cmp edx, eax
    jne L36
L33:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [esi + 16]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test dword ptr [eax + 4], ebx
    je L36
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 8], -1
    jne L36
    mov eax, dword ptr [ebp - 8]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L34
    mov edi, dword ptr [ebp + 20]
    mov eax, dword ptr [edi]
    cmp eax, -1
    je L35
    mov esi, dword ptr [esi + 20]
    mov eax, dword ptr [esi + eax*4]
    fld qword ptr [eax + 32]
    mov esi, dword ptr [esi + ecx*4]
    fcomp qword ptr [esi + 32]
    fnstsw ax
    test ah, 5
    jp L12
    jmp L35
L34:
    mov edi, dword ptr [ebp + 28]
    mov eax, dword ptr [edi]
    cmp eax, -1
    je L35
    mov esi, dword ptr [esi + 20]
    mov eax, dword ptr [esi + eax*4]
    fld qword ptr [eax + 32]
    mov esi, dword ptr [esi + ecx*4]
    fcomp qword ptr [esi + 32]
    fnstsw ax
    test ah, 65
    jne L12
L35:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], edx
    mov dword ptr [edi], ecx
    jmp L12
L36:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L37
    cmp ecx, eax
    jne L40
L37:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [esi + 16]
    mov dword ptr [ebp + 20], eax
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test dword ptr [eax + 4], ebx
    je L40
    mov eax, dword ptr [ebp + 20]
    cmp dword ptr [eax + 8], -1
    jne L40
    mov eax, dword ptr [ebp - 8]
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L38
    mov edi, dword ptr [ebp + 24]
    mov eax, dword ptr [edi]
    cmp eax, -1
    je L39
    mov esi, dword ptr [esi + 20]
    mov eax, dword ptr [esi + eax*4]
    fld qword ptr [eax + 32]
    mov esi, dword ptr [esi + edx*4]
    fcomp qword ptr [esi + 32]
    fnstsw ax
    test ah, 65
    jne L12
    jmp L39
L38:
    mov edi, dword ptr [ebp + 16]
    mov eax, dword ptr [edi]
    cmp eax, -1
    je L39
    mov esi, dword ptr [esi + 20]
    mov eax, dword ptr [esi + eax*4]
    fld qword ptr [eax + 32]
    mov esi, dword ptr [esi + edx*4]
    fcomp qword ptr [esi + 32]
    fnstsw ax
    test ah, 5
    jp L12
L39:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], ecx
    mov dword ptr [edi], edx
    jmp L12
L40:
    mov eax, 080004005h
L41:
    pop esi
L42:
    pop edi
    pop ebx
    leave
    ret 24
FUN_10087dc4 ENDP
END
