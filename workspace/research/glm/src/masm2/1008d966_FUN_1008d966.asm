.686
.MODEL FLAT, C
EXTRN sub_1008685E:PROC
EXTRN sub_1008B40D:PROC
EXTRN sub_1008B485:PROC
EXTRN sub_1008B4BC:PROC
EXTRN sub_1008E0CD:PROC
EXTRN sub_1008E0D6:PROC
EXTRN sub_1008E0EC:PROC
EXTRN sub_1008E10A:PROC
EXTRN sub_1008E114:PROC
EXTRN sub_1008E124:PROC
EXTRN sub_1008E1A6:PROC
EXTRN sub_1008E213:PROC
EXTRN sub_1008E227:PROC
EXTRN sub_1008E24F:PROC
EXTRN sub_1008E272:PROC
EXTRN sub_1008E282:PROC
EXTRN sub_1008E28B:PROC
EXTRN sub_1008E2A0:PROC
EXTRN sub_1008E2BE:PROC
EXTRN sub_1008E2FD:PROC
EXTRN sub_1008E310:PROC
EXTRN sub_1008E312:PROC
EXTRN sub_1008E315:PROC
EXTRN sub_1008E31F:PROC
EXTRN sub_1008E327:PROC
EXTRN sub_1008E354:PROC
EXTRN sub_1008E35F:PROC
EXTRN sub_1008E3E0:PROC
EXTRN sub_1008E3E3:PROC
EXTRN sub_1008E3EA:PROC
EXTRN sub_1008E3F5:PROC
EXTRN sub_1008E401:PROC
EXTRN sub_1008E411:PROC
EXTRN sub_1008E448:PROC
EXTRN sub_1008E460:PROC
EXTRN sub_1008E477:PROC
EXTRN sub_1008E47F:PROC
EXTRN sub_1008E483:PROC
EXTRN sub_1008E496:PROC
EXTRN sub_1008E49B:PROC
EXTRN sub_1008E49D:PROC
EXTRN sub_1008E4A2:PROC
EXTRN sub_1008E4C4:PROC
EXTRN sub_1008E4CD:PROC
EXTRN sub_1008E4E2:PROC
EXTRN sub_1008E4E9:PROC
EXTRN sub_1008E4F6:PROC
EXTRN sub_1008E4F9:PROC
EXTRN sub_1008E500:PROC
EXTRN sub_1008E501:PROC
EXTRN sub_1008E58C:PROC
EXTRN sub_1008E5F8:PROC
EXTRN sub_1008E5FA:PROC
EXTRN sub_1008E5FE:PROC
EXTRN sub_1008E608:PROC
EXTRN sub_1008E6A5:PROC
EXTRN sub_1008E6BE:PROC
EXTRN sub_1008E6D9:PROC
EXTRN sub_1008E6E4:PROC
EXTRN sub_1008E6E5:PROC
EXTRN sub_1008E6EE:PROC
EXTRN sub_1008E6FD:PROC
EXTRN sub_1008E707:PROC
EXTRN sub_1008E713:PROC
EXTRN sub_1008E750:PROC
EXTRN sub_1008E752:PROC
EXTRN sub_1008E76E:PROC
EXTRN sub_1008E79E:PROC
EXTRN sub_100F68C2:PROC
EXTRN sub_100F8E93:PROC
EXTRN sub_100F90A7:PROC
EXTRN sub_100F912B:PROC
EXTRN sub_100F9149:PROC
EXTRN EXTRN g_1010F7A8:DWORD:DWORD
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_1008d966 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    mov mov edx, dword ptr [ebp + 12]
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov ebx, dword ptr [eax + edx*4]
    push push edi
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebx + 4]
    mov mov dword ptr [ebp + 16], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test al, 1
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 36], edi
    je sub_1008E0CD
    test test ah, 16
    jne sub_1008E0D6
    mov mov eax, dword ptr [edi]
    mov mov ecx, eax
    and and ecx, 31
    mov mov dword ptr [ebp + 12], ecx
    mov mov ecx, dword ptr [ebx]
    mov mov edx, ecx
    and and edx, 64
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [ebp + 8]
    mov mov edx, dword ptr [edx]
    and and edx, 0FFF00000h
    cmp cmp edx, 010000000h
    mov mov dword ptr [ebp - 8], edx
    jne L0
    or or ecx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebx], ecx
    jmp sub_1008E10A
    and and eax, 64
    or or eax, ecx
    test test eax, 0E000000h
    mov mov dword ptr [ebx], eax
    jne L2
    cmp cmp edx, 010100000h
    je L1
    cmp cmp edx, 010300000h
    je L3
    cmp cmp edx, 010400000h
    je L4
    cmp cmp edx, 010D00000h
    je L5
    cmp cmp edx, 010E00000h
    jne L6
    mov mov ecx, dword ptr [edi]
    and and ecx, 0E000000h
    or or ecx, eax
    mov mov dword ptr [ebx], ecx
    cmp cmp edx, 010100000h
    push push 4
    pop pop eax
    je L8
    cmp cmp edx, 010300000h
    je L7
    cmp cmp edx, 010400000h
    je L9
    cmp cmp edx, 010500000h
    je L10
    cmp cmp edx, 010700000h
    jne L15
    jmp L11
    test test byte ptr [ebp + 12], 4
    je L12
    test test byte ptr [ebp + 12], 8
    je L13
    or or dword ptr [ebx], eax
    jmp L16
    mov mov eax, dword ptr [ebp + 12]
    and and eax, 12
    jmp L14
    mov mov ecx, dword ptr [ebp + 12]
    shr shr ecx, 1
    and and ecx, eax
    mov mov eax, dword ptr [ebp + 12]
    and and eax, 4
    shl shl eax, 1
    or or ecx, eax
    mov mov eax, dword ptr [ebp + 12]
    and and eax, -13
    or or ecx, eax
    or or dword ptr [ebx], ecx
    mov mov ecx, dword ptr [edi + 4]
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax + 4]
    test test ch, 1
    je L28
    cmp cmp dword ptr [edi + 8], -1
    jne L29
    mov mov eax, 010800000h
    xor xor ecx, ecx
    cmp cmp edx, eax
    ja L26
    je L24
    cmp cmp edx, 010100000h
    je L25
    cmp cmp edx, 010300000h
    je L23
    cmp cmp edx, 010400000h
    je L21
    cmp cmp edx, 010500000h
    je L20
    cmp cmp edx, 010600000h
    je L17
    cmp cmp edx, 010700000h
    jne sub_1008E227
    cmp cmp dword ptr [ebp - 4], ecx
    jne L18
    fldz fldz
    fcomp fcomp qword ptr [edi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jne L19
    push push 010110660h
    push push 0FA3h
    jmp L31
    fld fld qword ptr [edi + 32]
    fsqrt fsqrt
    fdivr fdivr qword ptr [g_1019BC88]
    jmp L32
    cmp cmp dword ptr [ebp - 4], ecx
    jne L22
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [edi + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
L10:
    jnp sub_1008E272
    fldz fldz
    fcomp fcomp qword ptr [edi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jne L27
    push push 010110648h
    push push 0FA2h
    jmp L33
    fld fld qword ptr [edi + 32]
    fldln2 fldln2
    fxch fxch st(1)
    fyl2x fyl2x
    fld fld qword ptr [g_1010F7A8]
    fldln2 fldln2
    fxch fxch st(1)
    fyl2x fyl2x
    fdivp fdivp st(1)
    jmp L34
    fld fld qword ptr [g_1010F7A8]
    fld fld qword ptr [edi + 32]
    call sub_100F9149
    jmp L37
    fld fld qword ptr [edi + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    call sub_100F8E93
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je L38
    fld fld qword ptr [edi + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    call sub_100F68C2
    fsubr fsubr qword ptr [edi + 32]
    pop pop ecx
    pop pop ecx
    jmp L40
    cmp cmp dword ptr [ebp - 4], ecx
    jne L30
    fld fld qword ptr [edi + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L41
    fld1 fld1
    fdiv fdiv qword ptr [edi + 32]
    jmp L42
    fld fld qword ptr [edi + 32]
    fchs fchs
    jmp L43
    fld fld qword ptr [edi + 32]
    fsin fsin
    jmp L46
    cmp cmp edx, 010900000h
    je L47
    cmp cmp edx, 010A00000h
    je L39
    cmp cmp edx, 010B00000h
    je L36
    cmp cmp edx, 010C00000h
    je L35
    cmp cmp edx, 010D00000h
    je L49
    cmp cmp edx, 010E00000h
    jne sub_1008E35F
    jmp L50
    fld fld qword ptr [edi + 32]
    fld1 fld1
    fpatan fpatan
    jmp L51
    cmp cmp dword ptr [ebp - 4], ecx
    jne L44
    fld fld qword ptr [edi + 32]
    fcomp fcomp qword ptr [g_1019BEB8]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L45
    fld fld qword ptr [edi + 32]
    fcomp fcomp qword ptr [g_1019BC88]
    fnstsw fnstsw ax
    test test ah, 65
    jne L48
    push push 010110630h
    push push 0FA6h
    jmp L52
    fld fld qword ptr [edi + 32]
    call sub_100F912B
    jmp L55
    cmp cmp dword ptr [ebp - 4], ecx
    jne L54
    fld fld qword ptr [edi + 32]
    fcomp fcomp qword ptr [g_1019BEB8]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L53
    fld fld qword ptr [edi + 32]
    fcomp fcomp qword ptr [g_1019BC88]
    fnstsw fnstsw ax
    test test ah, 65
    jne L56
    push push 01011061Ch
    push push 0FA5h
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B40D
    add add esp, 16
    fldz fldz
    jmp L57
    fld fld qword ptr [edi + 32]
    call sub_100F90A7
    jmp L58
    fld fld qword ptr [edi + 32]
    fcos fcos
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    jmp sub_1008E3F5
    mov mov al, byte ptr [ebp + 12]
    test test al, 1
    je L59
    cmp cmp edx, 010400000h
    je sub_1008E401
    test test al, 2
    je L60
    cmp cmp edx, 010400000h
    je sub_1008E411
    test test al, 8
    je sub_1008E114
    cmp cmp edx, 010600000h
    je sub_1008E0EC
L21:
    cmp cmp edx, 010700000h
    jne sub_1008E124
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 4], edi
    jne sub_1008E448
    mov mov eax, dword ptr [ebp + 8]
    push push 010110660h
    push push 0FA3h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B485
    fldz fldz
    add add esp, 8
    fstp fstp qword ptr [esp]
    push push edi
    push push edi
    jmp sub_1008E460
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_1008E477
    test test al, 4
    jne sub_1008E47F
    mov mov eax, dword ptr [ebp + 8]
    push push 010110648h
    push push 0FA2h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B4BC
    add add esp, 16
    jmp sub_1008E49D
    test test ch, 2
    je sub_1008E1A6
    cmp cmp edx, 010D00000h
    je sub_1008E496
    cmp cmp edx, 010E00000h
    je sub_1008E4A2
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_1008E4C4
    test test cl, 2
    je sub_1008E4CD
    cmp cmp edx, 010100000h
    mov mov edx, 0FFF00000h
    jne sub_1008E213
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + 72]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 010100000h
    je sub_1008E282
    cmp cmp dword ptr [ebp - 8], 010300000h
    jne sub_1008E24F
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + 72]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 010300000h
    je sub_1008E2A0
    cmp cmp dword ptr [ebp - 8], 010500000h
    jne sub_1008E28B
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + 72]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 010600000h
    je sub_1008E2BE
    cmp cmp dword ptr [ebp - 8], 010600000h
    jne sub_1008E312
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + 72]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 010500000h
    jne sub_1008E327
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [eax + 12], 0
    jbe sub_1008E310
    mov mov ecx, dword ptr [eax + 16]
    jmp sub_1008E2FD
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edx, dword ptr [ebp + 16]
    cmp cmp dword ptr [ecx], edx
    je sub_1008E31F
    inc inc dword ptr [ebp + 8]
    add add ecx, 4
    mov mov dword ptr [ebp + 12], ecx
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, dword ptr [eax + 12]
    jb sub_1008E315
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, dword ptr [eax + 12]
    jae sub_1008E354
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 48]
    jmp sub_1008E58C
    mov mov edx, 0FFF00000h
    cmp cmp dword ptr [ebp - 8], 010300000h
    jne sub_1008E483
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [edi + 72]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ecx]
    and and eax, edx
    cmp cmp eax, 020500000h
    jne sub_1008E49B
    mov mov edi, dword ptr [ecx + 12]
    xor xor edx, edx
    test test edi, edi
    jbe sub_1008E3E0
    mov mov eax, dword ptr [ecx + 16]
