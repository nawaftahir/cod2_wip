.686
.MODEL FLAT, C
EXTRN sub_1008595E:PROC
EXTRN sub_100859BB:PROC
EXTRN sub_100859FB:PROC
EXTRN sub_10085E58:PROC
EXTRN sub_1008E6D6:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_1008f014 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000A0h
    push ebx
    push esi
    push edi
    mov ebx, ecx
    mov dword ptr [ebp - 32], ebx
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [ebp + 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 48]
    mov ecx, dword ptr [ebp + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov esi, dword ptr [ecx + 48]
    mov ecx, dword ptr [ebp + 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp + 16], edx
    mov edx, dword ptr [eax + edx*4]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [eax + esi*4]
    mov edi, dword ptr [ecx + 48]
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 12], edx
    mov dword ptr [ebp + 20], esi
    mov esi, dword ptr [eax + edi*4]
    mov eax, dword ptr [ecx]
    mov edx, eax
    and edx, 64
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [ebp + 24], edi
    mov edi, dword ptr [ebx + 16]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 4]
    test dl, 1
    mov dword ptr [ebp - 36], esi
    je L15
    test dh, 16
    jne L15
    test eax, 00E000000h
    jne L4
    mov edx, dword ptr [ebp + 8]
    mov edx, dword ptr [edx]
    and edx, 0FFF00000h
    cmp edx, 030000000h
    jne L4
    mov edx, dword ptr [esi]
    mov edi, dword ptr [ebp - 12]
    or edx, dword ptr [edi]
    test edx, 008000000h
    je L0
    or eax, 008000000h
    jmp L2
L0:
    test edx, 004000000h
    je L1
    or eax, 004000000h
    jmp L2
L1:
    test edx, 002000000h
    je L3
    or eax, 002000000h
L2:
    mov dword ptr [ecx], eax
L3:
    mov eax, dword ptr [esi]
    and eax, dword ptr [edi]
    and eax, 31
    or dword ptr [ecx], eax
    jmp L5
L4:
    mov edi, dword ptr [ebp - 12]
L5:
    mov eax, dword ptr [esi]
    or eax, dword ptr [edi]
    test al, 64
    je L6
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 030000000h
    jne L6
    or dword ptr [ecx], 64
L6:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 030000000h
    jne L8
    mov eax, dword ptr [esi]
    and eax, dword ptr [edi]
    mov edx, dword ptr [ebp + 16]
    and eax, 31
    or dword ptr [ecx], eax
    cmp edx, dword ptr [ebp + 20]
    mov eax, dword ptr [ecx]
    jne L7
    test byte ptr [esi], 4
    je L7
    or eax, 4
    mov dword ptr [ecx], eax
L7:
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ebp + 24]
    jne L8
    test byte ptr [edi], 8
    je L8
    or dword ptr [ecx], 8
L8:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 030000000h
    jne L15
    cmp dword ptr [ebp - 8], 0
    mov edi, dword ptr [ebp - 28]
    jne L10
    test byte ptr [edi], 4
    je L10
L9:
    mov eax, dword ptr [ebp + 20]
    jmp L26
L10:
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    mov dword ptr [ebp - 16], eax
    je L11
    cmp dword ptr [edi + 8], -1
    jne L11
    fld qword ptr [edi + 32]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 1
    mov eax, dword ptr [ebp + 20]
    je L26
    mov eax, dword ptr [ebp + 24]
    jmp L26
L11:
    mov eax, dword ptr [ebp + 20]
    cmp eax, dword ptr [ebp + 24]
    je L26
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 4]
    and edx, 000000100h
    mov dword ptr [ebp - 20], edx
    je L12
    mov edx, dword ptr [ebp - 12]
    cmp dword ptr [edx + 8], -1
    jne L12
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 5], 1
    je L12
    cmp dword ptr [esi + 8], -1
    jne L12
    mov eax, dword ptr [ebp - 12]
    fld qword ptr [esi + 32]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L9
