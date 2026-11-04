.686
.MODEL FLAT, C
EXTRN sub_10067EBB:PROC
EXTRN sub_10067EE3:PROC
EXTRN sub_1006C3C6:PROC
EXTRN sub_1006E2B9:PROC
EXTRN sub_1007D667:PROC
EXTRN sub_10081FEA:PROC
EXTRN sub_100820E1:PROC
EXTRN sub_100821CC:PROC
EXTRN sub_10084F2B:PROC
EXTRN sub_10084FB5:PROC
EXTRN sub_10084FD3:PROC
EXTRN sub_10084FF8:PROC
EXTRN sub_10085025:PROC
EXTRN sub_10085029:PROC
EXTRN sub_1008502B:PROC
EXTRN sub_10085031:PROC
EXTRN sub_10085037:PROC
EXTRN sub_1008503F:PROC
EXTRN sub_10085059:PROC
EXTRN sub_10085065:PROC
EXTRN sub_1008508A:PROC
EXTRN sub_100850B4:PROC
EXTRN sub_100850CA:PROC
EXTRN sub_100850E8:PROC
EXTRN sub_100850F0:PROC
EXTRN sub_100850FA:PROC
EXTRN sub_10085106:PROC
EXTRN sub_10085109:PROC
EXTRN sub_1008511C:PROC
EXTRN sub_1008512D:PROC
EXTRN sub_10085136:PROC
EXTRN sub_1008513F:PROC
EXTRN sub_1008514F:PROC
EXTRN sub_100851B5:PROC
EXTRN sub_100852F0:PROC
EXTRN sub_100852F6:PROC
EXTRN sub_10085321:PROC
EXTRN sub_100993B2:PROC
EXTRN sub_1009AFF8:PROC
EXTRN sub_100A4877:PROC
EXTRN sub_100F799F:PROC
EXTRN sub_100F79C1:PROC
EXTRN sub_100F7D5F:PROC
.CODE
FUN_10084946 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0148h
    push push ebx
    push push esi
    push push edi
    lea lea ecx, [ebp - 090h]
    call sub_100993B2
    xor xor edi, edi
    lea lea ecx, [ebp - 0148h]
    mov mov dword ptr [ebp - 24], edi
    call sub_1006C3C6
    lea lea eax, [ebp - 24]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea ecx, [ebp - 090h]
    push push dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 44], edi
    mov mov dword ptr [ebp - 16], edi
    call sub_100A4877
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 8], eax
    jl L26
    mov mov eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [eax + 28]
    cmp cmp edx, edi
    mov mov dword ptr [ebp - 20], 2
    mov mov dword ptr [ebp - 28], edx
    je L12
    jmp L0
    mov mov edx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [edx + 8]
    cmp cmp eax, edi
    je L9
    cmp cmp dword ptr [eax + 4], 6
    jne L13
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [eax + 16], ebx
    jne L14
    mov mov edi, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [eax + 32]
    cmp cmp dword ptr [ecx + 16], 3
    mov mov dword ptr [ebp - 36], edi
    jne L15
    mov mov esi, dword ptr [ecx + 20]
    cmp cmp esi, 28
    je L1
    cmp cmp esi, 27
    jne L16
    cmp cmp dword ptr [ecx + 24], ebx
    jne L17
    cmp cmp dword ptr [ecx + 28], ebx
    jne L18
    mov mov eax, dword ptr [eax + 40]
    test test eax, eax
    je L19
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 14
    je L4