L32:
    mov mov ebx, dword ptr [eax]
    cmp cmp ebx, dword ptr [ebp + 16]
    je sub_1008E3EA
    inc inc edx
    add add eax, 4
    cmp cmp edx, edi
    jb sub_1008E3E3
    mov mov eax, dword ptr [ecx + 12]
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + 8]
    and and dword ptr [ebp + 12], 0
    mov mov dword ptr [ebp - 16], edi
    mov mov edi, eax
    shl shl edi, 2
    mov mov dword ptr [ebp - 32], edi
    mov mov edi, eax
    neg neg edi
    shl shl edi, 2
    lea lea ebx, [ecx + edx*4]
    add add eax, edx
    lea lea ecx, [ecx + eax*4]
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 12], ecx
    mov mov edx, 0FFF00000h
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [ebx]
    mov mov dword ptr [ebp - 28], ecx
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    test test byte ptr [eax + 4], 2
    je sub_1008E4E9
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax + 72]
L38:
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 010700000h
    jne sub_1008E501
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [eax + 12], 0
    jbe sub_1008E4F6
    mov mov ecx, dword ptr [eax + 16]
    mov mov ebx, dword ptr [ecx]
    cmp cmp ebx, dword ptr [ebp - 20]
    je sub_1008E500
L39:
    inc inc dword ptr [ebp + 8]
    mov mov ebx, dword ptr [eax + 12]
    add add ecx, 4
    cmp cmp dword ptr [ebp + 8], ebx
