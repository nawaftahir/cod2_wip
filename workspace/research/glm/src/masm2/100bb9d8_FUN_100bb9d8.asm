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
EXTRN sub_100BBFE6:PROC
EXTRN sub_100BC00D:PROC
EXTRN sub_100BC021:PROC
EXTRN sub_100BC03A:PROC
EXTRN sub_100BC0AF:PROC
EXTRN sub_100BC0B9:PROC
EXTRN sub_100BC0BE:PROC
EXTRN sub_100BC0E0:PROC
EXTRN sub_100BC0E5:PROC
EXTRN sub_100BC0EE:PROC
EXTRN sub_100BC0F1:PROC
EXTRN sub_100BC0F3:PROC
EXTRN sub_100BC0F9:PROC
EXTRN sub_100BC0FC:PROC
EXTRN sub_100BC101:PROC
EXTRN sub_100BC109:PROC
EXTRN sub_100BC140:PROC
EXTRN sub_100BC14B:PROC
EXTRN sub_100BC161:PROC
EXTRN sub_100BC165:PROC
EXTRN sub_100BC170:PROC
EXTRN sub_100BC173:PROC
EXTRN sub_100BC19F:PROC
EXTRN sub_100BC1B3:PROC
EXTRN sub_100BC1BB:PROC
EXTRN sub_100BC1CF:PROC
EXTRN sub_100BC1DA:PROC
EXTRN sub_100BC1F0:PROC
EXTRN sub_100BC1F1:PROC
EXTRN sub_100BC1FD:PROC
EXTRN sub_100BC202:PROC
EXTRN sub_100BC21C:PROC
EXTRN sub_100BC266:PROC
EXTRN sub_100BC285:PROC
EXTRN sub_100BC2C0:PROC
EXTRN sub_100BC2C5:PROC
EXTRN sub_100BC2D2:PROC
EXTRN sub_100BC2EB:PROC
EXTRN sub_100BC2EC:PROC
EXTRN sub_100BC305:PROC
EXTRN sub_100BC346:PROC
EXTRN sub_100BC398:PROC
EXTRN sub_100BC3AC:PROC
EXTRN sub_100BC3EC:PROC
EXTRN sub_100BC406:PROC
EXTRN sub_100BC429:PROC
EXTRN sub_100BC438:PROC
EXTRN sub_100BC466:PROC
EXTRN sub_100BC475:PROC
EXTRN sub_100BC49C:PROC
EXTRN sub_100BC4C5:PROC
EXTRN sub_100BC4EA:PROC
EXTRN sub_100BC52B:PROC
EXTRN sub_100BC584:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100bb9d8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0124h
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax]
    push push esi
    xor xor ecx, ecx
    mov mov esi, eax
    push push edi
    xor xor edi, edi
    inc inc ecx
    and and eax, 0FFF00000h
    and and esi, 0FFFFFh
    cmp cmp eax, 030000000h
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 52], edi
    mov mov dword ptr [ebp - 68], edi
    mov mov dword ptr [ebp - 64], ecx
    mov mov dword ptr [ebp - 60], 2
    mov mov dword ptr [ebp - 56], 3
    je L0
    mov mov eax, ecx
    jmp L25
    cmp cmp esi, edi
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 36], edi
    mov mov dword ptr [ebp - 32], edi
    mov mov dword ptr [ebp - 40], edi
    mov mov dword ptr [ebp - 8], edi
    jbe L16
    mov mov eax, dword ptr [ebx + 0100h]
    fld fld qword ptr [g_1019BE20]
    mov mov edx, dword ptr [eax + 8]
    mov mov eax, esi
    shl shl eax, 2
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, esi
    shl shl eax, 3
    mov mov dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [edx + eax]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [ebp - 4]
L0:
    mov mov edi, dword ptr [edx + edi]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov dword ptr [ebp - 44], edi
    mov mov edi, dword ptr [ecx + 4]
    mov mov eax, dword ptr [eax + edi*4]
    test test byte ptr [eax + 5], 1
    je L1
    fld fld st(0)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L2
    cmp cmp dword ptr [ecx + 8], -1
    jne L3
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov edi, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [eax + edi*4]
    jne L4
    mov mov dword ptr [ebp - 24], 1
    jmp L6
    mov mov dword ptr [ebp - 32], 1
    mov mov eax, dword ptr [ebp - 44]
    test test byte ptr [eax + 5], 1
    je L7
    mov mov ecx, dword ptr [ebp - 48]
    fld fld st(0)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L8
    cmp cmp dword ptr [ecx + 8], -1
    jne L9
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov edi, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [eax + edi*4]
    jne L10
    mov mov dword ptr [ebp - 36], 1
    jmp L11
    mov mov dword ptr [ebp - 40], 1
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    add add dword ptr [ebp - 20], 4
    cmp cmp dword ptr [ebp - 8], esi
    jb L5
    xor xor edi, edi
    fstp fstp st(0)
    cmp cmp dword ptr [ebp - 24], edi
    je L14
    cmp cmp dword ptr [ebp - 32], edi
    jne L15
    push push 116
    call sub_1008597D
    cmp cmp eax, edi
    je L12
    mov mov ecx, eax
    call sub_100854ED
    jmp L13
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 12], eax
    je L17
    push push edi
    push push esi
    lea lea ecx, [esi + esi]
    and and esi, 0FFFFFh
    or or esi, 070B00000h
    jmp L19
    cmp cmp dword ptr [ebp - 36], edi
    je L23
    cmp cmp dword ptr [ebp - 40], edi
    jne L24
    cmp cmp dword ptr [ebp + 8], edi
    je L18
    xor xor eax, eax
    inc inc eax
    jmp sub_100BBFE6
    push push 116
    call sub_100859CC
    cmp cmp eax, edi
    je L20
    mov mov ecx, eax
