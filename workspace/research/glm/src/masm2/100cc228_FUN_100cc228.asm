.686
.MODEL FLAT, C
EXTRN sub_10085950:PROC
EXTRN sub_1008A9B6:PROC
EXTRN sub_100CBAD3:PROC
EXTRN sub_100CBB22:PROC
EXTRN sub_100CBC09:PROC
EXTRN sub_100CBCA4:PROC
EXTRN sub_100CBE5C:PROC
EXTRN sub_100CBE76:PROC
EXTRN sub_100CC699:PROC
EXTRN sub_100CC6A2:PROC
EXTRN sub_100CC6D0:PROC
EXTRN sub_100CC732:PROC
EXTRN sub_100CC74A:PROC
EXTRN sub_100CC759:PROC
EXTRN sub_100CC792:PROC
EXTRN sub_100CC7A6:PROC
EXTRN sub_100CC7BA:PROC
EXTRN sub_100CC7D1:PROC
EXTRN sub_100CC8A8:PROC
EXTRN sub_100CC8BF:PROC
EXTRN sub_100CC8CB:PROC
EXTRN sub_100CC8DB:PROC
EXTRN sub_100CC8F3:PROC
EXTRN sub_100CC90B:PROC
EXTRN sub_100CC923:PROC
EXTRN sub_100CC97B:PROC
EXTRN sub_100CC980:PROC
EXTRN sub_100CC986:PROC
EXTRN sub_100CC990:PROC
EXTRN sub_100CC994:PROC
EXTRN sub_100CC9A8:PROC
EXTRN sub_100CC9B2:PROC
EXTRN sub_100CC9C9:PROC
EXTRN sub_100CC9D0:PROC
EXTRN sub_100CC9ED:PROC
EXTRN sub_100CCA46:PROC
EXTRN sub_100F78B3:PROC
EXTRN sub_100F78CB:PROC
EXTRN sub_100F7988:PROC
EXTRN sub_100F79A0:PROC
EXTRN sub_100F79E8:PROC
EXTRN sub_100F79FC:PROC
EXTRN sub_100F7A10:PROC
EXTRN sub_100F7A27:PROC
EXTRN sub_100F7B31:PROC
EXTRN sub_100F7B49:PROC
EXTRN sub_100F7B61:PROC
EXTRN sub_100F7B79:PROC
EXTRN sub_100F7BDA:PROC
EXTRN sub_100F7BEE:PROC
EXTRN sub_100F7C02:PROC
EXTRN sub_100F7C52:PROC
EXTRN sub_100F7C5A:PROC
EXTRN sub_100F7C62:PROC
EXTRN sub_100F7C6A:PROC
EXTRN sub_100F7C72:PROC
EXTRN sub_100F7C7A:PROC
EXTRN sub_100F7C82:PROC
EXTRN sub_100F7C8A:PROC
EXTRN sub_100F7C92:PROC
EXTRN sub_100F7C9A:PROC
EXTRN sub_100F7CA2:PROC
EXTRN sub_100F7CAA:PROC
EXTRN sub_100F7CB2:PROC
EXTRN sub_100F7CBA:PROC
EXTRN sub_100F7CC2:PROC
.CODE
FUN_100cc228 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    xor xor ebx, ebx
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [esi + 16], ebx
    mov mov dword ptr [esi + 28], ebx
    mov mov dword ptr [esi + 32], ebx
    mov mov dword ptr [esi + 36], ebx
    mov mov dword ptr [esi + 40], ebx
    mov mov dword ptr [esi + 44], ebx
    mov mov dword ptr [esi + 48], ebx
    mov mov dword ptr [esi + 52], ebx
    mov mov dword ptr [esi + 60], ebx
    mov mov eax, dword ptr [ecx + 12]
    push push edi
    mov mov dword ptr [esi + 56], eax
    call sub_1008A9B6
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F78B3
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 8], eax
    je L7
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F78CB
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 28], eax
    je L8
    mov mov ecx, dword ptr [esi + 56]
    mov mov edi, dword ptr [esi + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 56]
    mov mov edi, dword ptr [esi + 28]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [esi + 56], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe L1
    mov mov eax, dword ptr [esi + 4]
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    test test word ptr [edi + 2], 0FFF0h
    je L2
    cmp cmp dword ptr [edi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe L0
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp - 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call sub_100CBB22
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb L0
    cmp cmp dword ptr [edi + 4], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe L3
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call sub_100CBAD3
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 4]
    jb L3
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 56]
    jb L1
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7988
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 12], eax
    je sub_100CC732
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F79A0
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 32], eax
    je sub_100CC74A
    xor xor ecx, ecx
    xor xor edi, edi
    xor xor edx, edx
    cmp cmp dword ptr [esi + 56], ebx
    jbe L5
    mov mov ebx, dword ptr [esi + 12]
    mov mov eax, edx
    shl shl eax, 2
    mov mov dword ptr [eax + ebx], ecx
    mov mov ebx, dword ptr [esi + 8]
    add add ecx, dword ptr [eax + ebx]
    mov mov ebx, dword ptr [esi + 32]
    mov mov dword ptr [eax + ebx], edi
    mov mov ebx, dword ptr [esi + 28]
    add add edi, dword ptr [eax + ebx]
    inc inc edx
    cmp cmp edx, dword ptr [esi + 56]
    jb L4
    xor xor ebx, ebx
    shl shl ecx, 2
    push push ecx
    mov mov dword ptr [ebp - 8], ecx
    call sub_100F79E8
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 16], eax
    je sub_100CC792
    push push dword ptr [ebp - 8]
    call sub_100F79FC
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 20], eax
    je sub_100CC7A6
    push push dword ptr [ebp - 8]
    call sub_100F7A10
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 24], eax
    je sub_100CC7BA
    mov mov eax, edi
    shl shl eax, 2
    push push eax
    call sub_100F7A27
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 36], eax
    je sub_100CC7D1
    mov mov ecx, dword ptr [esi + 56]
    mov mov edi, dword ptr [esi + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 56]
    mov mov edi, dword ptr [esi + 28]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
