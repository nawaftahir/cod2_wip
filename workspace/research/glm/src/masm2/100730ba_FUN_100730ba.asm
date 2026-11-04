.686
.MODEL FLAT, C
EXTRN sub_1006CA13:PROC
EXTRN sub_1006CBB3:PROC
EXTRN sub_1006CC24:PROC
EXTRN sub_1006E236:PROC
EXTRN sub_1006E56D:PROC
EXTRN sub_1006E5B8:PROC
EXTRN sub_1006E7C8:PROC
EXTRN sub_1006E93E:PROC
EXTRN sub_100715D6:PROC
EXTRN sub_10071A12:PROC
EXTRN sub_10073752:PROC
EXTRN sub_10073766:PROC
EXTRN sub_1007377E:PROC
EXTRN sub_1007378A:PROC
EXTRN sub_10073790:PROC
EXTRN sub_100737A1:PROC
EXTRN sub_100737A2:PROC
EXTRN sub_100737A4:PROC
EXTRN sub_100737B8:PROC
EXTRN sub_100737D1:PROC
EXTRN sub_100737D5:PROC
EXTRN sub_100737D9:PROC
EXTRN sub_100737DA:PROC
EXTRN sub_100737E3:PROC
EXTRN sub_100737F1:PROC
EXTRN sub_100737FA:PROC
EXTRN sub_10073811:PROC
EXTRN sub_1007382B:PROC
EXTRN sub_1007382F:PROC
EXTRN sub_10073836:PROC
EXTRN sub_1007385F:PROC
EXTRN sub_100738C4:PROC
EXTRN sub_100738F9:PROC
EXTRN sub_10073902:PROC
EXTRN sub_10073905:PROC
EXTRN sub_10073911:PROC
EXTRN sub_1007394A:PROC
EXTRN sub_1007394C:PROC
EXTRN sub_1007394E:PROC
EXTRN sub_1007396F:PROC
EXTRN sub_10073973:PROC
EXTRN sub_1007399E:PROC
EXTRN sub_100739BE:PROC
EXTRN sub_100739CE:PROC
EXTRN sub_100739DF:PROC
EXTRN sub_100739E0:PROC
EXTRN sub_10073A41:PROC
EXTRN sub_10073A87:PROC
EXTRN sub_10073ACE:PROC
EXTRN sub_10073B00:PROC
EXTRN sub_10073B3B:PROC
EXTRN sub_10073B40:PROC
EXTRN sub_10073B5D:PROC
EXTRN sub_10073B9D:PROC
EXTRN sub_10073BA6:PROC
EXTRN sub_10073BD8:PROC
EXTRN sub_10073BE3:PROC
EXTRN sub_10073C04:PROC
EXTRN sub_10073C41:PROC
EXTRN sub_10073C4B:PROC
EXTRN sub_10073C4F:PROC
EXTRN sub_10073C91:PROC
EXTRN sub_10073CFE:PROC
EXTRN sub_10073D04:PROC
EXTRN sub_10073D0A:PROC
EXTRN sub_10073D10:PROC
EXTRN sub_10073D35:PROC
EXTRN sub_10073D45:PROC
EXTRN sub_10073D49:PROC
EXTRN sub_1007A6FE:PROC
EXTRN sub_1007AB28:PROC
EXTRN sub_1007B82B:PROC
EXTRN sub_1007B87B:PROC
EXTRN sub_100F78B1:PROC
EXTRN sub_100F78C5:PROC
EXTRN sub_100F78DD:PROC
EXTRN sub_100F78EF:PROC
EXTRN sub_100F7903:PROC
EXTRN sub_100F7917:PROC
EXTRN sub_100F7EBD:PROC
EXTRN sub_100F7EC5:PROC
EXTRN sub_100F7ECD:PROC
EXTRN sub_100F7ED5:PROC
EXTRN sub_100F7EDD:PROC
EXTRN sub_100F7EE5:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100730ba PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 124
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 88]
    mov mov dword ptr [ebp - 92], eax
    mov mov eax, dword ptr [ebx + 92]
    mov mov dword ptr [ebp - 56], eax
    mov mov eax, dword ptr [ebx + 24]
    mov mov dword ptr [ebp - 76], eax
    mov mov eax, dword ptr [ebx + 4]
    push push esi
    mov mov esi, dword ptr [eax + 24]
    mov mov eax, esi
    shl shl eax, 2
    push push edi
    xor xor edi, edi
    push push eax
    mov mov dword ptr [ebp - 28], edi
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 32], edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 36], edi
    mov mov dword ptr [ebp - 20], esi
    mov mov dword ptr [ebp - 12], eax
    call sub_100F78B1
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    je sub_10073752
    push push dword ptr [ebp - 12]
    call sub_100F78C5
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    je sub_10073766
    shl shl esi, 4
    push push esi
    mov mov dword ptr [ebp - 80], esi
    call sub_100F78DD
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 16], eax
    je sub_1007377E
    push push esi
    call sub_100F78EF
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 32], eax
    je sub_10073790
    push push dword ptr [ebp - 12]
    call sub_100F7903
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    je sub_100737A4
    push push dword ptr [ebp - 12]
    call sub_100F7917
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 36], eax
    je sub_100737B8
    cmp cmp dword ptr [ebp + 12], edi
    mov mov dword ptr [ebx + 92], edi
    je L0
    push push edi
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    call sub_1007A6FE
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_100737DA
    xor xor esi, esi
    cmp cmp dword ptr [ebx + 92], esi
    je L1
    mov mov dword ptr [ebp - 56], 1
    cmp cmp dword ptr [ebx + 80], esi
    jne sub_100737F1
    cmp cmp dword ptr [ebx + 84], esi
    jne sub_100737FA
    mov mov ecx, dword ptr [ebp - 12]
    mov mov esi, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ebp - 4]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ebp + 24]
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 20], edi
    jbe L4
    mov mov eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp + 12], eax
    mov mov eax, dword ptr [ebx + 24]
    mov mov esi, edi
    shl shl esi, 2
    mov mov eax, dword ptr [esi + eax]
    cmp cmp eax, -1
    je L2
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    push push eax
    call sub_1006CA13
    test test eax, eax
    jge L3
    fld fld qword ptr [ebx + 0A0h]
    mov mov eax, dword ptr [ebp + 12]
    fstp fstp qword ptr [eax]
    fld fld qword ptr [ebx + 0A8h]
    fstp fstp qword ptr [eax + 8]
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [esi + eax]
    cmp cmp ecx, -1
    je L6
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [eax + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov eax, dword ptr [eax + 116]
    cmp cmp eax, dword ptr [ecx + 4]
    je L7
    mov mov eax, dword ptr [ecx]
    mov mov ecx, dword ptr [ebp - 8]
    and and eax, 31
    mov mov dword ptr [esi + ecx], eax
    jmp L8
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [esi + eax], 31
    add add dword ptr [ebp + 12], 16
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 20]
    jb L5
    mov mov eax, dword ptr [ebx + 32]
    and and dword ptr [ebp - 52], 0
    or or dword ptr [ebp - 72], -1
    or or dword ptr [ebp - 68], -1
    and and dword ptr [ebp - 24], 0
    mov mov dword ptr [ebp - 60], eax
    mov mov dword ptr [ebp - 44], eax
