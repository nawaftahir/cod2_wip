.686
.MODEL FLAT, C
EXTRN sub_1008631E:PROC
EXTRN sub_10086358:PROC
EXTRN sub_10087B79:PROC
EXTRN sub_10087B96:PROC
EXTRN sub_1008A98E:PROC
EXTRN sub_1008B179:PROC
EXTRN sub_1008B639:PROC
EXTRN sub_1008D26D:PROC
EXTRN sub_1008D28B:PROC
EXTRN sub_1008D297:PROC
EXTRN sub_1008D2A7:PROC
EXTRN sub_1008D2B1:PROC
EXTRN sub_1008D307:PROC
EXTRN sub_1008D312:PROC
EXTRN sub_1008D336:PROC
EXTRN sub_1008D341:PROC
EXTRN sub_1008D353:PROC
EXTRN sub_1008D35D:PROC
EXTRN sub_1008D3C9:PROC
EXTRN sub_1008D3D9:PROC
EXTRN sub_1008D471:PROC
EXTRN sub_1008D473:PROC
EXTRN sub_1008D47C:PROC
EXTRN sub_1008D483:PROC
EXTRN sub_1008D48E:PROC
EXTRN sub_1008D4CD:PROC
EXTRN sub_1008D4D3:PROC
EXTRN sub_1008D4DA:PROC
EXTRN sub_1008D53B:PROC
EXTRN sub_1008D598:PROC
EXTRN sub_1008D59E:PROC
EXTRN sub_1008D5C7:PROC
EXTRN sub_1008D5CD:PROC
EXTRN sub_1008D5DD:PROC
EXTRN sub_1008D5DF:PROC
EXTRN sub_1008D5E5:PROC
EXTRN sub_1008D623:PROC
EXTRN sub_1008D639:PROC
EXTRN sub_1008D64B:PROC
EXTRN sub_1008D6A8:PROC
EXTRN sub_1008D6BA:PROC
EXTRN sub_1008D6EE:PROC
EXTRN sub_1008D6F2:PROC
EXTRN sub_1008D6F9:PROC
EXTRN sub_1008D703:PROC
EXTRN sub_1008D74C:PROC
EXTRN sub_1008D75B:PROC
EXTRN sub_1008D7F4:PROC
EXTRN sub_1008D830:PROC
EXTRN sub_1008D836:PROC
EXTRN sub_1008D845:PROC
EXTRN sub_1008D847:PROC
EXTRN sub_1008D848:PROC
EXTRN sub_1008D84D:PROC
EXTRN sub_1008D855:PROC
EXTRN sub_1008D864:PROC
EXTRN sub_1008D871:PROC
EXTRN sub_1008D875:PROC
EXTRN sub_1008D8AF:PROC
EXTRN sub_1008D918:PROC
EXTRN sub_1008D96E:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_1008cb4b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 56
    push push ebx
    push push esi
    mov mov esi, ecx
    push push edi
    mov mov dword ptr [ebp - 52], esi
    call sub_1008A98E
    or or dword ptr [ebp - 44], -1
    or or dword ptr [ebp - 48], -1
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 20], edi
    jbe L11
    mov mov ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi + 24]
    mov mov ebx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx]
    test test ecx, 0FFF00000h
    je L13
    mov mov eax, ecx
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb L14
    cmp cmp eax, 040000000h
    ja L15
    mov mov eax, dword ptr [ebx + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp - 8], edi
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 56], eax
    jbe L17
    mov mov eax, dword ptr [ebx + 12]
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 28], edi
    mov mov dword ptr [ebp - 16], edi
    jbe L4
    imul imul eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ebx + 16]
    add add eax, edx
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + ecx*4]
    test test byte ptr [eax], 1
    mov mov dword ptr [ebp - 32], ecx
    mov mov dword ptr [ebp - 40], edx
    je L6
    mov mov eax, dword ptr [edx + 24]
    mov mov ecx, dword ptr [edx + 20]
    mov mov dword ptr [ebp - 36], eax
    jmp L5
    mov mov eax, dword ptr [esi + 20]
    and and dword ptr [ebp - 12], 0
    mov mov edi, ecx
    shl shl edi, 2
    mov mov eax, dword ptr [eax + edi]
    mov mov edx, dword ptr [eax + 72]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp dword ptr [eax + 12], 0
    jbe L0
    mov mov edx, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [ebp - 24]
    cmp cmp dword ptr [edx], ecx
    je L2
    inc inc dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + 12]
    add add dword ptr [ebp - 24], 4
    cmp cmp dword ptr [ebp - 12], edx
    jb L1
    cmp cmp dword ptr [ebp - 36], 0
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 8]
    je L8
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    push push dword ptr [ebp - 32]
    call sub_10087B79
    test test eax, eax
    je L9
    mov mov eax, dword ptr [ebp - 40]
    mov mov dword ptr [eax + 64], 1
    jmp L10
    push push dword ptr [ebp - 32]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    call sub_10087B96
    test test eax, eax
    jne L12
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + eax]
    mov mov ecx, dword ptr [eax + 24]
    mov mov dword ptr [ebp - 36], ecx
    mov mov ecx, dword ptr [eax + 20]
    cmp cmp ecx, -1
    jne L7
    jmp L16
    mov mov eax, dword ptr [ebp - 40]
    and and dword ptr [eax + 64], 0
    inc inc dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebx + 12]
    cmp cmp dword ptr [ebp - 16], eax
    jb L3
    xor xor edi, edi
    mov mov eax, dword ptr [ebx + 12]
    cmp cmp dword ptr [ebp - 28], eax
    jne L20
    test test eax, eax
    jbe L21
    imul imul eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [esi + 20]
    add add eax, edi
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edx + edi*4]
    mov mov ecx, dword ptr [ecx + edx*4]
    cmp cmp dword ptr [ecx + 64], 0
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    je L19
    test test byte ptr [ecx + 5], 1
    je L18
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L23
    mov mov eax, dword ptr [ebp - 44]
    cmp cmp eax, -1
    jne L22
    push push ecx
    fld1 fld1
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_1008631E
    mov mov dword ptr [ebp - 44], eax
    jmp L24