L3:
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [esi + 56], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_100CC699
    mov mov eax, dword ptr [esi + 4]
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    test test word ptr [edi + 2], 0FFF0h
    je sub_100CC6A2
    cmp cmp dword ptr [edi + 4], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe L9
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call sub_100CBC09
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 4]
    jb L9
    cmp cmp dword ptr [edi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_100CC6D0
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp - 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call sub_100CBCA4
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_100CC6D0
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 56]
    jb sub_100CC699
    cmp cmp dword ptr [esi + 56], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_100CC759
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [esi + 16]
    shl shl edi, 2
    add add eax, edi
    push push eax
    mov mov eax, dword ptr [esi + 12]
    mov mov eax, dword ptr [edi + eax]
    lea lea eax, [ecx + eax*4]
    push push eax
    mov mov ecx, esi
    call sub_100CBE5C
    mov mov eax, dword ptr [esi + 28]
    mov mov ecx, dword ptr [esi + 36]
    add add eax, edi
    push push eax
    mov mov eax, dword ptr [esi + 32]
    mov mov eax, dword ptr [edi + eax]
    lea lea eax, [ecx + eax*4]
    push push eax
    mov mov ecx, esi
    call sub_100CBE76
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 56]
    jb sub_100CC759
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7B31
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 60], eax
    je sub_100CC8DB
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7B49
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 64], eax
    je sub_100CC8F3
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7B61
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 68], eax
    je sub_100CC90B
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7B79
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esi + 52], eax
    je sub_100CC923
    cmp cmp dword ptr [esi + 56], 0
    jbe sub_100CC8A8
    mov mov eax, dword ptr [esi + 4]
    mov mov eax, dword ptr [eax + 24]
    mov mov edi, ebx
    shl shl edi, 2
    mov mov ecx, dword ptr [edi + eax]
    mov mov eax, dword ptr [esi + 60]
    mov mov dword ptr [edi + eax], ebx
    mov mov eax, dword ptr [esi + 68]
    mov mov dword ptr [edi + eax], ecx
    or or dword ptr [ecx + 36], -1
    test test word ptr [ecx + 2], 0FFF0h
    je sub_100CC8BF
    call sub_10085950
    test test eax, eax
    je sub_100CC8CB
    xor xor eax, eax
    inc inc eax
    mov mov ecx, dword ptr [esi + 52]
    inc inc ebx
    mov mov dword ptr [edi + ecx], eax
    cmp cmp ebx, dword ptr [esi + 56]
    jb sub_100CC8A8
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    xor xor edi, edi
    push push eax
    mov mov dword ptr [esi + 72], edi
    call sub_100F7BDA
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [esi + 40], eax
    je sub_100CC980
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7BEE
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [esi + 44], eax
    je sub_100CC994
    mov mov eax, dword ptr [esi + 56]
    shl shl eax, 2
    push push eax
    call sub_100F7C02
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [esi + 48], eax
    je sub_100CC9A8
    cmp cmp dword ptr [ebp + 8], edi
    je sub_100CC9B2
    jmp sub_100CC97B
    cmp cmp eax, 1
    je sub_100CC990
    mov mov ecx, esi
    call L6
    cmp cmp eax, edi
    jge sub_100CC986
    jmp sub_100CCA46
    xor xor eax, eax
    cmp cmp dword ptr [esi + 56], edi
    jbe sub_100CC9D0
    mov mov ecx, dword ptr [esi + 60]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [esi + 68]
    mov mov ebx, dword ptr [esi + 4]
    mov mov ebx, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ebx + eax*4], ecx
    inc inc eax
    cmp cmp eax, dword ptr [esi + 56]
    jb sub_100CC9C9
    jmp sub_100CC9ED
    mov mov edi, 08007000Eh
    push push dword ptr [esi + 8]
    call sub_100F7C52
    push push dword ptr [esi + 12]
    call sub_100F7C5A
    push push dword ptr [esi + 16]
    call sub_100F7C62
    push push dword ptr [esi + 20]
    call sub_100F7C6A
    push push dword ptr [esi + 24]
    call sub_100F7C72
    push push dword ptr [esi + 28]
    call sub_100F7C7A
    push push dword ptr [esi + 32]
    call sub_100F7C82
    push push dword ptr [esi + 36]
    call sub_100F7C8A
    push push dword ptr [esi + 40]
    call sub_100F7C92
    push push dword ptr [esi + 44]
    call sub_100F7C9A
L7:
    push push dword ptr [esi + 48]
    call sub_100F7CA2
    push push dword ptr [esi + 52]
    call sub_100F7CAA
    push push dword ptr [esi + 60]
    call sub_100F7CB2
L8:
    push push dword ptr [esi + 64]
    call sub_100F7CBA
    push push dword ptr [esi + 68]
    call sub_100F7CC2
    add add esp, 60
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_100cc228 ENDP
END