L12:
    cmp dword ptr [ebp - 8], 0
    jne L15
    mov eax, dword ptr [edi + 8]
    cmp eax, -1
    jne L18
    test byte ptr [ebp - 16], 2
    je L18
    mov eax, dword ptr [edi + 72]
    mov edx, dword ptr [ebx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010100000h
    jne L18
    cmp dword ptr [ebp - 20], 0
    je L18
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [eax + 8], -1
    jne L18
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L18
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 5], 1
    je L18
    cmp dword ptr [esi + 8], -1
    jne L18
    fld qword ptr [esi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L18
    mov edi, dword ptr [ebp - 8]
    xor edx, edx
    cmp dword ptr [edi + 12], edx
    jbe L14
    mov eax, dword ptr [edi + 16]
    mov dword ptr [ebp - 4], eax
L13:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ebp + 16]
    je L14
    add dword ptr [ebp - 4], 4
    inc edx
    cmp edx, dword ptr [edi + 12]
    jb L13
L14:
    mov edi, dword ptr [edi + 8]
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax], 1
    je L17
    mov dword ptr [ecx + 48], edx
L15:
    xor eax, eax
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
L17:
    mov edi, dword ptr [ebp - 28]
L18:
    cmp dword ptr [edi + 8], -1
    jne L15
    test byte ptr [ebp - 16], 2
    je L24
    mov eax, dword ptr [edi + 72]
    mov edx, dword ptr [ebx + 24]
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [edx]
    and eax, 0FFF00000h
    cmp eax, 020500000h
    jne L24
    cmp dword ptr [ebp - 20], 0
    je L24
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [eax + 8], -1
    jne L24
    fld qword ptr [eax + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L24
    mov edi, dword ptr [esi + 4]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edi*4]
    test byte ptr [eax + 5], 1
    je L23
    cmp dword ptr [esi + 8], -1
    jne L23
    fld qword ptr [esi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L23
    mov esi, dword ptr [edx + 12]
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L20
    mov eax, dword ptr [edx + 16]
L19:
    mov edi, dword ptr [eax]
    cmp edi, dword ptr [ebp + 16]
    je L20
    inc dword ptr [ebp - 4]
    add eax, 4
    cmp dword ptr [ebp - 4], esi
    jb L19
L20:
    mov eax, dword ptr [edx + 12]
    mov esi, dword ptr [ebx + 20]
    mov edx, dword ptr [edx + 8]
    mov ebx, dword ptr [ebp - 4]
    and dword ptr [ebp - 8], 0
    mov edi, eax
    shl edi, 2
    mov dword ptr [ebp - 44], edi
    lea ebx, [edx + ebx*4]
    mov edi, eax
    neg edi
    mov dword ptr [ebp - 24], ebx
    mov ebx, dword ptr [ebp - 4]
    shl edi, 2
    add eax, ebx
    mov ebx, dword ptr [ebp - 32]
    lea edx, [edx + eax*4]
    mov dword ptr [ebp - 4], edx
L21:
    mov eax, dword ptr [ebp - 24]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [eax + 48]
    mov edx, dword ptr [esi + edx*4]
    mov edx, dword ptr [edx + 48]
    mov edx, dword ptr [esi + edx*4]
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax], 1
    mov dword ptr [ebp - 32], edx
    je L22
    mov edx, dword ptr [edx + 4]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 5], 1
    je L22
    mov eax, dword ptr [ebp - 32]
    cmp dword ptr [eax + 8], -1
    jne L22
    fld qword ptr [eax + 32]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 5
    jnp L25
L22:
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 44]
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 24], eax
    add edx, edi
    cmp dword ptr [ebp - 8], 2
    mov dword ptr [ebp - 4], edx
    jb L21
    mov esi, dword ptr [ebp - 36]
L23:
    mov edi, dword ptr [ebp - 28]