L0:
    cmp cmp eax, 13
    jne L3
    mov mov esi, dword ptr [esi + 32]
    jmp L5
    cmp cmp eax, ebx
    jne L6
    mov mov esi, dword ptr [esi + 8]
    test test esi, esi
    jne L2
    mov mov eax, dword ptr [esi + 16]
    cmp cmp eax, 4
    jne L10
    mov mov edi, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + 32]
    mov mov ebx, dword ptr [eax + 24]
    mov mov eax, dword ptr [edi + 36]
    mov mov ecx, dword ptr [eax + 32]
    mov mov eax, dword ptr [eax + 36]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 44]
    cmp cmp dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 40], edi
    mov mov dword ptr [ebp - 32], ecx
    jne L7
    lea lea eax, [eax + eax + 2]
    mov mov dword ptr [ebp - 44], eax
    shl shl eax, 2
    push push eax
    call sub_100F799F
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    je L20
    cmp cmp dword ptr [ebp - 12], 0
    jbe L8
    mov mov ecx, dword ptr [ebp - 12]
    mov mov esi, dword ptr [ebp - 16]
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [ebp - 40]
    push push dword ptr [ebp - 16]
    call sub_100F79C1
    mov mov eax, dword ptr [ebp - 8]
    pop pop ecx
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 12]
    push push 0
L1:
    lea lea esi, [eax + ecx*4]
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    or or eax, 0102h
    push push eax
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push 1
    push push dword ptr [ebp - 48]
    lea lea ecx, [ebp - 0148h]
    push push dword ptr [ebp - 32]
    push push dword ptr [ebp - 24]
    push push ebx
    call sub_1007D667
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jl L23
    mov mov esi, dword ptr [esi]
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 4], esi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax + 4]
    jmp L21
    cmp cmp eax, 5
    jne L24
    lea lea eax, [ebp - 4]
    push push eax
    push push dword ptr [esi + 28]
    call sub_10081FEA
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jl sub_10084FD3
    mov mov eax, dword ptr [ebp - 4]
L3:
    mov mov ebx, dword ptr [esi + 28]
    mov mov ecx, dword ptr [eax]
    mov mov esi, dword ptr [esi + 24]
    push push eax
    call call dword ptr [ecx + 12]
L5:
    mov mov edi, eax
    mov mov ecx, ebx
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + 24]
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne L22
    sub sub eax, ecx
    mov mov esi, eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 16]
    add add esi, 4
    add add eax, 3
    shr shr esi, 2
    add add esi, dword ptr [ebp - 20]
    shr shr eax, 2
    lea lea eax, [esi + eax + 4]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [ebp - 4], 0
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [edx + 12]
    xor xor edi, edi
    cmp cmp edx, edi
    mov mov dword ptr [ebp - 28], edx
    jne L11
    cmp cmp dword ptr [ebp - 20], 2
    jne L25
    mov mov dword ptr [ebp - 8], 080004005h
    jmp sub_10085059
    mov mov dword ptr [ebp - 8], 08007000Eh
    jmp sub_10085065
    mov mov eax, dword ptr [ebp - 36]
    push push dword ptr [eax + 24]
    add add edi, 48
    push push 0101103B0h
    push push 0B57h
    push push edi
    add add ebx, 24
    push push ebx
    call sub_10067EBB
    add add esp, 20
    jmp sub_1008508A
    push push dword ptr [edi + 24]
L7:
    mov mov eax, dword ptr [ebp - 40]
    push push 010110384h
    add add eax, 48
    push push 0B58h
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    add add eax, 24
    push push eax
    call sub_10067EE3
    add add esp, 20
    jmp L25
    mov mov esi, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp - 20]
L10:
    push push esi
L11:
    shl shl eax, 2
    push push eax
L12:
    call sub_100820E1
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 8], eax
    jl sub_100850CA
L14:
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    mov mov ebx, eax
    mov mov dword ptr [ebx], 07FFE0000h
    mov mov eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [eax + 28]
L15:
    add add ebx, 4
    test test edx, edx
    mov mov dword ptr [ebp + 8], edx
    je sub_100850E8
    mov mov eax, dword ptr [ebp - 16]
L16:
    mov mov dword ptr [ebp + 12], eax
    jmp sub_10084F2B
    mov mov edx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_100850F0
    cmp cmp dword ptr [eax + 4], 6
    jne sub_100850FA
