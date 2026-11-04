.686
.MODEL FLAT, C
EXTRN sub_1006CC21:PROC
EXTRN sub_1006CC30:PROC
EXTRN sub_1006CC70:PROC
EXTRN sub_1006CC7E:PROC
EXTRN sub_1008553D:PROC
EXTRN sub_100855B3:PROC
EXTRN sub_100857D8:PROC
EXTRN sub_10085855:PROC
EXTRN sub_100859A6:PROC
EXTRN sub_100859CD:PROC
EXTRN sub_10085A1C:PROC
EXTRN sub_10085A4F:PROC
EXTRN sub_10085C68:PROC
EXTRN sub_10085CF0:PROC
EXTRN sub_10085E36:PROC
EXTRN sub_10085EBA:PROC
EXTRN sub_100860E7:PROC
EXTRN sub_10086152:PROC
EXTRN sub_10086279:PROC
EXTRN sub_1008639F:PROC
EXTRN sub_1008646E:PROC
EXTRN sub_100864E8:PROC
EXTRN sub_10086521:PROC
EXTRN sub_1008657A:PROC
EXTRN sub_100865C1:PROC
EXTRN sub_1008664F:PROC
EXTRN sub_10086668:PROC
EXTRN sub_100866A4:PROC
EXTRN sub_10086830:PROC
EXTRN sub_1008B8F0:PROC
EXTRN sub_100C2AB2:PROC
EXTRN sub_100C2B3F:PROC
EXTRN sub_100C2BAA:PROC
EXTRN sub_100C2CCC:PROC
EXTRN sub_100C3803:PROC
EXTRN sub_100C3816:PROC
EXTRN sub_100C3832:PROC
EXTRN sub_100C3841:PROC
EXTRN sub_100C386B:PROC
EXTRN sub_100C387D:PROC
EXTRN sub_100C3889:PROC
EXTRN sub_100C3895:PROC
EXTRN sub_100C38BD:PROC
EXTRN sub_100C38F2:PROC
EXTRN sub_100C3900:PROC
EXTRN sub_100C3902:PROC
EXTRN sub_100C391A:PROC
EXTRN sub_100C3928:PROC
EXTRN sub_100C3962:PROC
EXTRN sub_100C3975:PROC
EXTRN sub_100C3981:PROC
EXTRN sub_100C39B1:PROC
EXTRN sub_100C3A20:PROC
EXTRN sub_100C3A24:PROC
EXTRN sub_100C3A4F:PROC
EXTRN sub_100C3A83:PROC
EXTRN sub_100C3A8B:PROC
EXTRN sub_100C3A91:PROC
EXTRN sub_100C3AA3:PROC
EXTRN sub_100C3AAE:PROC
EXTRN sub_100C3AB6:PROC
EXTRN sub_100C3ABE:PROC
EXTRN sub_100C3AC6:PROC
EXTRN sub_100C3AC9:PROC
EXTRN sub_100C3AD1:PROC
EXTRN sub_100C3B2B:PROC
EXTRN sub_100C3B65:PROC
EXTRN sub_100C3B75:PROC
EXTRN sub_100C3B89:PROC
EXTRN sub_100C3BB9:PROC
EXTRN sub_100C3BCE:PROC
EXTRN sub_100C3BD2:PROC
EXTRN sub_100C3BDD:PROC
EXTRN sub_100C3C16:PROC
EXTRN sub_100C3C17:PROC
EXTRN sub_100C3C29:PROC
EXTRN sub_100C3C33:PROC
EXTRN sub_100C3C4C:PROC
EXTRN sub_100C3CA2:PROC
EXTRN sub_100C3CB7:PROC
EXTRN sub_100C3CBE:PROC
EXTRN sub_100C3CC8:PROC
EXTRN sub_100C3CEA:PROC
EXTRN sub_100C3CFC:PROC
EXTRN sub_100C3D05:PROC
EXTRN sub_100C3D0E:PROC
EXTRN sub_100C3D11:PROC
EXTRN sub_100C3D1E:PROC
EXTRN sub_100C3D4F:PROC
EXTRN sub_100C3D6D:PROC
EXTRN sub_100C3E0C:PROC
EXTRN sub_100C3E12:PROC
EXTRN sub_100C3E1A:PROC
EXTRN sub_100C3E1E:PROC
EXTRN sub_100C3E2F:PROC
EXTRN sub_100C3E41:PROC
EXTRN sub_100C3EA3:PROC
EXTRN sub_100C3EBD:PROC
EXTRN sub_100C3ED5:PROC
EXTRN sub_100C3F14:PROC
EXTRN sub_100C3F2D:PROC
EXTRN sub_100C3F89:PROC
EXTRN sub_100C3F93:PROC
EXTRN sub_100C3FA6:PROC
EXTRN sub_100C3FCC:PROC
EXTRN sub_100C3FD0:PROC
EXTRN sub_100C3FE1:PROC
EXTRN sub_100C4002:PROC
EXTRN sub_100C400D:PROC
EXTRN sub_100C4010:PROC
EXTRN sub_100C4039:PROC
EXTRN sub_100C4050:PROC
EXTRN sub_100C4061:PROC
.CODE
FUN_100c2f76 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0838h
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, dword ptr [ebp + 32]
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov dword ptr [ebp - 36], edi
    mov mov dword ptr [ebp - 8], eax
    jae sub_100C3816
    xor xor esi, esi
    mov mov ecx, dword ptr [edi + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebx]
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    and and eax, 0FFFFFh
    cmp cmp dword ptr [ebx + 12], esi
    mov mov dword ptr [ebp - 20], ecx
    mov mov dword ptr [ebp - 16], eax
    je L37
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [edi + 20]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [edx + 20]
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 12], edx
    jne L19
    cmp cmp dword ptr [ebp + 40], esi
    je L0
    cmp cmp ecx, 011200000h
    jne L15
    mov mov eax, dword ptr [ebp + 36]
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 4], eax
    je L2
    mov mov eax, dword ptr [edx + 24]
    cmp cmp eax, dword ptr [ebp + 12]
    je L3
    mov mov dword ptr [ebp - 4], esi
    push push ecx
    call sub_100C2AB2
    test test eax, eax
    je L8
    cmp cmp dword ptr [ebp - 16], 1
    jne sub_100C3803
    cmp cmp dword ptr [ebp - 4], esi
    je L5
    push push 1
    push push ebx
    mov mov ecx, edi
    call sub_100C2B3F
    cmp cmp eax, esi
    je sub_100C3895
    push push eax
    mov mov ecx, edi
    call sub_100860E7
    cmp cmp eax, esi
    jl sub_100C38BD
    mov mov eax, dword ptr [ebp - 8]
    push push esi
    push push esi
    push push esi
    push push dword ptr [ebp - 4]
    inc inc eax
    push push dword ptr [ebp + 32]
    mov mov dword ptr [ebp - 44], eax
    mov mov dword ptr [ebp - 8], eax
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 0238h]
    push push eax
    lea lea eax, [ebp - 0438h]
    push push eax
    lea lea eax, [ebp - 44]
    push push eax
    mov mov dword ptr [ebp - 52], esi
    mov mov dword ptr [ebp - 24], esi
    mov mov eax, dword ptr [ebx + 16]
    push push 1
    push push dword ptr [eax]
    mov mov ecx, edi
    call L1
