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
EXTRN sub_100CC56E:PROC
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
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    xor ebx, ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 12], ebx
    mov dword ptr [esi + 16], ebx
    mov dword ptr [esi + 28], ebx
    mov dword ptr [esi + 32], ebx
    mov dword ptr [esi + 36], ebx
    mov dword ptr [esi + 40], ebx
    mov dword ptr [esi + 44], ebx
    mov dword ptr [esi + 48], ebx
    mov dword ptr [esi + 52], ebx
    mov dword ptr [esi + 60], ebx
    mov eax, dword ptr [ecx + 12]
    push edi
    mov dword ptr [esi + 56], eax
    call sub_1008A9B6
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F78B3
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 8], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F78CB
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 28], eax
    je L24
    mov ecx, dword ptr [esi + 56]
    mov edi, dword ptr [esi + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 56]
    mov edi, dword ptr [esi + 28]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [esi + 56], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L5
L0:
    mov eax, dword ptr [esi + 4]
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    test word ptr [edi + 2], 00000FFF0h
    je L4
    cmp dword ptr [edi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L2
L1:
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp - 8]
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call sub_100CBB22
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L1
L2:
    cmp dword ptr [edi + 4], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L4
L3:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 8]
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call sub_100CBAD3
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 4]
    jb L3
L4:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 56]
    jb L0
L5:
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7988
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 12], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F79A0
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 32], eax
    je L24
    xor ecx, ecx
    xor edi, edi
    xor edx, edx
    cmp dword ptr [esi + 56], ebx
    jbe L7
L6:
    mov ebx, dword ptr [esi + 12]
    mov eax, edx
    shl eax, 2
    mov dword ptr [eax + ebx], ecx
    mov ebx, dword ptr [esi + 8]
    add ecx, dword ptr [eax + ebx]
    mov ebx, dword ptr [esi + 32]
    mov dword ptr [eax + ebx], edi
    mov ebx, dword ptr [esi + 28]
    add edi, dword ptr [eax + ebx]
    inc edx
    cmp edx, dword ptr [esi + 56]
    jb L6
    xor ebx, ebx
L7:
    shl ecx, 2
    push ecx
    mov dword ptr [ebp - 8], ecx
    call sub_100F79E8
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 16], eax
    je L24
    push dword ptr [ebp - 8]
    call sub_100F79FC
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 20], eax
    je L24
    push dword ptr [ebp - 8]
    call sub_100F7A10
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 24], eax
    je L24
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100F7A27
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 36], eax
    je L24
    mov ecx, dword ptr [esi + 56]
    mov edi, dword ptr [esi + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 56]
    mov edi, dword ptr [esi + 28]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [esi + 56], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L13
L8:
    mov eax, dword ptr [esi + 4]
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    test word ptr [edi + 2], 00000FFF0h
    je L12
    cmp dword ptr [edi + 4], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L10
L9:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 8]
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call sub_100CBC09
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 4]
    jb L9
L10:
    cmp dword ptr [edi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L12
L11:
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp - 8]
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call sub_100CBCA4
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L11
L12:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 56]
    jb L8
L13:
    cmp dword ptr [esi + 56], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L15
L14:
    mov edi, dword ptr [ebp - 8]
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [esi + 16]
    shl edi, 2
    add eax, edi
    push eax
    mov eax, dword ptr [esi + 12]
    mov eax, dword ptr [edi + eax]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, esi
    call sub_100CBE5C
    mov eax, dword ptr [esi + 28]
    mov ecx, dword ptr [esi + 36]
    add eax, edi
    push eax
    mov eax, dword ptr [esi + 32]
    mov eax, dword ptr [edi + eax]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, esi
    call sub_100CBE76
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 56]
    jb L14
L15:
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7B31
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 60], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7B49
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 64], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7B61
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 68], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7B79
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 52], eax
    je L24
    cmp dword ptr [esi + 56], 0
    jbe L19
L16:
    mov eax, dword ptr [esi + 4]
    mov eax, dword ptr [eax + 24]
    mov edi, ebx
    shl edi, 2
    mov ecx, dword ptr [edi + eax]
    mov eax, dword ptr [esi + 60]
    mov dword ptr [edi + eax], ebx
    mov eax, dword ptr [esi + 68]
    mov dword ptr [edi + eax], ecx
    or dword ptr [ecx + 36], 0FFFFFFFFh
    test word ptr [ecx + 2], 00000FFF0h
    je L17
    call sub_10085950
    test eax, eax
    je L18
L17:
    xor eax, eax
    inc eax
L18:
    mov ecx, dword ptr [esi + 52]
    inc ebx
    mov dword ptr [edi + ecx], eax
    cmp ebx, dword ptr [esi + 56]
    jb L16
L19:
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    xor edi, edi
    push eax
    mov dword ptr [esi + 72], edi
    call sub_100F7BDA
    cmp eax, edi
    pop ecx
    mov dword ptr [esi + 40], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7BEE
    cmp eax, edi
    pop ecx
    mov dword ptr [esi + 44], eax
    je L24
    mov eax, dword ptr [esi + 56]
    shl eax, 2
    push eax
    call sub_100F7C02
    cmp eax, edi
    pop ecx
    mov dword ptr [esi + 48], eax
    je L24
    cmp dword ptr [ebp + 8], edi
    je L25
    jmp L21
L20:
    cmp eax, 1
    je L22
L21:
    mov ecx, esi
    call sub_100CC56E
    cmp eax, edi
    jge L20
    jmp L26
L22:
    xor eax, eax
    cmp dword ptr [esi + 56], edi
    jbe L25
L23:
    mov ecx, dword ptr [esi + 60]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [esi + 68]
    mov ebx, dword ptr [esi + 4]
    mov ebx, dword ptr [ebx + 24]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ebx + eax*4], ecx
    inc eax
    cmp eax, dword ptr [esi + 56]
    jb L23
    jmp L25
L24:
    mov edi, 08007000Eh
L25:
    push dword ptr [esi + 8]
    call sub_100F7C52
    push dword ptr [esi + 12]
    call sub_100F7C5A
    push dword ptr [esi + 16]
    call sub_100F7C62
    push dword ptr [esi + 20]
    call sub_100F7C6A
    push dword ptr [esi + 24]
    call sub_100F7C72
    push dword ptr [esi + 28]
    call sub_100F7C7A
    push dword ptr [esi + 32]
    call sub_100F7C82
    push dword ptr [esi + 36]
    call sub_100F7C8A
    push dword ptr [esi + 40]
    call sub_100F7C92
    push dword ptr [esi + 44]
    call sub_100F7C9A
    push dword ptr [esi + 48]
    call sub_100F7CA2
    push dword ptr [esi + 52]
    call sub_100F7CAA
    push dword ptr [esi + 60]
    call sub_100F7CB2
    push dword ptr [esi + 64]
    call sub_100F7CBA
    push dword ptr [esi + 68]
    call sub_100F7CC2
    add esp, 60
    mov eax, edi
L26:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100cc228 ENDP
END