L0:
    mov mov dword ptr [ebp - 48], 1
    mov mov eax, dword ptr [ebx + 8]
L1:
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 12]
    mov mov esi, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 88], ecx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 84], eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 80]
    mov mov esi, dword ptr [ebp - 16]
    mov mov edi, dword ptr [ebp - 32]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    or or dword ptr [ebp + 12], -1
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov esi, dword ptr [ebp - 8]
    mov mov edi, dword ptr [ebp - 36]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 16], edi
    je L9
    mov mov eax, dword ptr [ebp - 4]
    or or dword ptr [ebp + 12], -1
    mov mov dword ptr [ebx + 24], eax
    push push edi
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
    mov mov dword ptr [ebx + 80], edi
    mov mov dword ptr [ebx + 84], edi
    call sub_1007B82B
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_1007394E
    push push 23
    lea lea eax, [ebp + 12]
    push push eax
    lea lea eax, [ebp - 60]
    push push eax
    push push eax
    mov mov edi, 020500001h
    push push edi
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
    call sub_1006E56D
    mov mov esi, eax
    test test esi, esi
    jl sub_10073973
    mov mov eax, dword ptr [ebp + 24]
    or or dword ptr [ebp + 12], -1
    mov mov dword ptr [ebx + 24], eax
    xor xor eax, eax
    push push eax
    mov mov dword ptr [ebx + 80], eax
    mov mov dword ptr [ebx + 84], eax
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
L2:
    call sub_1007B87B
    mov mov esi, eax
    test test esi, esi
    jl sub_1007399E
    push push 23
    lea lea eax, [ebp + 12]
    push push eax
    lea lea eax, [ebp - 44]
    push push eax
    push push eax
    push push edi
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
    call sub_1006E5B8
    mov mov esi, eax
    test test esi, esi
    jl sub_100739BE
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 88], eax
    jne L10
    cmp cmp dword ptr [ebx + 80], eax
    jne sub_100738F9
    cmp cmp dword ptr [ebx + 84], eax
    jne sub_10073902
    mov mov dword ptr [ebx + 80], eax
    mov mov dword ptr [ebx + 84], eax
    xor xor edi, edi
    lea lea eax, [ebp - 108]
    push push eax
    push push dword ptr [ebp - 44]
    mov mov ecx, ebx
    call sub_1006CBB3
    test test eax, eax
    jge L11
    fld fld qword ptr [ebx + 0A8h]
    fstp fstp qword ptr [ebp - 108]