L1:
    cmp cmp eax, esi
    jl sub_100C3902
    cmp cmp dword ptr [ebp - 4], esi
L3:
    je L6
    push push esi
    push push ebx
    mov mov ecx, edi
    call sub_100C2BAA
    cmp cmp eax, esi
    je sub_100C3900
    push push eax
    mov mov ecx, edi
    call sub_10086152
    cmp cmp eax, esi
    jl sub_100C3928
    mov mov eax, dword ptr [ebp - 8]
    push push esi
    push push esi
    push push esi
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 44], eax
    push push dword ptr [ebp + 32]
    lea lea eax, [ebp - 52]
    push push eax
    lea lea eax, [ebp - 0638h]
    push push eax
    lea lea eax, [ebp - 0838h]
    push push eax
    lea lea eax, [ebp - 44]
    push push eax
    mov mov eax, dword ptr [ebx + 16]
    push push esi
    push push dword ptr [eax]
    mov mov ecx, edi
    call L4
L4:
    cmp cmp eax, esi
    jl sub_100C3962
    cmp cmp dword ptr [ebp - 4], esi
    je L16
    mov mov ecx, dword ptr [ebp - 52]
    cmp cmp dword ptr [ebp - 24], ecx
    mov mov dword ptr [ebp - 20], 1
    jne sub_100C38F2
    xor xor eax, eax
    cmp cmp ecx, esi
    jbe L10
    mov mov ecx, dword ptr [ebp + eax*4 - 0638h]
    cmp cmp ecx, dword ptr [ebp + eax*4 - 0238h]
    je L11
    mov mov dword ptr [ebp - 20], esi
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 52]
    jb L9
    cmp cmp dword ptr [ebp - 20], esi
    je sub_100C391A
    push push 116
    call sub_100859CD
    cmp cmp eax, esi
    je L12
    mov mov ecx, eax
    call sub_1008553D
    mov mov edi, eax
    jmp L14
    xor xor edi, edi
    cmp cmp edi, esi
    mov mov dword ptr [ebp - 20], edi
    je sub_100C39B1
    mov mov eax, dword ptr [ebp - 52]
    push push esi
    push push eax
    lea lea ecx, [eax + eax]
    and and eax, 0FFFFFh
    push push ecx
    or or eax, 073400000h
    push push eax
    mov mov ecx, edi
    call sub_10085A4F
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, edi
    jl sub_100C3975
    push push ebx
    call sub_100855B3
    mov mov ebx, eax
    cmp cmp ebx, esi
    jl sub_100C3981
    mov mov ecx, dword ptr [ebp - 24]
    mov mov eax, edi
    mov mov edi, dword ptr [eax + 16]
    lea lea esi, [ebp - 0638h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov edi, dword ptr [eax + 8]
    lea lea esi, [ebp - 0438h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov edi, dword ptr [eax + 8]
    shl shl ecx, 2
    add add edi, ecx
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 0838h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 36]
    push push eax
    call sub_10086279
    test test eax, eax
    jl sub_100C3A4F
    mov mov edi, dword ptr [ebp - 36]
    xor xor esi, esi
    mov mov eax, dword ptr [edi + 116]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [ebp - 44]
    jmp L20
    push push ecx
    call sub_100C2CCC
    test test eax, eax
    je L21
    mov mov eax, dword ptr [ebp - 8]
    inc inc eax
    cmp cmp dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 56], eax
    mov mov dword ptr [ebp - 24], esi
    je L18
    push push ebx
    mov mov ecx, edi
    call sub_10086521
    cmp cmp eax, esi
    jl sub_100C3A8B
    mov mov eax, dword ptr [edi + 116]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + 4], eax
    push push esi
    push push esi
    push push esi
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 24]
    push push dword ptr [ebp + 32]
    mov mov ecx, edi
    push push eax
    lea lea eax, [ebp - 0238h]
    push push eax
    lea lea eax, [ebp - 0438h]
    push push eax
    lea lea eax, [ebp - 56]
    push push eax
    mov mov eax, dword ptr [ebx + 16]
    push push 1
    push push dword ptr [eax]
    call L7