L41:
    jb sub_1008E4F9
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 28]
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp dword ptr [eax + ebx*4], ecx
    je sub_1008E5FA
    mov mov ebx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 12]
    add add ebx, dword ptr [ebp - 32]
L42:
    inc inc dword ptr [ebp + 12]
    add add ecx, edi
    cmp cmp dword ptr [ebp + 12], 2
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 12], ecx
L45:
    jb sub_1008E4E2
    mov mov ebx, dword ptr [ebp - 24]
    mov mov edi, dword ptr [ebp - 36]
L47:
    cmp cmp dword ptr [ebp - 8], 010500000h
    jne sub_1008E6A5
    mov mov ecx, dword ptr [edi + 72]
L48:
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
L49:
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 020500000h
    jne sub_1008E6BE
    mov mov ecx, dword ptr [eax + 12]
    and and dword ptr [ebp + 8], 0
    test test ecx, ecx
    jbe sub_1008E5F8
    mov mov edi, dword ptr [eax + 16]
    mov mov dword ptr [ebp + 12], edi
    mov mov edi, dword ptr [ebp + 12]
    mov mov edi, dword ptr [edi]
    cmp cmp edi, dword ptr [ebp + 16]
    je sub_1008E608
    inc inc dword ptr [ebp + 8]
    add add dword ptr [ebp + 12], 4
    cmp cmp dword ptr [ebp + 8], ecx
    jb sub_1008E5FE
    and and dword ptr [ebp + 12], 0
    mov mov eax, dword ptr [eax + 8]
    mov mov edi, dword ptr [esi + 20]
    shl shl ecx, 2
    mov mov dword ptr [ebp - 32], ecx
    mov mov ecx, dword ptr [ebp + 8]
    lea lea eax, [eax + ecx*4]
    mov mov dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