L19:
    xor xor edi, edi
    inc inc edi
    cmp cmp dword ptr [eax + 16], edi
    jne sub_10085106
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [ebp + 16], ecx
    mov mov ecx, dword ptr [eax + 32]
    cmp cmp dword ptr [ecx + 16], 3
    jne sub_1008511C
    mov mov esi, dword ptr [ecx + 20]
    cmp cmp esi, 28
    je sub_10084FB5
    cmp cmp esi, 27
    jne sub_1008512D
    cmp cmp dword ptr [ecx + 24], edi
    jne sub_10085136
    cmp cmp dword ptr [ecx + 28], edi
    jne sub_1008513F
    cmp cmp dword ptr [eax + 36], 0
    jne sub_10084FF8
    cmp cmp dword ptr [eax + 40], 0
    je sub_1008514F
    mov mov esi, dword ptr [eax + 40]
    jmp sub_10085025
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 14
    je sub_10085031
    cmp cmp eax, 13
    jne sub_1008502B
    mov mov esi, dword ptr [esi + 32]
    jmp sub_10085037
    cmp cmp eax, edi
    jne sub_1008503F
    mov mov esi, dword ptr [esi + 8]
    test test esi, esi
    jne sub_10085029
    cmp cmp dword ptr [esi + 16], 4
    jne sub_10085065
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ebp - 4], ecx
    and and dword ptr [eax], 0
    add add eax, 4
    mov mov dword ptr [ebp + 12], eax
    jmp sub_100850B4
    lea lea eax, [ebp - 4]
    push push eax
L21:
    push push dword ptr [esi + 28]
    call sub_100821CC
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jl sub_100851B5
    mov mov eax, dword ptr [esi + 28]
    mov mov esi, dword ptr [esi + 24]
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    mov mov edi, eax
    mov mov eax, dword ptr [ebp - 32]
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + 24]
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10085109
    sub sub eax, esi
    lea lea esi, [eax + 1]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    lea lea edi, [esi + 3]
    call call dword ptr [ecx + 16]
    add add eax, 3
    shl shl eax, 14
    mov mov ecx, eax
L23:
    mov mov edx, edi
    shl shl edx, 14
    mov mov eax, 0FFFF0000h
    and and ecx, eax
    and and edx, eax
    lea lea eax, [ecx + edx + 030000h]
    and and eax, 07FFF0000h
    or or eax, 0FFFEh
    mov mov dword ptr [ebx], eax
    push push 4
    pop pop ecx
    add add ebx, ecx
    mov mov dword ptr [ebx], 047415246h
    add add ebx, ecx
    mov mov dword ptr [ebx], 8
    add add ebx, ecx
    mov mov eax, edi
    shr shr eax, 2
    lea lea edx, [eax*4 + 8]
    mov mov dword ptr [ebx], edx
    mov mov edx, dword ptr [ebp + 16]
    add add ebx, ecx
    mov mov ecx, esi
    mov mov esi, dword ptr [edx + 24]
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov edi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    lea lea ebx, [ebx + eax*4]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 16]
    mov mov dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    mov mov esi, eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, eax
    shr shr ecx, 2
    mov mov edi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 16]
    add add eax, 3
    shr shr eax, 2
    lea lea ebx, [ebx + eax*4]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [ebp - 4], 0
    mov mov edx, dword ptr [ebp + 8]
    mov mov edx, dword ptr [edx + 12]
    test test edx, edx
    mov mov dword ptr [ebp + 8], edx
    jne sub_100850F0
    mov mov dword ptr [ebx], 0FFFFh
    xor xor ebx, ebx
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 12], ebx
    jbe sub_100852F0
    mov mov eax, dword ptr [ebp - 16]
    lea lea esi, [eax + edi*4]
    mov mov eax, dword ptr [esi]
    cmp cmp eax, ebx
    je sub_100852F6
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov dword ptr [esi], ebx
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 12]
    jb sub_100852F0
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, ebx
    je sub_10085321
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov dword ptr [ebp - 4], ebx
L25:
    push push dword ptr [ebp - 16]
    call sub_100F7D5F
    pop pop ecx
    lea lea ecx, [ebp - 0148h]
    call sub_1006E2B9
    lea lea ecx, [ebp - 090h]
    call sub_1009AFF8
    mov mov eax, dword ptr [ebp - 8]
L26:
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_10084946 ENDP
END