L7:
    cmp cmp eax, esi
    jl sub_100C3AC9
    mov mov eax, dword ptr [ebp - 56]
    mov mov dword ptr [ebp - 8], eax
    jmp sub_100C3A24
    cmp cmp ecx, 011100000h
    je L24
    cmp cmp ecx, 074100000h
    je L27
    cmp cmp ecx, 011200000h
    jne L25
    cmp cmp dword ptr [ebp - 4], esi
    je L23
    cmp cmp dword ptr [ebp + 40], esi
    je L26
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 16], esi
    jbe L22
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebp + 48]
    mov mov dword ptr [eax + 52], edx
    mov mov edx, dword ptr [ebp + 44]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 16]
    mov mov dword ptr [eax + 48], edx
    jb L22
    mov mov ecx, edi
    push push ebx
    call sub_100865C1
    cmp cmp eax, esi
    jl sub_100C3B2B
    inc inc dword ptr [ebp - 8]
    jmp sub_100C3A83
    cmp cmp dword ptr [ebp + 36], esi
L10:
    je L29
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp dword ptr [edx + 24], eax
    jne L30
    jmp L28
    push push dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    inc inc eax
    push push 1
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 40], eax
    push push dword ptr [ebp + 32]
    mov mov dword ptr [ebp - 8], eax
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 0238h]
    push push eax
    lea lea eax, [ebp - 0438h]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    mov mov dword ptr [ebp - 24], esi
    mov mov eax, dword ptr [ebx + 16]
    push push 1
    push push dword ptr [eax]
    mov mov ecx, edi
    call L13