L0:
    test test byte ptr [ecx + 5], 1
    je L22
L1:
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
L4:
    jnp L26
    mov mov eax, dword ptr [ebp - 48]
    cmp cmp eax, -1
    jne L25
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
L5:
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_10086358
    mov mov dword ptr [ebp - 48], eax
    mov mov ecx, dword ptr [ebx + 12]
    imul imul ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebx + 8]
    add add ecx, edi
    mov mov dword ptr [edx + ecx*4], eax
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [ebx + 12]
L8:
    inc inc edi
    cmp cmp edi, eax
    jb L21
    xor xor edi, edi
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 56]
    jb L17
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 12]
    jb L11
    mov mov ecx, esi
    mov mov dword ptr [ebp - 32], edi
    call sub_1008B179
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 24], edi
    jbe sub_1008D4DA
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov ebx, dword ptr [eax + ecx*4]
    test test word ptr [ebx + 2], 0FFF0h
    je sub_1008D4D3
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe L27
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + eax*4]
    mov mov edi, dword ptr [ecx + 24]
    mov mov eax, dword ptr [ecx + 20]
    mov mov dword ptr [ebp - 20], edi
    jmp L28
    mov mov edi, eax
    shl shl edi, 2
L16:
    mov mov dword ptr [ebp - 56], edi
    mov mov edi, dword ptr [edx + edi]
    test test byte ptr [edi], 080h
    je L30
    cmp cmp dword ptr [ebp - 20], 0
    fld fld qword ptr [edi + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
L17:
    fnstsw fnstsw ax
    jne L31
    test test ah, 68
    jnp sub_1008D26D
    and and dword ptr [ebp - 20], 0
    or or eax, -1
    mov mov dword ptr [ebp - 4], 1
    cmp cmp eax, -1
    jne L29
    inc inc dword ptr [ebp - 16]
    mov mov dword ptr [ecx + 20], eax
    mov mov eax, dword ptr [ebp - 20]
    mov mov dword ptr [ecx + 24], eax
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L27
    mov mov ecx, dword ptr [ebx]
    mov mov eax, ecx
    and and eax, 0FFF00000h
    cmp cmp eax, 010F00000h
    je sub_1008D483
    cmp cmp eax, 011400000h
    je sub_1008D48E
    cmp cmp eax, 020700000h
    je sub_1008D336
    cmp cmp eax, 020800000h
    je sub_1008D341
    mov mov eax, ecx
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb sub_1008D307
    cmp cmp eax, 040000000h
    ja sub_1008D312
    mov mov eax, dword ptr [ebx + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 12], edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 56], eax
    jbe sub_1008D297
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edi, dword ptr [esi + 20]
    mov mov edi, dword ptr [edi + edx*4]
    cmp cmp dword ptr [edi + 20], -1
    jne sub_1008D26D
    cmp cmp dword ptr [edi + 24], 0
    je sub_1008D2A7
    mov mov edi, dword ptr [ebp - 8]
    and and dword ptr [ebp - 20], 0
    test test eax, eax
    mov mov dword ptr [ecx + edi*4], edx
    jbe sub_1008D2B1
    mov mov ecx, dword ptr [ebx + 12]
    imul imul ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 12]
    mov mov edx, dword ptr [ebx + 8]
    add add eax, ecx
    mov mov eax, dword ptr [edx + eax*4]
    add add ecx, edi
    inc inc dword ptr [ebp - 20]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov eax, dword ptr [ebp - 56]
    cmp cmp dword ptr [ebp - 20], eax
    jb sub_1008D2B1
