.686
.MODEL FLAT, C
EXTRN sub_1006C853:PROC
EXTRN sub_1006C8C3:PROC
EXTRN sub_100853F1:PROC
EXTRN sub_10085460:PROC
EXTRN sub_100854E0:PROC
EXTRN sub_1008574C:PROC
EXTRN sub_100857DB:PROC
EXTRN sub_10085881:PROC
EXTRN sub_100858F0:PROC
EXTRN sub_10085977:PROC
EXTRN sub_10085BDC:PROC
EXTRN sub_10085C76:PROC
EXTRN sub_10085F5D:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A7C:PROC
EXTRN sub_100B9B5C:PROC
EXTRN sub_100BF53D:PROC
EXTRN sub_100BF557:PROC
EXTRN sub_100BF578:PROC
EXTRN sub_100BF583:PROC
EXTRN sub_100BF58B:PROC
EXTRN sub_100BF594:PROC
EXTRN sub_100BF59A:PROC
EXTRN sub_100BF5AF:PROC
EXTRN sub_100BF5CE:PROC
EXTRN sub_100BF5E2:PROC
EXTRN sub_100BF5FC:PROC
EXTRN sub_100BF675:PROC
EXTRN sub_100BF6DC:PROC
EXTRN sub_100BF6E1:PROC
EXTRN sub_100BF709:PROC
EXTRN sub_100BF72D:PROC
EXTRN sub_100BF733:PROC
EXTRN sub_100BF739:PROC
EXTRN sub_100BF771:PROC
EXTRN sub_100BF779:PROC
EXTRN sub_100BF796:PROC
EXTRN sub_100BF7B8:PROC
EXTRN sub_100BF7CF:PROC
EXTRN sub_100BF7E6:PROC
EXTRN sub_100BF7EE:PROC
EXTRN sub_100BF7F4:PROC
EXTRN sub_100BF7FE:PROC
EXTRN sub_100BF81B:PROC
EXTRN sub_100BF830:PROC
EXTRN sub_100BF849:PROC
EXTRN sub_100BF874:PROC
EXTRN sub_100BF880:PROC
EXTRN sub_100BF8C9:PROC
EXTRN sub_100BF8E5:PROC
EXTRN sub_100BF8E7:PROC
EXTRN sub_100BF916:PROC
EXTRN sub_100BF967:PROC
EXTRN sub_100BF9D6:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100bf075 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0110h
    push push ebx
    push push esi
    push push edi
    and and dword ptr [ebp - 8], 0
    and and dword ptr [ebp - 28], 0
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [eax]
    xor xor edi, edi
    inc inc edi
    push push edi
    and and esi, 0FFFFFh
    push push esi
    lea lea ecx, [ebp - 28]
    push push ecx
    lea lea ecx, [ebp - 0D0h]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 0110h]
    push push ecx
    push push 010119358h
    push push eax
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 20], 2
    mov mov dword ptr [ebp - 16], 3
    mov mov dword ptr [ebp - 12], esi
    call sub_100B9A11
    test test eax, eax
    jne L2
    push push 116
    call sub_10085881
    test test eax, eax
    je L0
    mov mov ecx, eax
    call sub_100853F1
    mov mov edi, eax
    mov mov dword ptr [ebp - 4], edi
    jmp L1
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [ebp - 4]
    test test edi, edi
    je L12
    push push 0
    lea lea eax, [esi + esi]
    push push esi
    push push eax
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 074600000h
    jmp L3
    push push edi
    push push esi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0D0h]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    lea lea eax, [ebp - 0110h]
    push push eax
    push push 0101192F8h
    push push dword ptr [ebx + 0100h]
    mov mov ecx, ebx
    call sub_100B9A7C
    test test eax, eax
    jne L6
    push push 116
    call sub_100858F0
    test test eax, eax
    je L4
    mov mov ecx, eax
    call sub_10085460
    mov mov edi, eax
    mov mov dword ptr [ebp - 4], edi
    jmp L5
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [ebp - 4]
    test test edi, edi
    je sub_100BF557
    push push 0
    lea lea eax, [esi + esi]
    push push esi
    push push eax
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 074700000h
    push push eax
    mov mov ecx, edi
    call sub_10085977
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    mov mov ecx, edi
    jl sub_100BF5CE
    push push dword ptr [ebx + 0100h]
    call sub_100854E0
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jl sub_100BF5E2
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edi, dword ptr [edi + 16]
    mov mov eax, esi
    mov mov esi, dword ptr [edx + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 4]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [edx + 8]
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 0D0h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    lea lea esi, [ebp - 0C0h]
    jmp sub_100BF675
    push push edi
    push push esi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0D0h]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    lea lea eax, [ebp - 0110h]
    push push eax
    push push 0101193B8h
    push push dword ptr [ebx + 0100h]
    mov mov ecx, ebx
    call sub_100B9B5C
    test test eax, eax
    jne sub_100BF6DC
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ebp - 0B0h]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edi, dword ptr [eax + 60]
    mov mov ecx, 080000h
    cmp cmp edi, ecx
    mov mov dword ptr [ebp - 8], edi