L54:
    test test byte ptr [eax + 4], 2
    je sub_1008E6E5
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax + 72]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, edx
    cmp cmp ecx, 010600000h
    jne sub_1008E6FD
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [eax + 12], 0
    jbe sub_1008E6EE
    mov mov ecx, dword ptr [eax + 16]
    jmp sub_1008E6D9
    mov mov ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + 48]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov dword ptr [ecx + 48], eax
    jmp sub_1008E750
    mov mov ecx, dword ptr [ebp - 36]
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    cmp cmp dword ptr [ecx], edi
    je sub_1008E713
    inc inc dword ptr [ebp + 8]
    add add ecx, 4
    mov mov dword ptr [ebp - 36], ecx
L58:
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, dword ptr [eax + 12]
    jb sub_1008E707
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [eax]
    test test al, 4
    je sub_1008E752
    test test al, 8
    jne sub_1008E76E
    mov mov eax, dword ptr [ebp + 16]
    add add eax, dword ptr [ebp - 32]
    inc inc dword ptr [ebp + 12]
    cmp cmp dword ptr [ebp + 12], 2
    mov mov dword ptr [ebp + 16], eax
    jb sub_1008E6E4
    jmp sub_1008E79E
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_1008685E
    mov mov dword ptr [ebx + 48], eax
    pop pop edi
    pop pop esi
L60:
    xor xor eax, eax
    pop pop ebx
    leave leave
    ret ret 12
FUN_1008d966 ENDP
END
