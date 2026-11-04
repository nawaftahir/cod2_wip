.686
.MODEL FLAT, C
EXTRN sub_10086AE2:PROC
EXTRN sub_10086ECB:PROC
EXTRN sub_10089A92:PROC
EXTRN sub_1008AB0D:PROC
EXTRN sub_1008AD01:PROC
EXTRN sub_1008AED9:PROC
EXTRN sub_10091420:PROC
EXTRN sub_10091431:PROC
EXTRN sub_10091435:PROC
EXTRN sub_10091477:PROC
EXTRN sub_1009148D:PROC
EXTRN sub_10091495:PROC
EXTRN sub_10091569:PROC
EXTRN sub_1009156A:PROC
EXTRN sub_10091581:PROC
EXTRN sub_10091597:PROC
EXTRN sub_10091609:PROC
EXTRN sub_10091618:PROC
EXTRN sub_1009161D:PROC
EXTRN sub_10091624:PROC
EXTRN sub_10091628:PROC
EXTRN sub_1009163C:PROC
EXTRN sub_10091654:PROC
EXTRN sub_10091667:PROC
EXTRN sub_1009166C:PROC
EXTRN sub_100916B1:PROC
EXTRN sub_100916B9:PROC
EXTRN sub_100916C7:PROC
EXTRN sub_1009170E:PROC
EXTRN sub_100F79D3:PROC
EXTRN sub_100F79EB:PROC
EXTRN sub_100F7AA6:PROC
EXTRN sub_100F7ABE:PROC
EXTRN sub_100F7AD6:PROC
EXTRN sub_100F7B87:PROC
EXTRN sub_100F7B8F:PROC
EXTRN sub_100F7B97:PROC
EXTRN EXTRN fp_10110450:DWORD:DWORD
.CODE
FUN_100910df PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 112
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    mov mov ebx, ecx
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 8], edi
    call sub_10086ECB
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_10091420
    mov mov ecx, ebx
    call sub_1008AD01
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_10091431
    mov mov eax, dword ptr [ebx + 108]
    test test eax, 0C000000h
    je L3
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 12], edi
    jbe L0
    mov mov ecx, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    inc inc eax
    mov mov dword ptr [ecx + 44], edi
    cmp cmp eax, dword ptr [ebx + 12]
    jb L0
    mov mov edi, dword ptr [ebx + 12]
    test test edi, edi
    jbe L6
    mov mov eax, dword ptr [ebx + 24]
    dec dec edi
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [eax]
    mov mov esi, ecx
    and and esi, 0FFF00000h
    mov mov dword ptr [ebp - 24], edi
    je L1
    mov mov edx, dword ptr [eax + 44]
    and and ecx, 0F0000000h
    cmp cmp ecx, 060000000h
    je L4
    cmp cmp esi, 011000000h
    jne L7
    lea lea ecx, [edx + 1]
    inc inc edx
    mov mov dword ptr [eax + 44], ecx
    inc inc edx
    xor xor esi, esi
    cmp cmp dword ptr [eax + 20], esi
    jbe L2
    mov mov ecx, dword ptr [eax + 24]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov edi, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [edi + ecx*4]
    cmp cmp dword ptr [ecx + 44], edx
    jae L9
    mov mov dword ptr [ecx + 44], edx
    inc inc esi
    cmp cmp esi, dword ptr [eax + 20]
    jb L8
    mov mov edi, dword ptr [ebp - 24]
    jmp L5
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 12], edi
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 12], edi
    jbe L10
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    mov mov dword ptr [ebp - 20], ecx
    je L11
    mov mov ecx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 28], esi
    mov mov esi, dword ptr [esi + 4]
    mov mov esi, dword ptr [edi + esi*4]
    test test byte ptr [esi + 4], 8
    jne L13
    cmp cmp dword ptr [ebp - 20], 020700000h
    je L12
    cmp cmp dword ptr [ebp - 20], 020800000h
    je L14
    cmp cmp dword ptr [ebp - 20], 011500000h
    je L15
