.686
.MODEL FLAT, C
EXTRN sub_1006C4B3:PROC
EXTRN sub_1006C8C4:PROC
EXTRN sub_1006C8EA:PROC
EXTRN sub_100853DE:PROC
EXTRN sub_10085779:PROC
EXTRN sub_100857E4:PROC
EXTRN sub_1008586E:PROC
EXTRN sub_10085B4A:PROC
EXTRN sub_10085C09:PROC
EXTRN sub_10085C7F:PROC
EXTRN sub_10085F5F:PROC
EXTRN sub_10086471:PROC
EXTRN sub_100864DD:PROC
EXTRN sub_100865AF:PROC
EXTRN sub_100865CB:PROC
EXTRN sub_100B9AF3:PROC
EXTRN sub_100B9B37:PROC
EXTRN sub_100BFA46:PROC
EXTRN sub_100BFA71:PROC
EXTRN sub_100BFA94:PROC
EXTRN sub_100BFAB6:PROC
EXTRN sub_100BFABE:PROC
EXTRN sub_100BFB28:PROC
EXTRN sub_100BFB3A:PROC
EXTRN sub_100BFB8A:PROC
EXTRN sub_100BFBA2:PROC
EXTRN sub_100BFBAD:PROC
EXTRN sub_100BFBBA:PROC
EXTRN sub_100BFBCF:PROC
EXTRN sub_100BFBD1:PROC
EXTRN sub_100BFBD4:PROC
EXTRN sub_100BFBDA:PROC
EXTRN sub_100BFBE4:PROC
EXTRN sub_100BFBE6:PROC
EXTRN sub_100BFBEC:PROC
EXTRN sub_100BFBF4:PROC
EXTRN sub_100BFBFA:PROC
EXTRN sub_100BFBFB:PROC
EXTRN sub_100BFC09:PROC
EXTRN sub_100BFC0F:PROC
EXTRN sub_100BFC55:PROC
EXTRN sub_100BFC58:PROC
EXTRN sub_100BFC64:PROC
EXTRN sub_100BFC67:PROC
EXTRN sub_100BFC7A:PROC
EXTRN sub_100BFC90:PROC
EXTRN sub_100BFCA3:PROC
EXTRN sub_100BFCB1:PROC
EXTRN sub_100BFD29:PROC
EXTRN sub_100BFD36:PROC
EXTRN sub_100BFDCA:PROC
EXTRN sub_100BFE23:PROC
EXTRN sub_100BFE40:PROC
EXTRN sub_100BFEAE:PROC
EXTRN sub_100BFEC8:PROC
EXTRN sub_100BFED1:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100bf52c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0218h
    or or eax, -1
    push push esi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 84], eax
    mov mov dword ptr [ebp - 80], eax
    mov mov dword ptr [ebp - 76], eax
    mov mov dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 64], eax
    mov mov dword ptr [ebp - 60], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    mov mov ecx, eax
    push push edi
    xor xor edi, edi
    and and ecx, 0FFFFFh
    and and eax, 0FFF00000h
    cmp cmp eax, 020900000h
    mov mov dword ptr [ebp - 88], edi
    mov mov dword ptr [ebp - 72], edi
    mov mov dword ptr [ebp - 56], ecx
    je L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100BFA46
    push push 116
    call sub_1008586E
    cmp cmp eax, edi
    je L1
    mov mov ecx, eax
    call sub_100853DE
    mov mov dword ptr [ebp - 32], eax
    jmp L2
    mov mov dword ptr [ebp - 32], edi
    push push ebx
    mov mov ebx, dword ptr [ebp - 32]
    cmp cmp ebx, edi
    jne L3
    mov mov eax, 08007000Eh
    jmp sub_100BFA71
    push push dword ptr [esi + 0100h]
    mov mov ecx, ebx
    call sub_10085B4A
    mov mov edi, eax
    test test edi, edi
    jge L4
    push push 1
    mov mov ecx, ebx
    call sub_1006C4B3
    mov mov eax, edi
    jmp sub_100BFA94
    mov mov ecx, dword ptr [ebp - 56]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [ebx + 12], 1
    mov mov dword ptr [ebx + 4], 2
    mov mov dword ptr [ebx], 020900001h
    mov mov dword ptr [ebp - 52], eax
    jbe sub_100BFAB6
    shl shl ecx, 2
    mov mov dword ptr [ebp - 40], ecx
    jmp L5
    mov mov ebx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [esi + 0100h]
