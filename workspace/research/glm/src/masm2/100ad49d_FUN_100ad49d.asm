.686
.MODEL FLAT, C
EXTRN sub_1006C7D8:PROC
EXTRN sub_1006C7EC:PROC
EXTRN sub_10085468:PROC
EXTRN sub_100854E5:PROC
EXTRN sub_10085540:PROC
EXTRN sub_100855D8:PROC
EXTRN sub_100858F8:PROC
EXTRN sub_10085975:PROC
EXTRN sub_100859D0:PROC
EXTRN sub_10085A67:PROC
EXTRN sub_10085E74:PROC
EXTRN sub_10086292:PROC
EXTRN sub_10086436:PROC
EXTRN sub_1008648C:PROC
EXTRN sub_1008B160:PROC
EXTRN sub_100AD904:PROC
EXTRN sub_100AD92B:PROC
EXTRN sub_100AD932:PROC
EXTRN sub_100AD94C:PROC
EXTRN sub_100AD95D:PROC
EXTRN sub_100AD983:PROC
EXTRN sub_100AD998:PROC
EXTRN sub_100AD9A2:PROC
EXTRN sub_100AD9B7:PROC
EXTRN sub_100AD9B9:PROC
EXTRN sub_100AD9CE:PROC
EXTRN sub_100ADA00:PROC
EXTRN sub_100ADA3A:PROC
EXTRN sub_100ADA51:PROC
EXTRN sub_100ADA75:PROC
EXTRN sub_100ADA86:PROC
EXTRN sub_100ADA95:PROC
EXTRN sub_100ADA9C:PROC
EXTRN sub_100ADAAE:PROC
EXTRN sub_100ADAF4:PROC
EXTRN sub_100ADB9A:PROC
EXTRN sub_100ADC3E:PROC
.CODE
FUN_100ad49d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    push push ebx
    xor xor eax, eax
    push push esi
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 12], eax
    push push edi
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 16], eax
    jbe L2
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    test test eax, eax
    je L0
    mov mov ecx, dword ptr [eax]
    test test ecx, 0FFF00000h
    je L3
    test test ecx, 0FFFFFh
    je L4
    mov mov ecx, dword ptr [eax + 12]
    test test ecx, ecx
    mov mov dword ptr [ebp - 28], ecx
    je L5
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 16]
    mov mov esi, dword ptr [edx + 20]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [esi + edx*4]
    mov mov edi, dword ptr [ebp + 16]
    cmp cmp dword ptr [edx + 12], edi
    jne L6
    mov mov edx, dword ptr [edx + 4]
    mov mov edi, dword ptr [ebp - 4]
    cmp cmp edx, dword ptr [edi + 088h]
    jne L7
    mov mov ebx, eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 20], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 28], eax
    jbe L8
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [esi + edx*4]
    cmp cmp dword ptr [edx + 16], 2
    je L9
    inc inc eax
    add add ecx, 4
    cmp cmp eax, dword ptr [ebp - 28]
    jb L8
    mov mov eax, dword ptr [ebp - 16]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 16], eax
    jb L1
    test test ebx, ebx
    jne L10
    push push 010117350h
    push push 012D7h
    push push 0
    push push dword ptr [ebp - 4]
    call sub_1008B160
L0:
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AD92B
    xor xor eax, eax
    jmp sub_100AD932
    mov mov eax, dword ptr [ebx]
    mov mov esi, eax
    mov mov edi, 0FFFFFh
    and and esi, edi
    and and eax, 0FFF00000h
    cmp cmp eax, 050000000h
    mov mov dword ptr [ebp - 40], esi
    push push 116
    jne L13
    call sub_100858F8
    test test eax, eax
    je L11
    mov mov ecx, eax
    call sub_10085468
    mov mov dword ptr [ebp + 12], eax
    jmp L12
    and and dword ptr [ebp + 12], 0
    mov mov esi, dword ptr [ebp + 12]
    test test esi, esi
    je L15
    mov mov eax, dword ptr [ebx + 12]
    push push 0
    inc inc eax
    push push eax
    push push dword ptr [ebx + 4]
    mov mov ecx, esi
    push push dword ptr [ebx]
    call sub_10085975
    mov mov edi, eax
    test test edi, edi
    jl sub_100AD983
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 20]
    lea lea eax, [ecx + eax*4]
    push push dword ptr [eax]
    mov mov ecx, esi
    mov mov dword ptr [ebp - 28], eax
    call sub_100854E5
    mov mov edi, eax
    test test edi, edi
    jl sub_100AD9A2
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    mov mov ecx, dword ptr [ebp - 4]
    push push 2
    push push dword ptr [ebp + 16]
    push push dword ptr [ecx + 088h]
    call sub_10086292
    cmp cmp eax, -1
    mov mov dword ptr [ebp + 8], eax
    jne L14
    mov mov edi, 08007000Eh
    jmp sub_100AD9CE
    mov mov ecx, dword ptr [esi + 4]
    mov mov eax, dword ptr [ebp + 12]
    mov mov edi, dword ptr [eax + 8]
    mov mov esi, dword ptr [ebx + 8]
    shl shl ecx, 2
    mov mov eax, ecx
    mov mov edx, dword ptr [ebp + 12]
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebx + 12]
    mov mov esi, dword ptr [ebx + 16]
    mov mov edi, dword ptr [edx + 16]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebx + 12]
    mov mov ecx, dword ptr [edx + 16]
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + eax*4], esi
    push push edx
    jmp sub_100ADA00
    call sub_100859D0
    test test eax, eax
    je L17
    mov mov ecx, eax
    call sub_10085540
    mov mov dword ptr [ebp + 12], eax
    jmp L18
    and and dword ptr [ebp + 12], 0
    cmp cmp dword ptr [ebp + 12], 0
    jne L19
    mov mov edi, 08007000Eh
    jmp sub_100ADA51
    mov mov ecx, dword ptr [ebx + 4]
    mov mov eax, ecx
    xor xor edx, edx
    div div esi
    mov mov edx, dword ptr [ebx + 12]