L13:
    cmp cmp eax, esi
    jl sub_100C3B89
    cmp cmp dword ptr [ebp - 4], esi
    je L32
    cmp cmp dword ptr [ebp - 20], 011100000h
    mov mov ecx, edi
    push push ebx
    jne L31
    mov mov eax, dword ptr [ebp - 16]
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp - 28], eax
    or or eax, 074200000h
    mov mov dword ptr [ebx], eax
    call sub_1008664F
    cmp cmp eax, esi
    jl sub_100C3BB9
    mov mov eax, dword ptr [ebp - 28]
    or or eax, 011100000h
    mov mov dword ptr [ebx], eax
    jmp L34
    call sub_10086668
    cmp cmp eax, esi
    jl sub_100C3BD2
    mov mov eax, dword ptr [edi + 116]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [ebp - 8]
    push push esi
    push push esi
    push push esi
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 40], eax
    push push dword ptr [ebp + 32]
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 0238h]
    push push eax
    lea lea eax, [ebp - 0438h]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    mov mov eax, dword ptr [ebx + 16]
    push push 1
    push push dword ptr [eax]
    mov mov ecx, edi
    call L17
L17:
    cmp cmp eax, esi
    jl sub_100C3C16
    cmp cmp dword ptr [ebp - 4], esi
    je sub_100C386B
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push esi
    push push esi
    push push dword ptr [edi + 0A8h]
    mov mov ecx, edi
    call sub_1008657A
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 28], eax
    je sub_100C3C29
    push push 116
    call sub_10085C68
    cmp cmp eax, esi
    je sub_100C3832
    mov mov ecx, eax
    call sub_100857D8
    mov mov dword ptr [ebp - 12], eax
    jmp sub_100C3841
    mov mov dword ptr [ebp - 12], esi
    cmp cmp dword ptr [ebp - 12], esi
    je sub_100C3C4C
    cmp cmp dword ptr [ebp - 20], 011100000h
    mov mov ecx, dword ptr [ebp - 12]
    push push esi
    push push 1
    push push esi
    jne sub_100C387D
    push push 074B00001h
    jmp sub_100C3889
    push push 074A00001h
    call sub_10085CF0
    cmp cmp eax, esi
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 4], eax
    jl sub_100C3C17
    push push ebx
    call sub_10085855
    mov mov ebx, eax
    cmp cmp ebx, esi
    jl sub_100C3C33
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [eax + 16]
    mov mov edx, dword ptr [ebp - 28]
    mov mov dword ptr [ecx], edx
    push push eax
    mov mov ecx, edi
    call sub_100864E8
    cmp cmp eax, esi
    jl sub_100C3CBE
    mov mov eax, dword ptr [ebp - 40]
    jmp L33
    cmp cmp ecx, 020700000h
    jne sub_100C3CC8
    cmp cmp dword ptr [ebp + 40], esi
    jne L36
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov dword ptr [ebp - 20], edx
    mov mov edx, dword ptr [ebp - 16]
    shl shl edx, 2
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ecx + 20]
    cmp cmp ecx, dword ptr [edx + 20]
    jne sub_100C3CA2
    cmp cmp dword ptr [ebp + 20], esi
    je sub_100C3CFC
    cmp cmp dword ptr [ebp + 24], esi
    je sub_100C3D05
    cmp cmp dword ptr [ebp + 28], esi
    je sub_100C3D0E
    cmp cmp ecx, dword ptr [ebp + 8]
    jne sub_100C3D1E
    cmp cmp dword ptr [ebp + 36], esi
    je L38
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edx, dword ptr [ebp - 20]
    cmp cmp dword ptr [edx + 24], ecx