L2:
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebx + 16]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [eax + ecx]
    mov mov edx, dword ptr [ebx + 8]
L3:
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [ebx + 8]
    and and dword ptr [ebp - 12], 0
    push push 40
    mov mov dword ptr [ecx + 4], eax
    pop pop ecx
    push push 1
    or or eax, -1
    push push 1
    lea lea edi, [ebp - 0F8h]
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 88]
    push push eax
    lea lea eax, [ebp - 0F8h]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 01D8h]
    push push eax
    push push 010119B38h
    push push ebx
    mov mov ecx, esi
    call sub_100B9AF3
    test test eax, eax
    jne sub_100BFB28
    mov mov edi, dword ptr [ebp - 0E8h]
    cmp cmp edi, dword ptr [ebp - 0D8h]
    jne sub_100BFB3A
    and and dword ptr [ebp - 12], eax
    push push 1
    push push 1
    lea lea eax, [ebp - 72]
    push push eax
    lea lea eax, [ebp - 0198h]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 0218h]
    push push eax
    push push 010119BF8h
    push push ebx
    mov mov ecx, esi
    call sub_100B9B37
    mov mov edx, dword ptr [ebp - 0F8h]
    cmp cmp dword ptr [ebp - 0198h], edx
    jne L6
    mov mov eax, dword ptr [ebp - 0188h]
    mov mov dword ptr [ebp - 16], eax