L24:
    cmp dword ptr [edi + 8], -1
    jne L15
    test byte ptr [ebp - 16], 2
    je L15
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [edi + 72]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 020400000h
    jne L15
    or dword ptr [ebp - 16], 0FFFFFFFFh
    cmp dword ptr [ebp - 20], 0
    je L28
    mov edi, dword ptr [ebp - 12]
    cmp dword ptr [edi + 8], -1
    jne L28
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 5], 1
    je L28
    cmp dword ptr [esi + 8], -1
    jne L28
    fld qword ptr [edi + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L27
    fld qword ptr [esi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L27
    mov dword ptr [ebp - 16], 020200001h
    jmp L28
L25:
    mov eax, dword ptr [ebp - 40]
L26:
    mov dword ptr [ecx + 48], eax
    jmp L15
L27:
    fld qword ptr [edi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L28
    fld qword ptr [esi + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L28
    mov dword ptr [ebp - 16], 020300001h
L28:
    mov esi, dword ptr [ecx + 12]
    xor edx, edx
    test esi, esi
    jbe L30
    mov eax, dword ptr [ecx + 16]
L29:
    mov edi, dword ptr [eax]
    cmp edi, dword ptr [ebp + 16]
    je L30
    inc edx
    add eax, 4
    cmp edx, esi
    jb L29
L30:
    mov eax, dword ptr [ecx + 12]
    mov ecx, dword ptr [ecx + 8]
    and dword ptr [ebp + 16], 0
    mov esi, eax
    shl esi, 2
    mov dword ptr [ebp - 36], esi
    mov esi, eax
    neg esi
    shl esi, 2
    lea edi, [ecx + edx*4]
    add eax, edx
    lea ecx, [ecx + eax*4]
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 4], ecx
L31:
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [edi]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 8], -1
    jne L36
    mov edi, dword ptr [eax + 4]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx + edi*4]
    test byte ptr [ecx + 4], 2
    je L36
    mov ecx, dword ptr [eax + 72]
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 010100000h
    jne L36
    xor ecx, ecx
    cmp dword ptr [eax + 12], ecx
    jbe L34
    mov edi, dword ptr [eax + 16]
    jmp L33
L32:
    mov edi, dword ptr [ebp - 40]
L33:
    cmp dword ptr [edi], edx
    je L34
    inc ecx
    add edi, 4
    cmp ecx, dword ptr [eax + 12]
    mov dword ptr [ebp - 40], edi
    jb L32
L34:
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov edi, dword ptr [eax + 48]
    mov eax, dword ptr [ebp - 16]
    cmp eax, -1
    mov dword ptr [ebp - 20], eax
    jne L39
    mov eax, dword ptr [ebp + 20]
    cmp eax, edi
    jne L35
    mov ecx, dword ptr [ebp + 24]
    cmp ecx, dword ptr [ebp - 8]
    je L37
L35:
    cmp eax, dword ptr [ebp - 8]
    jne L36
    cmp dword ptr [ebp + 24], edi
    je L38
L36:
    mov edi, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 4]
    add edi, dword ptr [ebp - 36]
    inc dword ptr [ebp + 16]
    add ecx, esi
    cmp dword ptr [ebp + 16], 2
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 4], ecx
    jb L31
    jmp L15
L37:
    mov dword ptr [ebp - 20], 020000001h
    jmp L39
L38:
    mov dword ptr [ebp - 20], 020100001h
L39:
    lea ecx, [ebp - 0000000A0h]
    call sub_1008595E
    push 0
    push 1
    push 2
    push dword ptr [ebp - 20]
    lea ecx, [ebp - 0000000A0h]
    call sub_10085E58
    test eax, eax
    jl L40
    push dword ptr [ebp + 8]
    lea ecx, [ebp - 0000000A0h]
    call sub_100859BB
    test eax, eax
    jl L40
    mov eax, dword ptr [ebp - 000000090h]
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ebp - 000000098h]
    mov eax, dword ptr [ebp - 8]
    push edi
    push eax
    mov dword ptr [edx], eax
    mov edx, dword ptr [ebp - 000000098h]
    push ecx
    lea eax, [ebp - 0000000A0h]
    push eax
    mov ecx, ebx
    mov dword ptr [edx + 4], edi
    call sub_1008E6D6
L40:
    lea ecx, [ebp - 0000000A0h]
    mov esi, eax
    call sub_100859FB
    mov eax, esi
    jmp L16
FUN_1008f014 ENDP
END