L20:
    mov mov dword ptr [ebp - 28], 1
    mov mov dword ptr [ebp - 32], esi
    je sub_100C3A20
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 32], ecx
L21:
    mov mov ecx, dword ptr [ebp - 16]
    cmp cmp ecx, esi
    jbe sub_100C3A91
    mov mov edx, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ebp - 32]
    lea lea eax, [eax + edx*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 48], ecx
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + 12]
    cmp cmp edx, dword ptr [eax + 12]
    jne sub_100C3AAE
    mov mov edx, dword ptr [ecx + 16]
    cmp cmp edx, dword ptr [eax + 16]
    jne sub_100C3AB6
    mov mov edx, dword ptr [ecx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne sub_100C3ABE
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, dword ptr [eax + 4]
    jne sub_100C3AC6
    mov mov ecx, dword ptr [ecx + 60]
    cmp cmp ecx, dword ptr [eax + 60]
    je sub_100C3AD1
    mov mov dword ptr [ebp - 28], esi
    add add dword ptr [ebp - 12], 4
    add add dword ptr [ebp - 4], 4
    dec dec dword ptr [ebp - 48]
    jne sub_100C3AA3
    mov mov eax, dword ptr [ebp + 28]
    mov mov eax, dword ptr [eax]
    add add eax, dword ptr [ebp - 16]
    cmp cmp eax, 080h
    jae sub_100C3D6D
    cmp cmp dword ptr [ebp - 28], esi
    je sub_100C3B65
    cmp cmp dword ptr [ebp - 16], esi
    jbe sub_100C3D11
    mov mov eax, dword ptr [ebp - 32]
    shl shl eax, 2
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp + 28]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov edx, dword ptr [eax]
    mov mov edi, dword ptr [ebp + 20]
    add add dword ptr [ebp - 32], 4
    add add edx, esi
    mov mov dword ptr [edi + edx*4], ecx
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov edi, dword ptr [ebp + 24]
    add add edx, esi
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 16]
    mov mov dword ptr [edi + edx*4], ecx
    jb sub_100C3B75
    jmp sub_100C3D4F
    push push 116
    call sub_10085E36
    cmp cmp eax, esi
    je sub_100C3BCE
    mov mov ecx, eax
    call sub_100859A6
    mov mov dword ptr [ebp - 4], eax
L22:
    jmp sub_100C3BDD
    mov mov dword ptr [ebp - 4], esi
    cmp cmp dword ptr [ebp - 4], esi
    je sub_100C3E1A
