.686
.MODEL FLAT, C
EXTRN sub_1006C675:PROC
EXTRN sub_1006C688:PROC
EXTRN sub_1006C696:PROC
EXTRN sub_10085476:PROC
EXTRN sub_10085635:PROC
EXTRN sub_100857E4:PROC
EXTRN sub_1008586C:PROC
EXTRN sub_10085906:PROC
EXTRN sub_10085985:PROC
EXTRN sub_10085AC5:PROC
EXTRN sub_10085B46:PROC
EXTRN sub_10085C74:PROC
EXTRN sub_10085D0C:PROC
EXTRN sub_1008620B:PROC
EXTRN sub_10086289:PROC
EXTRN sub_100862E9:PROC
EXTRN sub_100863A8:PROC
EXTRN sub_1008648C:PROC
EXTRN sub_1008655E:PROC
EXTRN sub_10086631:PROC
EXTRN sub_10086642:PROC
EXTRN sub_100867D2:PROC
EXTRN sub_10087407:PROC
EXTRN sub_100A6EA3:PROC
EXTRN sub_100A704E:PROC
EXTRN sub_100A721D:PROC
EXTRN sub_100AA0AB:PROC
EXTRN sub_100AB7FB:PROC
EXTRN sub_100AB808:PROC
EXTRN sub_100AB830:PROC
EXTRN sub_100AB833:PROC
EXTRN sub_100AB858:PROC
EXTRN sub_100AB898:PROC
EXTRN sub_100AB8AE:PROC
EXTRN sub_100AB8BD:PROC
EXTRN sub_100AB8F2:PROC
EXTRN sub_100AB914:PROC
EXTRN sub_100AB91C:PROC
EXTRN sub_100AB967:PROC
EXTRN sub_100AB972:PROC
EXTRN sub_100AB975:PROC
EXTRN sub_100AB98A:PROC
EXTRN sub_100AB9C0:PROC
EXTRN sub_100AB9EF:PROC
EXTRN sub_100AB9F2:PROC
EXTRN sub_100ABA03:PROC
EXTRN sub_100ABA8A:PROC
EXTRN sub_100ABAA2:PROC
EXTRN sub_100ABABA:PROC
EXTRN sub_100ABB25:PROC
EXTRN sub_100ABB6B:PROC
EXTRN sub_100ABB7B:PROC
EXTRN sub_100ABBB3:PROC
EXTRN sub_100ABBB7:PROC
EXTRN sub_100ABBC2:PROC
EXTRN sub_100ABBD2:PROC
EXTRN sub_100ABC0D:PROC
EXTRN sub_100ABC17:PROC
EXTRN sub_100ABC60:PROC
EXTRN sub_100ABC80:PROC
EXTRN sub_100ABC86:PROC
.CODE
FUN_100ab286 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    push push 6
    xor xor eax, eax
    pop pop ecx
    lea lea edi, [ebp - 48]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jbe L0
    mov mov ecx, dword ptr [esi + 24]
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je L1
    mov mov ecx, dword ptr [eax]
    test test ecx, ecx
    mov mov dword ptr [ebp - 4], ecx
    je L2
    mov mov ecx, dword ptr [eax + 4]
    and and dword ptr [ebp - 16], 0
    test test ecx, ecx
    mov mov dword ptr [ebp - 24], ecx
    jbe L3
    mov mov ebx, dword ptr [eax + 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 080h]
    cmp cmp dword ptr [ecx + 4], eax
    jne L5
    movzx movzx edx, byte ptr [ecx + 109]
    cmp cmp edx, 5
    ja L9
    cmp cmp byte ptr [ecx + 108], 3
    jne L7
    mov mov edi, dword ptr [ebp - 4]
    and and edi, 0FFF00000h
    push push edi
    call sub_100A6EA3
    test test eax, eax
    jne L6
    cmp cmp edi, 011000000h
    je L8
    mov mov ecx, dword ptr [ecx + 16]
    lea lea eax, [ebp + edx*4 - 48]
    inc inc ecx
    cmp cmp ecx, dword ptr [eax]
    jbe L10
    mov mov dword ptr [eax], ecx
    jmp L11
    lea lea eax, [ebp + edx*4 - 48]
    mov mov edx, dword ptr [ecx + 16]
    inc inc edx
    cmp cmp edx, dword ptr [eax]
    jbe L12
    cmp cmp dword ptr [ecx + 60], 0
    je L13
    mov mov dword ptr [eax], edx
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    add add ebx, 4
    cmp cmp eax, dword ptr [ebp - 24]
    jb L4
    add add dword ptr [ebp - 12], 4
    dec dec dword ptr [ebp - 8]
    jne L1
    and and dword ptr [ebp - 8], 0
    lea lea eax, [ebp - 48]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp dword ptr [eax], 0
    je L17
    push push 116
    call sub_10085906
    test test eax, eax
    je L14
    mov mov ecx, eax
    call sub_10085476
    mov mov edi, eax
    jmp L15
    xor xor edi, edi