L5:
    mov mov ecx, dword ptr [ebp - 28]
    jmp L16
    mov mov ecx, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [edx + ecx*4]
L7:
    mov mov ecx, dword ptr [ecx + 20]
    xor xor edi, edi
    cmp cmp ecx, -1
    mov mov dword ptr [eax + 52], ecx
    je L17
    mov mov dword ptr [ebp - 24], 1
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L10
    test test byte ptr [ebx + 0CCh], 4
    je L18
    xor xor eax, eax
    inc inc eax
    jmp sub_1009156A
L8:
    mov mov eax, dword ptr [ebx + 12]
    shl shl eax, 2
    cmp cmp dword ptr [ebp - 24], edi
    push push eax
    je sub_10091477
    call sub_100F79D3
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    je sub_10091569
    mov mov eax, dword ptr [ebx + 12]
    shl shl eax, 2
    push push eax
    call sub_100F79EB
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    je sub_10091581
    mov mov ecx, ebx
    call sub_1008AB0D
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_10091597
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 12], edi
    jbe sub_10091435
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + eax*4], eax
    inc inc eax
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_10091435
    push push ebx
    push push dword ptr [ebx + 12]
    push push dword ptr [ebp - 4]
    push push 01008661Bh
    call sub_10086AE2
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 12], edi
    jbe sub_1009148D
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    sub sub ecx, eax
    mov mov esi, dword ptr [ecx + eax]
    mov mov edi, dword ptr [ebx + 24]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov dword ptr [eax], esi
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [ebx + 12]
    jb sub_10091495
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edi, dword ptr [ebx + 24]
    mov mov esi, dword ptr [ebp - 8]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, ebx
    call sub_1008AED9
    mov mov esi, eax
    test test esi, esi
    jl sub_10091609
    push push 1
    lea lea ecx, [ebp - 112]
    mov mov dword ptr [ebp - 108], ebx
    mov mov dword ptr [ebp - 112], 010110448h
    call dword ptr [fp_10110450]
    mov mov esi, eax
    test test esi, esi
    jl sub_10091628
    jmp sub_10091624
    mov mov dword ptr [ebp - 12], edi
    call sub_100F7AA6
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 16], eax
    je sub_1009163C
    mov mov eax, dword ptr [ebx + 12]
    shl shl eax, 2
    push push eax
    call sub_100F7ABE
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    je sub_10091654
    mov mov eax, dword ptr [ebx + 12]
    shl shl eax, 2
    push push eax
    call sub_100F7AD6
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    je sub_1009166C
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 12], edi
    jbe sub_10091609
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    or or dword ptr [eax + 56], -1
    test test word ptr [eax + 2], 0FFF0h
    mov mov dword ptr [eax + 36], edi
    je sub_10091618
    cmp cmp dword ptr [eax + 28], edi
    jne sub_1009161D
    mov mov edx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [eax + edx*4], ecx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebx + 12]
    jb sub_10091609
    cmp cmp dword ptr [ebp - 12], 0
    mov mov dword ptr [ebp - 28], edi
    jbe sub_10091667
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 16]
    push push dword ptr [eax + edi*4]
    mov mov ecx, ebx
    call sub_10089A92
    mov mov esi, eax
    test test esi, esi
    jl sub_100916C7
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 12]
    jb sub_10091667
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 12], edx
    jbe sub_100916B1
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    sub sub ecx, eax
    mov mov esi, dword ptr [eax + ecx]
    mov mov edi, dword ptr [ebx + 24]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov dword ptr [eax], esi
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [ebx + 12]
    jb sub_100916B9
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edi, dword ptr [ebx + 24]
    mov mov esi, dword ptr [ebp - 8]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor esi, esi
    jmp sub_1009170E
    mov mov esi, 08007000Eh
    push push dword ptr [ebp - 16]
    call sub_100F7B87
    push push dword ptr [ebp - 4]
    call sub_100F7B8F
    push push dword ptr [ebp - 8]
    call sub_100F7B97
    add add esp, 12
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100910df ENDP
END