L27:
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    push push dword ptr [ebp - 16]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 16]
    or or eax, 010000000h
    push push eax
    call sub_10085EBA
    cmp cmp eax, esi
    jl sub_100C3E1E
    mov mov ecx, dword ptr [ebp - 4]
    push push ebx
    call sub_10085A1C
    cmp cmp eax, esi
    jl sub_100C3E2F
    push push dword ptr [ebp - 4]
    mov mov ecx, edi
    call sub_100866A4
    cmp cmp eax, esi
    jl sub_100C3E41
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 20]
    cmp cmp dword ptr [ecx + 24], eax
    mov mov esi, dword ptr [ebx + 8]
    jne sub_100C3CB7
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edx + 8]
    mov mov ecx, eax
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    jmp sub_100C3CEA
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 8]
    shl shl ecx, 2
    add add esi, ecx
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    and and dword ptr [ebp - 12], 0
    and and ecx, 3
    test test eax, eax
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    jbe sub_100C3E0C
    shl shl eax, 2
    mov mov dword ptr [ebp - 20], eax
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    mov mov ecx, dword ptr [ebp - 36]
    push push 0
    push push 0
    push push dword ptr [ecx + 088h]
    call sub_10086830
    mov mov edi, dword ptr [ebp + 28]
    mov mov edx, dword ptr [edi]
    add add edx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp + 20]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [edi]
    add add eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + eax*4]
    cmp cmp ecx, -1
    je sub_100C3ED5
    mov mov esi, dword ptr [ebp - 12]
    mov mov edx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    shl shl esi, 2
    mov mov edx, dword ptr [esi + edx]
    mov mov edx, dword ptr [eax + edx*4]
    push push edx
    mov mov dword ptr [ebp - 28], edx
    mov mov dword ptr [ebp - 48], ecx
    call sub_1008639F
    test test eax, eax
    jl sub_100C3F14
    push push dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ebp - 48]
    call sub_1008646E
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 4]
    jl sub_100C3F2D
    mov mov eax, dword ptr [edi]
    add add eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebp + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebp + 24]
    mov mov dword ptr [esi + ecx], eax
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [ebx + 16]
    add add ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi + eax]
L31:
    mov mov edi, dword ptr [ebp + 12]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [eax + esi]
    mov mov edx, dword ptr [edx + 20]
    mov mov edx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [edx + 24], edi
    jne sub_100C3EA3
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [esi + eax], ecx
    jmp sub_100C3EBD
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [eax + edx]
    mov mov dword ptr [esi + ecx], eax
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ebp - 20], 4
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_100C3E12
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp + 28]
    add add dword ptr [eax], ecx
    inc inc dword ptr [ebp - 8]
    mov mov edi, dword ptr [ebp - 36]
    xor xor esi, esi
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp + 32]
    jae sub_100C3FCC
    jmp L35
    push push 01011A1F8h
    push push 012DFh
    jmp sub_100C3F93
    push push 01011A1C4h
    jmp sub_100C3F89
    push push 01011A1A4h
    push push 012E1h
    jmp sub_100C3FA6
    mov mov ecx, edi
    jmp sub_100C3F89
    push push 1
    call sub_1006CC21
    mov mov eax, dword ptr [ebp - 4]
    jmp sub_100C4002
    mov mov ecx, dword ptr [ebp - 12]
    push push 1
    call sub_1006CC30
    mov mov eax, ebx
    jmp sub_100C4010
    push push 01011A168h
    push push 012E0h
    jmp sub_100C3FD0
    push push 01011A148h
    push push 01194h
    push push dword ptr [ebx + 60]
    push push edi
    call sub_1008B8F0
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100C4039
    mov mov esi, eax
    jmp sub_100C400D
    mov mov esi, 08007000Eh
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    call sub_1006CC70
    mov mov eax, esi
    jmp sub_100C4050
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    call sub_1006CC7E
    mov mov eax, 08007000Eh
    jmp sub_100C4061
    push push 01011A120h
    jmp sub_100C3FE1
L38:
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 44
FUN_100c2f76 ENDP
END