L20:
    inc inc edi
    mov mov dword ptr [ebp - 8], edi
    inc inc dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 12]
    cmp cmp ecx, dword ptr [ebx + 12]
    jb sub_1008D297
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [ebx + 12]
    je sub_1008D623
    and and dword ptr [ebp - 20], 0
    test test eax, eax
    jbe sub_1008D353
    and and dword ptr [ebp - 28], 0
    shl shl ecx, 2
    mov mov dword ptr [ebp - 48], ecx
    mov mov esi, dword ptr [ebx + 12]
    imul imul esi, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ebp - 48]
    add add edi, edx
    lea lea esi, [edx + esi*4]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    inc inc dword ptr [ebp - 20]
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, edx
    add add dword ptr [ebp - 28], ecx
    cmp cmp dword ptr [ebp - 20], eax
    jb sub_1008D35D
    mov mov ecx, dword ptr [ebp - 8]
    test test ecx, ecx
    je sub_1008D3C9
    mov mov edx, dword ptr [ebx]
    xor xor edx, ecx
L25:
    and and edx, 0FFFFFh
    xor xor edx, dword ptr [ebx]
    jmp sub_1008D3D9
    test test ah, 68
    jnp sub_1008D26D
    mov mov edi, dword ptr [ebp - 56]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + eax]
    mov mov edi, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [ebp - 20], edi
    jmp sub_1008D28B
    xor xor edx, edx
    mov mov esi, dword ptr [ebp - 52]
    imul imul eax, ecx
    mov mov dword ptr [ebx], edx
    mov mov dword ptr [ebx + 12], ecx
    mov mov dword ptr [ebx + 4], eax
    jmp sub_1008D6A8
    mov mov eax, dword ptr [ebx + 12]
    test test eax, eax
    je sub_1008D6BA
    and and dword ptr [ebp - 28], 0
    test test eax, eax
    jbe sub_1008D473
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, eax
    mov mov eax, dword ptr [ecx]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax + 20], -1
    jne sub_1008D473
    cmp cmp dword ptr [eax + 24], 0
    je sub_1008D47C
    inc inc dword ptr [ebp - 28]
    add add ecx, 4
    dec dec edi
    jne sub_1008D471
    cmp cmp dword ptr [ebp - 28], 0
    jne sub_1008D6EE
    xor xor eax, eax
    mov mov dword ptr [ebx + 4], eax
    mov mov dword ptr [ebx + 12], eax
    jmp sub_1008D6F2
    mov mov eax, dword ptr [ebx + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 12], edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 28], eax
    jbe sub_1008D5C7
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [esi + 20]
    shl shl edi, 2
    mov mov eax, dword ptr [edi + eax]
    mov mov dword ptr [ebp - 56], eax
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [eax + 20], -1
    jne sub_1008D53B
    cmp cmp dword ptr [eax + 24], 0
    je sub_1008D5DD
    mov mov edx, dword ptr [ebx + 8]
    mov mov edi, dword ptr [edi + edx]
    mov mov dword ptr [ebp - 48], edi
    mov mov edi, dword ptr [ebx + 12]
    add add edi, dword ptr [ebp - 8]
    mov mov edx, dword ptr [edx + edi*4]
    mov mov edi, dword ptr [ebp - 48]
    mov mov edi, dword ptr [ecx + edi*4]
    cmp cmp dword ptr [edi + 20], -1
    jne sub_1008D598
    cmp cmp dword ptr [edi + 24], 0
    jne sub_1008D59E
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edi, dword ptr [esi + 088h]
    mov mov dword ptr [ecx + 4], edi
    mov mov dword ptr [eax + 48], edx
    jmp sub_1008D5CD
    mov mov ecx, dword ptr [ecx + edx*4]
    cmp cmp dword ptr [ecx + 20], -1
    jne sub_1008D5DF
    cmp cmp dword ptr [ecx + 24], 0
    jne sub_1008D5E5
    mov mov ecx, dword ptr [esi + 088h]
    mov mov dword ptr [edi + 4], ecx
    mov mov ecx, dword ptr [ebp - 48]
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [ebp - 32], 1
    jmp sub_1008D639
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebp - 56]
    mov mov edx, dword ptr [ebp - 12]
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebp - 28], 0
    mov mov dword ptr [eax + edx*4], ecx
    jbe sub_1008D64B
    mov mov ecx, dword ptr [ebx + 12]
    imul imul ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ebp - 8]
    add add edi, ecx
    mov mov edi, dword ptr [eax + edi*4]
    add add ecx, edx
    inc inc dword ptr [ebp - 20]
    mov mov dword ptr [eax + ecx*4], edi
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 28]
    jb sub_1008D64B
    inc inc edx
    mov mov dword ptr [ebp - 12], edx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_1008D5C7