L6:
    fld fld qword ptr [ebx + 0A0h]
    fstp fstp qword ptr [ebp - 100]
    fld fld qword ptr [ebp - 108]
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 65
    je L12
    fld fld qword ptr [ebp - 100]
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 5
    jp L13
    mov mov dword ptr [ebp - 52], 1
    cmp cmp dword ptr [ebp - 20], edi
    jbe sub_100737D1
    mov mov eax, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebp + 24]
    mov mov edi, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [ebp - 20]
    sub sub edi, esi
    mov mov dword ptr [ebp - 64], eax
    mov mov eax, dword ptr [esi]
    cmp cmp eax, -1
    je sub_100737D9
    lea lea ecx, [ebp - 124]
    push push ecx
    push push eax
    mov mov ecx, ebx
    call sub_1006CC24
    test test eax, eax
    jge sub_1007378A
    fld fld qword ptr [ebx + 0A0h]
    fstp fstp qword ptr [ebp - 124]
    fld fld qword ptr [ebx + 0A8h]
    fst fst qword ptr [ebp - 116]
    jmp sub_100737A1
    fld fld qword ptr [ebp - 116]
    cmp cmp dword ptr [ebp - 52], 0
    mov mov ecx, dword ptr [ebp - 40]
    je sub_100737D5
    fld fld qword ptr [ebp - 124]
    mov mov eax, ecx
    fstp fstp qword ptr [eax]
    fstp fstp qword ptr [eax + 8]
    mov mov edx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [esi]
    mov mov edx, dword ptr [edx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax]
    and and eax, 31
    mov mov dword ptr [edi + esi], eax
    jmp sub_1007382B
    fld fld qword ptr [ecx]
    fcomp fcomp qword ptr [ebp - 124]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10073811
    fld fld qword ptr [ebp - 124]
    fstp fstp qword ptr [ecx]
    fcom fcom qword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1007382F
    fstp fstp qword ptr [ecx + 8]
    jmp sub_10073836
    fstp fstp st(0)
    mov mov edx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [esi]
    mov mov edx, dword ptr [edx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax]
    and and dword ptr [edi + esi], eax
    jmp sub_1007385F
    mov mov ecx, dword ptr [ebp - 40]
    add add ecx, 16
    add add esi, 4
    dec dec dword ptr [ebp - 64]
    mov mov dword ptr [ebp - 40], ecx
    jne sub_100737E3
    xor xor edi, edi
    fld fld qword ptr [ebp - 108]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100738C4
    fld fld qword ptr [ebp - 100]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10073A41
    fldz fldz
    fcomp fcomp qword ptr [ebp - 108]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_10073905
    fldz fldz
    fcomp fcomp qword ptr [ebp - 100]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_10073911
    mov mov dword ptr [ebx + 88], 1
    cmp cmp dword ptr [ebp - 48], edi
    je sub_1007394A
    cmp cmp dword ptr [ebp - 52], edi
    jne sub_1007394C
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 72]
    push push eax
    push push dword ptr [ebp - 24]
    mov mov ecx, ebx
    push push dword ptr [ebp + 12]
    call sub_100715D6
    test test eax, eax
    mov mov dword ptr [ebp - 48], 1
    jne sub_1007396F
    mov mov dword ptr [ebp - 48], edi
    cmp cmp dword ptr [ebp - 20], edi
    jbe sub_100739CE
    mov mov esi, dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 20]
    sub sub ecx, esi
    mov mov dword ptr [ebp - 40], ecx
    mov mov dword ptr [ebp - 64], eax
    mov mov eax, dword ptr [ecx + esi]
    mov mov edx, dword ptr [esi]
    cmp cmp eax, edx
    je sub_100739E0
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + edx*4]
    and and word ptr [eax], 0FE60h
    mov mov edi, dword ptr [ecx]
    mov mov edx, dword ptr [eax]
    and and edi, 019Fh
    or or edi, edx
    mov mov dword ptr [eax], edi
    fld fld qword ptr [ecx + 32]
    fstp fstp qword ptr [eax + 32]
    xor xor edi, edi
    fld fld qword ptr [ecx + 40]
    mov mov ecx, dword ptr [ebp - 40]
    fstp fstp qword ptr [eax + 40]
    add add esi, 4
    dec dec dword ptr [ebp - 64]
    jne sub_100739DF
    cmp cmp dword ptr [ebp + 20], edi
    je sub_10073A87
    mov mov eax, dword ptr [ebp - 4]
    push push edi
    push push dword ptr [ebp + 20]
    mov mov ecx, ebx
    push push dword ptr [ebp - 44]
    mov mov dword ptr [ebx + 24], eax
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebx + 80], edi
    mov mov dword ptr [ebx + 84], edi
    call sub_10071A12
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_10073BE3
    mov mov eax, dword ptr [ebp + 24]
    push push edi
    push push dword ptr [ebp + 20]
    mov mov ecx, ebx
    mov mov dword ptr [ebx + 24], eax
    mov mov dword ptr [ebx + 80], edi
    mov mov dword ptr [ebx + 84], edi
    call sub_1007AB28
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_10073C04
    cmp cmp dword ptr [ebx + 88], edi
    jne sub_10073ACE
    cmp cmp dword ptr [ebx + 80], edi
    jne sub_10073B3B
    cmp cmp dword ptr [ebx + 84], edi
    jne sub_10073B40
    mov mov dword ptr [ebx + 80], edi
    mov mov dword ptr [ebx + 84], edi
    cmp cmp dword ptr [ebx + 92], edi
    jne sub_10073B00
    inc inc dword ptr [ebp - 24]
    cmp cmp dword ptr [ebp - 24], 0400h
    jb sub_100737A2
    jmp sub_10073B5D
    mov mov ecx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 32]
    push push ecx
    push push dword ptr [ebp - 84]
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebp - 16]
    push push dword ptr [ebp - 88]
    mov mov dword ptr [ebp - 16], edx
    mov mov edx, dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 36], eax
    call sub_1006E7C8
    cmp cmp dword ptr [ebp - 24], edi
    mov mov dword ptr [ebx + 76], edi
    mov mov dword ptr [ebx + 80], edi
    mov mov dword ptr [ebx + 84], edi
    jne sub_10073B9D
    mov mov dword ptr [ebp - 56], 1
    jmp sub_10073BA6
    xor xor edi, edi
    mov mov eax, 0400h
    cmp cmp dword ptr [ebp - 24], eax
    jne sub_10073BD8
    push push eax
    push push 01010F8F8h
    push push 0DB7h
    push push dword ptr [ebp + 8]
    push push ebx
    call sub_1006E236
    add add esp, 20
    jmp sub_10073C91
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, edi
    jbe sub_10073C41
    mov mov edx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 16]
    sub sub esi, edx
    mov mov dword ptr [ebp + 24], eax
    mov mov eax, dword ptr [edx]
    cmp cmp eax, -1
    je sub_10073C4B
    mov mov edi, dword ptr [ebx + 8]
    fld fld qword ptr [ecx]
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    fstp fstp qword ptr [eax + 32]
    fld fld qword ptr [ecx + 8]
    fstp fstp qword ptr [eax + 40]
    mov mov edi, dword ptr [esi + edx]
    or or edi, 0180h
    mov mov dword ptr [eax], edi
    add add ecx, 16
    add add edx, 4
    dec dec dword ptr [ebp + 24]
    jne sub_10073C4F
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [ebp - 76]
    mov mov esi, dword ptr [ebp - 4]