L2:
    call sub_1008553C
    jmp L21
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 12], eax
    jne L22
    mov mov eax, 08007000Eh
    jmp sub_100BC00D
    push push edi
    push push esi
    lea lea ecx, [esi + esi]
    and and esi, 0FFFFFh
    or or esi, 070C00000h
    push push ecx
    mov mov ecx, eax
    push push esi
    call sub_10085A51
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BC021
    push push dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ebp - 12]
    call sub_100855BB
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BC03A
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 12]
    mov mov edi, dword ptr [eax + 16]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, edx
L7:
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [edx + 8]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
L9:
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [edx + 8]
    add add edi, ecx
    cmp cmp dword ptr [ebp - 24], 0
    je L26
L10:
    add add esi, ecx
    jmp L27
    add add esi, dword ptr [ebp - 28]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
L11:
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebx + 0FCh]
    mov mov ecx, dword ptr [ebx + 24]
    push push dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + eax*4]
    call sub_10085D50
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100BC0BE
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 8], edi
    mov mov ecx, ebx
    sete sete al
    push push eax
    push push esi
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0E4h]
    push push eax
    lea lea eax, [ebp - 52]
    push push eax
    lea lea eax, [ebp - 0124h]
    push push eax
    push push 0101188F8h
    push push dword ptr [ebx + 0100h]
    call sub_100B9C7B
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], eax
    jne sub_100BC109
    xor xor edi, edi
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 8], edi
    and and dword ptr [ebp - 4], 0
L12:
    xor xor edx, edx
    test test esi, esi
    mov mov dword ptr [ebp - 44], edx
    jbe sub_100BC0EE
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ebp - 8]
    shl shl eax, 2
    lea lea edi, [eax + edx]
    mov mov edi, dword ptr [ebp + edi*4 - 0E4h]
L16:
    mov mov dword ptr [ebp - 32], edi
    mov mov edi, edx
    sub sub edi, eax
    mov mov eax, dword ptr [ebp + edi*4 - 0D4h]
    mov mov edi, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 20], eax
    lea lea eax, [edi + edx]
    sub sub edx, edi
    mov mov edx, dword ptr [ebp + edx*4 - 0B4h]
    mov mov edi, dword ptr [ebp - 20]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [edi + 4]
    mov mov eax, dword ptr [ebp + eax*4 - 0C4h]
    mov mov dword ptr [ebp - 36], edx
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov dword ptr [ebp - 16], edx
    mov mov edx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov dword ptr [ebp - 28], edi
    mov mov edi, dword ptr [ebp - 16]
    mov mov edi, dword ptr [edi + 4]
    mov mov edx, dword ptr [edx + edi*4]
    mov mov edi, dword ptr [ebp - 32]
    mov mov dword ptr [ebp - 48], edx
    mov mov edx, dword ptr [ecx + edi*4]
    mov mov edx, dword ptr [edx + 56]