L28:
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebx + 12]
    je sub_1008D7F4
    mov mov edx, dword ptr [ebp - 28]
    and and dword ptr [ebp - 20], 0
    test test edx, edx
L30:
    jbe sub_1008D6F9
    and and dword ptr [ebp - 28], 0
    shl shl eax, 2
    mov mov dword ptr [ebp - 48], eax
    mov mov esi, dword ptr [ebx + 12]
    imul imul esi, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ebp - 48]
    add add edi, eax
    lea lea esi, [eax + esi*4]
    mov mov eax, ecx
    add add dword ptr [ebp - 28], eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    inc inc dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 20], edx
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    jb sub_1008D703
    mov mov ecx, dword ptr [ebp - 12]
    test test ecx, ecx
    je sub_1008D74C
    mov mov eax, dword ptr [ebx]
    xor xor eax, ecx
    and and eax, 0FFFFFh
    xor xor eax, dword ptr [ebx]
    jmp sub_1008D75B
    xor xor eax, eax
    mov mov esi, dword ptr [ebp - 52]
    imul imul edx, ecx
    mov mov dword ptr [ebx + 12], ecx
    mov mov dword ptr [ebx + 4], edx
    jmp sub_1008D855
    xor xor edi, edi
    cmp cmp edi, dword ptr [ebx + 12]
    mov mov dword ptr [ebp - 44], edi
    mov mov dword ptr [ebp - 20], edi
    jae sub_1008D848
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [esi + 20]
    shl shl ecx, 2
    mov mov edx, dword ptr [ecx + edx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov dword ptr [ebp - 28], edx
    mov mov edx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ecx + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 1
    mov mov eax, dword ptr [ebp - 48]
    je sub_1008D830
    cmp cmp dword ptr [eax + 8], -1
    jne sub_1008D836
    mov mov edx, dword ptr [ebp - 28]
    or or byte ptr [edx], 080h
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1008D847
    fld1 fld1
    jmp sub_1008D84D
    fldz fldz
    fstp fstp qword ptr [edx + 32]
    jmp sub_1008D871
    mov mov eax, dword ptr [eax]
    test test al, 4
    je sub_1008D871
    test test al, 8
    je sub_1008D875
    mov mov edx, dword ptr [ebp - 28]
    or or byte ptr [edx], 080h
    jmp sub_1008D864
    mov mov edx, dword ptr [ebp - 28]
    and and byte ptr [edx], 127
    test test byte ptr [edx], 080h
    jne sub_1008D8AF
    mov mov eax, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ecx + eax]
    shl shl edi, 2
    mov mov dword ptr [edi + eax], edx
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx + eax]
    mov mov dword ptr [edi + eax], ecx
    mov mov edi, dword ptr [ebp - 44]
    inc inc edi
    mov mov dword ptr [ebp - 44], edi
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_1008D845
    cmp cmp edi, dword ptr [ebx + 12]
    je sub_1008D918
    mov mov ecx, edi
    and and ecx, 0FFFFFh
    mov mov eax, edi
    or or ecx, 010F00000h
    neg neg eax
    sbb sbb eax, eax
    and and eax, ecx
    mov mov dword ptr [ebx + 4], edi
    mov mov dword ptr [ebx + 12], edi
    mov mov dword ptr [ebx], eax
    mov mov dword ptr [ebp - 4], 1
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_1008D4CD
    cmp cmp dword ptr [ebp - 32], 0
    je sub_1008D96E
    mov mov ecx, esi
L31:
    call sub_1008B639
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 4], eax
    pop pop edi
    pop pop esi
    sete sete al
    pop pop ebx
    leave leave
    ret ret
FUN_1008cb4b ENDP
END