L11:
    mov mov eax, ecx
    shr shr ecx, 2
    mov mov dword ptr [ebx + 24], edi
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    cmp cmp dword ptr [ebp - 24], 0
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    je sub_10073CFE
    cmp cmp dword ptr [ebp - 48], 0
    je sub_10073D04
    cmp cmp dword ptr [ebx + 80], 0
    jne sub_10073D0A
    cmp cmp dword ptr [ebx + 84], 0
    jne sub_10073D10
    mov mov ecx, dword ptr [ebp - 72]
    push push 0
    push push 0
    lea lea eax, [ebp - 68]
    push push eax
    mov mov eax, dword ptr [ebx + 24]
    lea lea eax, [eax + ecx*4]
    push push eax
    push push 010000001h
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
    call sub_1006E93E
    test test eax, eax
    jge sub_10073D35
    mov mov esi, 080004005h
    jmp sub_10073D45
    xor xor esi, esi
    jmp sub_10073D49
L13:
    mov mov esi, 08007000Eh
    mov mov eax, dword ptr [ebp - 76]
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 24], eax
    call sub_100F7EBD
    push push dword ptr [ebp - 28]
    call sub_100F7EC5
    push push dword ptr [ebp - 16]
    call sub_100F7ECD
    push push dword ptr [ebp - 32]
    call sub_100F7ED5
    push push dword ptr [ebp - 8]
    call sub_100F7EDD
    push push dword ptr [ebp - 36]
    call sub_100F7EE5
    mov mov eax, dword ptr [ebp - 92]
    mov mov dword ptr [ebx + 88], eax
    mov mov eax, dword ptr [ebp - 56]
    add add esp, 24
    mov mov dword ptr [ebx + 92], eax
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_100730ba ENDP
END