L12:
    push push 0
    inc inc edx
    push push edx
    add add ecx, eax
    mov mov dword ptr [ebp - 44], eax
    lea lea eax, [esi + 1]
    xor xor eax, dword ptr [ebx]
    push push ecx
    mov mov ecx, dword ptr [ebp + 12]
    and and eax, edi
    xor xor eax, dword ptr [ebx]
    push push eax
    call sub_10085A67
    mov mov edi, eax
    test test edi, edi
    jl sub_100ADA75
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 20]
    lea lea eax, [ecx + eax*4]
    push push dword ptr [eax]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 28], eax
    call sub_100855D8
    mov mov edi, eax
    test test edi, edi
    jl sub_100ADA95
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 44], ecx
    mov mov dword ptr [ebp - 24], ecx
    jbe sub_100ADA86
    mov mov eax, esi
    shl shl eax, 2
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 8], ecx
    lea lea ecx, [eax + 4]
    mov mov dword ptr [ebp - 48], ecx
    mov mov dword ptr [ebp - 16], eax
    jmp sub_100AD94C
    mov mov esi, dword ptr [ebp - 40]
    xor xor eax, eax
    inc inc eax
    cmp cmp esi, eax
    mov mov dword ptr [ebp - 36], eax
    jbe sub_100AD998
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 8]
    add add eax, ecx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 16]
    lea lea edi, [esi - 1]
    add add eax, 4
    mov mov dword ptr [ebp - 32], edi
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [ecx + edi*4]
    cmp cmp dword ptr [edi + 16], edx
    je sub_100AD9B9
    and and dword ptr [ebp - 36], 0
    add add eax, 4
    dec dec dword ptr [ebp - 32]
L13:
    jne sub_100AD9B7
    mov mov eax, dword ptr [ebp + 12]
    mov mov edi, dword ptr [eax + 8]
    add add edi, dword ptr [ebp - 12]
    shl shl esi, 2
    mov mov ecx, esi
    mov mov esi, dword ptr [ebx + 8]
    add add esi, dword ptr [ebp - 8]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    cmp cmp dword ptr [ebp - 36], 0
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 8]
    je sub_100ADA3A
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 8]
L14:
    mov mov ecx, dword ptr [edx + ecx]
    mov mov edx, dword ptr [ebp - 16]
    mov mov dword ptr [edx + eax], ecx
    jmp sub_100ADAAE
    mov mov ecx, dword ptr [ebp - 12]
    fldz fldz
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov esi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [esi + 12]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 2
    push push eax
    push push dword ptr [esi + 4]
    mov mov ecx, edi
    mov mov dword ptr [ebp - 36], eax
    call sub_10086436
    cmp cmp eax, -1
    je sub_100AD904
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov dword ptr [edx + ecx], eax
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, dword ptr [edi + 088h]
    jne sub_100ADAF4
    push push dword ptr [ebp - 36]
    mov mov ecx, edi
    push push dword ptr [ebp - 20]
    push push dword ptr [ebp + 8]
    call L16
L16:
    mov mov edi, eax
    test test edi, edi
    jl sub_100ADB9A
    mov mov edi, dword ptr [ebp - 4]
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 2
    push push dword ptr [ebp + 16]
    mov mov ecx, edi
    push push dword ptr [edi + 088h]
    call sub_1008648C
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 36], eax
    je sub_100AD95D
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edx, dword ptr [ebp + 12]
    mov mov edi, dword ptr [edx + 16]
    mov mov esi, dword ptr [ebx + 16]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    inc inc dword ptr [ebp - 24]
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [edx + 16]
    mov mov eax, dword ptr [ebx + 12]
    mov mov edx, dword ptr [ebp - 36]
    mov mov dword ptr [ecx + eax*4], edx
    mov mov eax, dword ptr [ebp - 40]
    shl shl eax, 2
    add add dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 48]
    add add dword ptr [ebp - 12], eax
    add add dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [ebp - 44]
    jb sub_100ADA9C
    push push dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [eax]
    call sub_10085E74
L19:
    mov mov ecx, dword ptr [ebp + 12]
    push push 1
    call sub_1006C7D8
    and and dword ptr [ebp + 12], 0
    xor xor edi, edi
    mov mov ecx, dword ptr [ebp + 12]
    test test ecx, ecx
    je sub_100ADC3E
    push push 1
    call sub_1006C7EC
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
FUN_100ad49d ENDP
END