L18:
    cmp cmp edx, eax
    mov mov dword ptr [ebp - 40], edx
    je sub_100BC0AF
    mov mov edx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edx + 56]
    cmp cmp edx, edi
    je sub_100BC0B9
    cmp cmp dword ptr [ebp - 40], -1
    je sub_100BC0E0
    cmp cmp dword ptr [ebp - 40], edx
    jne sub_100BC0E5
    mov mov edx, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [edx + 60]
    mov mov edx, dword ptr [ecx + eax*4]
    xor xor edi, 080000h
    cmp cmp edi, dword ptr [edx + 60]
    jne sub_100BC0F9
    mov mov edx, dword ptr [ebp - 20]
    cmp cmp edx, dword ptr [ebp - 36]
    jne sub_100BC101
    xor xor edi, edi
    inc inc edi
    jmp sub_100BC170
    cmp cmp dword ptr [ebp - 32], eax
    jne sub_100BC173
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, dword ptr [ebp - 36]
    je sub_100BC140
    mov mov edi, dword ptr [ebp - 16]
    mov mov edi, dword ptr [edi + 56]
    cmp cmp edi, dword ptr [ebp - 20]
    je sub_100BC14B
    cmp cmp edx, -1
    je sub_100BC161
    cmp cmp edx, edi
    jne sub_100BC165
    mov mov edx, dword ptr [eax + 60]
    mov mov edi, dword ptr [ebp - 16]
    xor xor edx, 080000h
    cmp cmp edx, dword ptr [edi + 60]
    je sub_100BC19F
    mov mov edi, dword ptr [ebp - 28]
    mov mov edx, 0100h
    test test dword ptr [edi + 4], edx
    je sub_100BC1B3
    mov mov edi, dword ptr [ebp - 48]
    test test dword ptr [edi + 4], edx
    je sub_100BC1BB
    fld fld qword ptr [eax + 32]
    mov mov eax, dword ptr [ebp - 16]
    fchs fchs
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100BC1CF
    xor xor eax, eax
    inc inc eax
    mov mov edi, eax
    jmp sub_100BC1DA
    xor xor edi, edi
    xor xor eax, eax
    mov mov edx, dword ptr [ebp - 44]
    test test edx, edx
    jne sub_100BC1F1
    mov mov dword ptr [ebp - 24], eax
    jmp sub_100BC1FD
    cmp cmp dword ptr [ebp - 24], eax
    je sub_100BC202
    xor xor edi, edi
    test test edi, edi
    je sub_100BC21C
    inc inc edx
    cmp cmp edx, esi
    mov mov dword ptr [ebp - 44], edx
    jb sub_100BC0F1
    test test edi, edi
    jne sub_100BC266
    add add dword ptr [ebp - 4], 4
    cmp cmp dword ptr [ebp - 4], 8
    jb sub_100BC0F3
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], 2
    jb sub_100BC0FC
    mov mov dword ptr [ebp - 4], 1
    mov mov ecx, dword ptr [ebp - 12]
    test test ecx, ecx
    je sub_100BC285
    push push 1
    call sub_1006C872
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    push push 116
    call sub_10085C7F
    xor xor edi, edi
    cmp cmp eax, edi
    je sub_100BC2C5
    mov mov ecx, eax
    call sub_100857F1
    mov mov ecx, eax
    jmp sub_100BC2D2
    xor xor ecx, ecx
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 12], ecx
    jne sub_100BC2EB
    mov mov dword ptr [ebp - 4], 08007000Eh
    jmp sub_100BC2C0
    cmp cmp dword ptr [ebp - 24], edi
    je sub_100BC429
    cmp cmp dword ptr [ebp - 8], 1
    je sub_100BC438
    cmp cmp dword ptr [ebp - 8], edi
    jne sub_100BC346
    mov mov ecx, dword ptr [ebp - 12]
    push push edi
    push push esi
    lea lea eax, [esi + esi]
    push push eax
L25:
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 070C00000h
    push push eax
    call sub_10085D20
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BC2EC
    push push dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ebp - 12]
    call sub_10085886
L26:
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BC305
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, esi
    mov mov esi, dword ptr [eax + 16]
    mov mov eax, dword ptr [ebp - 12]
    mov mov edi, dword ptr [eax + 16]
    shl shl ecx, 2
    mov mov dword ptr [ebp - 16], ecx
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax + 8]
    shl shl ecx, 4
    mov mov edx, ecx
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 28], edx
    lea lea esi, [ebp + edx - 0E4h]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, edx
    add add edi, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 0D4h]
    sub sub esi, dword ptr [ebp - 28]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edx, dword ptr [eax + 8]
    mov mov esi, dword ptr [edx]
    mov mov edi, dword ptr [ebp - 16]
    mov mov edx, dword ptr [edx + edi]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [eax + 16]
    mov mov edx, dword ptr [edx]
    mov mov esi, dword ptr [ecx + esi*4]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, dword ptr [esi + 4]
    mov mov dword ptr [ebp - 28], edi
    jne sub_100BC4C5
    mov mov edi, dword ptr [ecx + 12]
    cmp cmp edi, dword ptr [esi + 12]
    je sub_100BC398
    mov mov edi, dword ptr [ebp - 28]
    cmp cmp edx, dword ptr [edi + 4]
    jne sub_100BC4EA
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp ecx, dword ptr [edi + 12]
    je sub_100BC3AC
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je sub_100BC1F0
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 52]
    test test eax, eax
    jbe sub_100BC52B
    mov mov edi, dword ptr [ebp + 12]
    mov mov ecx, eax
    lea lea esi, [ebp - 0124h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ecx], eax
    jmp sub_100BC3EC
    cmp cmp dword ptr [ebp - 8], edi
    jne sub_100BC584
    push push edi
    push push esi
    lea lea eax, [esi + esi]
    push push eax
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 070B00000h
    push push eax
    call sub_10085E36
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BC406
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 24], edi
    jne sub_100BC466
    cmp cmp dword ptr [ebp - 8], 1
    je sub_100BC475
    jmp sub_100BC49C
FUN_100bb9d8 ENDP
END