L1:
    test test edi, edi
    je L19
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax]
L2:
    push push 0
    push push eax
    push push eax
    and and eax, 0FFFFFh
    or or eax, 072100000h
L3:
    push push eax
    mov mov ecx, edi
L4:
    call sub_10085985
L5:
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100AB830
    mov mov eax, dword ptr [ebp - 4]
    xor xor ebx, ebx
L7:
    cmp cmp dword ptr [eax], ebx
    jbe L16
    push push ecx
    fldz fldz
L8:
    push push ecx
L9:
    fstp fstp qword ptr [esp]
    push push ebx
    push push 0
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_10086289
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx + ebx*4], eax
    mov mov eax, dword ptr [edi + 16]
    cmp cmp dword ptr [eax + ebx*4], -1
    je L21
    mov mov eax, dword ptr [ebp - 4]
    inc inc ebx
    cmp cmp ebx, dword ptr [eax]
    jb L16
    push push dword ptr [edi + 16]
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax]
    mov mov ecx, esi
    push push dword ptr [ebp - 8]
    push push 3
    push push dword ptr [esi + 12]
    push push dword ptr [esi + 24]
    call sub_100AA0AB
    mov mov ebx, eax
    test test ebx, ebx
    jl L22
    mov mov eax, dword ptr [ebp - 4]
    xor xor ebx, ebx
    cmp cmp dword ptr [eax], ebx
    jbe L20
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [esi + 080h]
    call sub_100862E9
    cmp cmp eax, -1
    je L23
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebp - 8]
    and and dword ptr [ecx + 60], 0
    shl shl edx, 8
    or or edx, 3
    mov mov dword ptr [ecx + 108], edx
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + ebx*4], eax
    mov mov eax, dword ptr [ebp - 4]
    inc inc ebx
    cmp cmp ebx, dword ptr [eax]
    jb L20
    push push edi
    mov mov ecx, esi
    call sub_1008620B
    mov mov ebx, eax
    test test ebx, ebx
    mov mov dword ptr [ebp - 16], ebx
    jl sub_100AB8F2
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    cmp cmp dword ptr [ebp - 8], 6
    jb L18
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 20], 0
    jbe sub_100AB833
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi]
    mov mov edx, eax
    mov mov ecx, eax
    and and edx, 0FFF00000h
    and and ecx, 0FFFFFh
    push push edx
    mov mov dword ptr [ebp - 12], ecx
    call sub_100A704E
    test test eax, eax
    jne L24
    cmp cmp edx, 011000000h
    jne sub_100AB858
    cmp cmp edx, 011000000h
    mov mov eax, dword ptr [edi + 8]
    jne L25
    mov mov eax, dword ptr [eax]
    jmp L26
    push push 1
    mov mov ecx, edi
    call sub_1006C675
    mov mov ebx, 08007000Eh
    jmp sub_100AB967
    push push 1
    mov mov ecx, edi
    call sub_1006C688
    jmp sub_100AB975
    push push 1
    mov mov ecx, edi
    call sub_1006C696
    mov mov eax, 08007000Eh
    jmp sub_100AB98A
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 62], 31
    je sub_100AB8AE
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, dword ptr [esi + 088h]
L16:
    jne sub_100AB8BD
    push push 116
    call sub_10085AC5
    test test eax, eax
    je sub_100AB7FB
    mov mov ecx, eax
    call sub_10085635
    mov mov ebx, eax
    jmp sub_100AB808
    xor xor ebx, ebx
    test test ebx, ebx
    je sub_100AB9C0
    mov mov eax, dword ptr [ebp - 12]
    push push 0
    push push dword ptr [ebp - 12]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 12]
    or or eax, 010000000h
    push push eax
    mov mov ecx, ebx