L4:
    jne L7
    xor xor eax, eax
    test test esi, esi
    jbe sub_100BF53D
    mov mov ecx, esi
    lea lea esi, [ebp - 0A0h]
    lea lea edi, [ebp - 28]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp + eax*4 - 0B0h]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 56]
    mov mov dword ptr [ebp + eax*4 - 48], ecx
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 12]
    jb L8
    jmp L9
    mov mov edi, dword ptr [ebp - 0A0h]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov dword ptr [ebp - 4], edi
    mov mov edi, dword ptr [edi + 60]
    cmp cmp edi, ecx
    mov mov dword ptr [ebp - 32], edi
    jne L10
    xor xor eax, eax
    test test esi, esi
    jbe sub_100BF583
    mov mov ecx, esi
    lea lea esi, [ebp - 0B0h]
    lea lea edi, [ebp - 28]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp + eax*4 - 0A0h]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 56]
    mov mov dword ptr [ebp + eax*4 - 48], ecx
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 12]
    jb L11
    mov mov esi, dword ptr [ebp - 12]
    jmp sub_100BF5AF
    cmp cmp esi, 1
    jne sub_100BF779
    mov mov eax, dword ptr [eax + 72]
L6:
    cmp cmp eax, -1
    mov mov edi, 0FFF00000h
    mov mov ecx, 010100000h
    je sub_100BF578
    mov mov edx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [eax]
    mov mov edx, eax
    and and edx, edi
    cmp cmp edx, ecx
    jne sub_100BF58B
    and and eax, 0FFFFFh
    cmp cmp eax, esi
    jne sub_100BF594
    cmp cmp dword ptr [ebp - 8], 0
    jne sub_100BF59A
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 0A0h]
    jmp sub_100BF5FC
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    je sub_100BF7CF
    mov mov edx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [eax]
    mov mov edx, eax
    and and edx, edi
    cmp cmp edx, ecx
    jne sub_100BF7E6
    and and eax, 0FFFFFh
    cmp cmp eax, 1
    jne sub_100BF7F4
    cmp cmp dword ptr [ebp - 32], 0
    jne sub_100BF7FE
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 0B0h]
    mov mov dword ptr [ebp - 28], eax
    and and dword ptr [ebp - 4], 0
    xor xor eax, eax
    inc inc eax
    test test esi, esi
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 8], eax
    jbe sub_100BF739
    fld fld qword ptr [g_1019BC88]
    fld fld qword ptr [g_1019BE20]
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp + eax*4 - 0D0h]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ecx + eax*4]
    mov mov edi, dword ptr [edx + 4]
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, 0100h
    test test dword ptr [eax + 4], edi
    jne sub_100BF6E1
    and and dword ptr [ebp - 8], 0
    and and dword ptr [ebp - 12], 0
    fld fld st(1)
    fld fld qword ptr [edx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BF709
    and and dword ptr [ebp - 8], 0
    fld fld st(0)
    fld fld qword ptr [edx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BF72D
    and and dword ptr [ebp - 12], 0
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp + eax*4 - 0C0h]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ecx + 4]
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + edx*4]
    xor xor edx, edx
    test test dword ptr [eax + 4], edi
    jne sub_100BF771
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 12], edx
    fld fld st(0)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BF796
    mov mov dword ptr [ebp - 8], edx
    fld fld st(1)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BF7B8
    mov mov dword ptr [ebp - 12], edx
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], esi
    jb sub_100BF733
    cmp cmp dword ptr [ebp - 8], edx
    fstp fstp st(0)
    fstp fstp st(0)
    jne sub_100BF7EE
    cmp cmp dword ptr [ebp - 12], edx
    je sub_100BF8E5
    push push 116
    call sub_10085BDC
    test test eax, eax
    je sub_100BF81B
    mov mov ecx, eax
    call sub_1008574C
    mov mov edi, eax
    mov mov dword ptr [ebp - 4], edi
    jmp sub_100BF830
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [ebp - 4]
    test test edi, edi
    jne sub_100BF849
L8:
    mov mov eax, 08007000Eh
    jmp sub_100BF916
    mov mov eax, esi
    and and eax, 0FFFFFh
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100BF874
    or or eax, 074600000h
    jmp sub_100BF880
    or or eax, 074700000h
    push push 0
    push push esi
    lea lea ecx, [esi + esi]
    push push ecx
    push push eax
    mov mov ecx, edi
    call sub_10085C76
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    mov mov ecx, edi
    jl sub_100BF8C9
    push push dword ptr [ebx + 0100h]
    call sub_100857DB
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jge sub_100BF8E7
    mov mov ecx, edi
    push push 1
    call sub_1006C853
    mov mov eax, dword ptr [ebp - 8]
    jmp sub_100BF967
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edi, dword ptr [edi + 16]
    mov mov eax, esi
    mov mov esi, dword ptr [edx + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 4]
    and and ecx, 3
L10:
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [edx + 8]
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 28]
L11:
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L12:
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    lea lea esi, [ebp - 48]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edx + 8]
    mov mov ecx, eax
    shr shr ecx, 2
    add add edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebx + 0100h]
    push push edx
    call sub_10085F5D
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    mov mov esi, eax
    call sub_1006C8C3
    mov mov eax, esi
    jmp sub_100BF9D6
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100bf075 ENDP
END