L5:
    jmp L7
    mov mov dword ptr [ebp - 16], edx
    cmp cmp dword ptr [ebp - 16], -1
    je sub_100BFB8A
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    shl shl eax, 2
    mov mov ecx, dword ptr [ecx + eax]
    cmp cmp dword ptr [ecx + 20], -1
    je sub_100BFBA2
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 72]
    cmp cmp ecx, -1
    je sub_100BFBBA
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax], 011100001h
    mov mov dword ptr [ebp - 20], eax
    jne sub_100BFBCF
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov dword ptr [ebp - 24], ecx
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov edx, edi
    jmp L8
    cmp cmp dword ptr [ecx + 8], -1
    jne L10
    mov mov edi, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov edi, dword ptr [eax]
    mov mov ebx, edi
    and and ebx, 0FFF00000h
    cmp cmp ebx, 010000000h
    jne L12
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 8], edi
    and and dword ptr [ebp - 8], 0FFFFFh
    jbe L14
    mov mov ebx, dword ptr [eax + 16]
    cmp cmp dword ptr [ebx], edx
    je L12
    inc inc dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp - 8]
    add add ebx, 4
    cmp cmp dword ptr [ebp - 4], edi
    jb L11
    jmp L15
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ecx + 72]
    cmp cmp eax, -1
    jne L9
    mov mov edi, dword ptr [ebp - 24]
    mov mov edx, dword ptr [edi + 4]
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [eax + edx*4]
    mov mov edx, 0100h
    test test dword ptr [ebx + 4], edx
    je sub_100BFC55
    mov mov ebx, dword ptr [ecx + 4]
    mov mov eax, dword ptr [eax + ebx*4]
    test test dword ptr [eax + 4], edx
    je sub_100BFC64
    fld fld qword ptr [g_1019BC88]
    fld fld qword ptr [edi + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100BFC7A
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100BFC90
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edx + 84]
    or or ebx, -1
    cmp cmp ecx, dword ptr [edx + 88]
    mov mov dword ptr [ebp - 44], ebx
    mov mov dword ptr [ebp - 24], edx
    mov mov dword ptr [ebp - 12], ecx
    ja sub_100BFCB1
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 12], 0
    mov mov dword ptr [ebp - 36], eax
    je sub_100BFBEC
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [eax + 4], 0
    jbe sub_100BFBFA
    mov mov edi, dword ptr [ebp - 8]
    mov mov edx, dword ptr [eax + 8]
    mov mov edx, dword ptr [edx + edi*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edi + 8]
    or or dword ptr [ebp - 28], -1
    cmp cmp edx, -1
    je sub_100BFBAD
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 72]
    cmp cmp ecx, -1
    je sub_100BFC0F
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ecx]
    mov mov ebx, eax
    and and ebx, 0FFF00000h
    cmp cmp ebx, 010000000h
    jne sub_100BFBD1
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 48], eax
    and and dword ptr [ebp - 48], 0FFFFFh
    jbe sub_100BFBE4
    mov mov ebx, dword ptr [ecx + 16]
    cmp cmp dword ptr [ebx], edx
    je sub_100BFBDA
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 48]
    add add ebx, 4
    cmp cmp dword ptr [ebp - 4], eax
    jb sub_100BFBD4
    jmp sub_100BFBFB
    mov mov eax, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 28], eax
    jmp sub_100BFC09
    mov mov dword ptr [ebp - 28], edx
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp dword ptr [ebp - 28], eax
    mov mov ebx, dword ptr [ebp - 44]
    jne sub_100BFC67
    cmp cmp ebx, -1
    jne sub_100BFC58
    push push 4
    push push ebx
    push push 21
    push push 01011A0C0h
    mov mov ecx, esi
    call sub_10086471
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push eax
    mov mov ecx, esi
    call sub_100864DD
    mov mov ebx, eax
    mov mov dword ptr [ebp - 44], ebx
    mov mov dword ptr [edi + 8], ebx
    mov mov dword ptr [edi + 8], ebx
    mov mov edi, dword ptr [edi + 56]
    cmp cmp edi, -1
    je sub_100BFCA3
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [eax + 8], ebx
    mov mov eax, dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [eax + 4]
    jb sub_100BFBF4
    mov mov edx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 12]
    inc inc ecx
    cmp cmp ecx, dword ptr [edx + 88]
    mov mov dword ptr [ebp - 12], ecx
    jbe sub_100BFBE6
    cmp cmp ebx, -1
    je sub_100BFDCA
    push push 116
    call sub_10085C09
    test test eax, eax
    je sub_100BFD29
    mov mov ecx, eax
    call sub_10085779
    mov mov edi, eax
    jmp sub_100BFD36
    xor xor edi, edi
    test test edi, edi
    je L13
    push push 0
    push push 1
    push push 3
    push push 074100001h
    mov mov ecx, edi
    call sub_10085C7F
    mov mov ebx, eax
    test test ebx, ebx
    mov mov ecx, edi
    jl sub_100BFE23
    push push dword ptr [ebp - 20]
    call sub_100857E4
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100BFE40
    mov mov eax, dword ptr [ebp - 20]
    fldz fldz
    mov mov ecx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [edi + 16]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [esi + 20]
L8:
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + eax*4]
L9:
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 2
    push push dword ptr [ebx + 12]
    mov mov ecx, esi
    push push dword ptr [ebx + 4]
    call sub_100865AF
    fld1 fld1
    mov mov ecx, dword ptr [edi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
L12:
    mov mov dword ptr [ecx + 4], eax
L13:
    push push 2
    push push dword ptr [ebx + 12]
    mov mov ecx, esi
    push push dword ptr [ebx + 4]
    call sub_100865CB
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + 8], eax
    mov mov ecx, dword ptr [ebp - 20]
    push push edi
    call sub_10085F5F
    push push 1
    mov mov ecx, edi
    mov mov ebx, eax
L15:
    call sub_1006C8C4
    test test ebx, ebx
    jl sub_100BFEAE
    mov mov eax, dword ptr [ebp - 52]
    add add dword ptr [ebp - 40], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 56]
    mov mov dword ptr [ebp - 52], eax
    jb sub_100BFABE
    xor xor eax, eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
    push push 1
    call sub_1006C8EA
    mov mov eax, ebx
    jmp sub_100BFEC8
    mov mov ecx, edi
    jmp sub_100BFED1
FUN_100bf52c ENDP
END