L18:
    call sub_10085B46
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jl sub_100AB9EF
    mov mov eax, dword ptr [edi]
    mov mov ecx, eax
    and and eax, 0FFF00000h
    and and ecx, 0FFFFFh
    cmp cmp eax, 011000000h
    jne sub_100AB898
    xor xor ecx, ecx
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 12], 0
    jbe sub_100AB914
    mov mov eax, ecx
    shl shl eax, 2
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [edi + 8]
    fldz fldz
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 24], ecx
    mov mov ecx, dword ptr [ebx + 8]
    push push ecx
    push push ecx
    mov mov dword ptr [ecx + edx*4], eax
    fstp fstp qword ptr [esp]
    mov mov eax, dword ptr [ebp - 24]
    push push dword ptr [eax + 16]
    mov mov ecx, esi
    push push 0
    push push dword ptr [esi + 088h]
    call sub_1008648C
    mov mov edx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebx + 16]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ebp - 16]
L19:
    mov mov ecx, dword ptr [edi + 8]
    add add dword ptr [ebp - 16], 4
    mov mov dword ptr [edx + ecx], eax
    mov mov eax, dword ptr [ebp - 8]
L20:
    cmp cmp eax, dword ptr [ebp - 12]
    jb sub_100AB91C
    push push ebx
    mov mov ecx, esi
    call sub_100863A8
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jl sub_100ABA8A
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 20]
    jb sub_100AB833
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 20], edi
    jbe sub_100AB9F2
    mov mov eax, dword ptr [esi + 24]
    push push dword ptr [eax + edi*4]
    mov mov ecx, esi
    call sub_10086642
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100ABABA
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edi*4]
    and and dword ptr [eax], 0
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 20]
    jb sub_100AB9F2
    mov mov eax, dword ptr [esi + 12]
    and and dword ptr [ebp - 20], 0
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jbe sub_100ABBB3
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi]
    test test eax, eax
    je sub_100ABBB7
    mov mov ecx, eax
    and and ecx, 0FFF00000h
L22:
    and and eax, 0FFFFFh
    push push ecx
    mov mov dword ptr [ebp - 12], eax
    call sub_100A721D
    test test eax, eax
    jne sub_100ABAA2
    cmp cmp ecx, 011000000h
    jne sub_100ABBD2
    mov mov edx, dword ptr [esi + 16]
    sub sub ecx, 011000000h
    neg neg ecx
    sbb sbb ecx, ecx
    and and ecx, dword ptr [ebp - 12]
    mov mov eax, ecx
    mov mov ecx, dword ptr [edi + 8]
    shl shl eax, 2
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 2
    jne sub_100ABB25
    test test cl, 16
    je sub_100ABC0D
    cmp cmp byte ptr [eax + 108], 1
    jne sub_100ABC17
    push push 116
    call sub_10085C74
    test test eax, eax
    je sub_100ABB6B
    mov mov ecx, eax
    call sub_100857E4
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100ABB7B
    mov mov dword ptr [ebp - 16], 08007000Eh
    mov mov ebx, dword ptr [ebp - 16]
    mov mov eax, ebx
    pop pop edi
    pop pop esi
L24:
    pop pop ebx
    leave leave
    ret ret
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100AB972
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    push push dword ptr [ebp - 12]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 12]
    or or eax, 010000000h
    push push eax
    call sub_10085D0C
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100ABBB3
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    call sub_1008586C
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100ABBC2
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 12], 0
    jbe sub_100ABC80
    mov mov eax, dword ptr [edi + 8]
    mov mov ebx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 4]
    fldz fldz
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + ebx]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edx
    mov mov dword ptr [ecx + edx*4], eax
    push push 0
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_10086631
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ebx + ecx], eax
    mov mov eax, dword ptr [edi + 8]
    cmp cmp dword ptr [eax + ebx], -1
    je sub_100ABA03
    inc inc dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 8]
    add add ebx, 4
    cmp cmp ecx, dword ptr [ebp - 12]
    jb sub_100ABC86
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call sub_1008655E
    push push edi
    mov mov ecx, esi
    call sub_100867D2
    and and dword ptr [edi], 0
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_100ABBB3
    mov mov ecx, esi
    call sub_10087407
    mov mov ebx, eax
    jmp sub_100ABC60
FUN_100ab286 ENDP
END
