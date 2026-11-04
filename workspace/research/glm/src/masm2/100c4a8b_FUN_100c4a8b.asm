.686
.MODEL FLAT, C
EXTRN sub_100862C8:PROC
EXTRN sub_100C4CF4:PROC
EXTRN sub_100C4D26:PROC
EXTRN sub_100C4D6A:PROC
EXTRN sub_100C4E00:PROC
EXTRN sub_100C4E0A:PROC
EXTRN sub_100C4E53:PROC
EXTRN sub_100C4E5A:PROC
EXTRN sub_100C4E94:PROC
EXTRN sub_100C4EE4:PROC
EXTRN sub_100F78C5:PROC
EXTRN sub_100F7A8D:PROC
.CODE
FUN_100c4a8b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    and and dword ptr [ebp - 4], 0
    push push ebx
    push push esi
    xor xor eax, eax
    xor xor edx, edx
    cmp cmp dword ptr [ebp + 24], eax
    push push edi
    mov mov esi, ecx
    jbe L0
    mov mov ecx, dword ptr [esi + 0150h]
    mov mov edi, dword ptr [ebp + 20]
    cmp cmp ecx, dword ptr [edi + eax*4]
    jne L2
    xor xor edx, edx
    inc inc edx
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 24]
    jb L1
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp dword ptr [esi + 014Ch], ebx
    jbe L3
    test test edx, edx
    je L10
    or or eax, -1
    lea lea edi, [esi + 013Ch]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
L1:
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
L2:
    mov mov eax, dword ptr [esi + 44]
    shl shl eax, 2
    push push eax
    call sub_100F78C5
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    je sub_100C4D26
    mov mov ecx, dword ptr [esi + 44]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    xor xor edx, edx
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [esi + 8], edx
    jbe L4
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [esi + 088h]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L6
    cmp cmp dword ptr [eax + 8], -1
    jne L8
    mov mov ecx, dword ptr [eax + 12]
    cmp cmp ecx, dword ptr [esi + 44]
    jae L9
    cmp cmp dword ptr [eax + 72], ebx
    jae L5
    cmp cmp dword ptr [eax + 88], ebx
    jb L7
    mov mov edi, dword ptr [ebp - 4]
    and and dword ptr [edi + ecx*4], 0
    mov mov ecx, dword ptr [eax + 72]
    cmp cmp ecx, ebx
    jb L11
    mov mov eax, dword ptr [eax + 12]
    mov mov edi, dword ptr [ebp - 4]
    lea lea eax, [edi + eax*4]
    cmp cmp ecx, dword ptr [eax]
    jae L12
    mov mov dword ptr [eax], ecx
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb L4
    mov mov edx, dword ptr [esi + 44]
    xor xor eax, eax
    cmp cmp edx, eax
    mov mov dword ptr [esi + 0150h], eax
    mov mov dword ptr [esi + 014Ch], eax
    jbe L16
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 24], ecx
    jbe L14
    mov mov edi, dword ptr [ebp + 20]
    cmp cmp eax, dword ptr [edi + ecx*4]
    je L15
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 24]
    jb L13
    cmp cmp ecx, dword ptr [ebp + 24]
    jb L17
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [esi + 014Ch]
    lea lea ecx, [ecx + eax*4]
    cmp cmp edi, dword ptr [ecx]
    jae L18
    mov mov dword ptr [esi + 0150h], eax
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [esi + 014Ch], ecx
    inc inc eax
    cmp cmp eax, dword ptr [esi + 44]
    jb L16
    cmp cmp dword ptr [esi + 014Ch], ebx
    ja sub_100C4CF4
    or or dword ptr [esi + 014Ch], -1
    mov mov dword ptr [esi + 0150h], edx
    mov mov edi, dword ptr [ebp + 16]
    dec dec edi
    neg neg edi
    sbb sbb edi, edi
    and and dword ptr [ebp + 20], 0
    and and edi, -3
    add add edi, 3
    cmp cmp dword ptr [ebp + 16], 0
    jbe sub_100C4E00
    lea lea eax, [esi + edi*4 + 013Ch]
    mov mov dword ptr [ebp + 24], eax
    mov mov eax, dword ptr [ebp + 24]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je sub_100C4D6A
L8:
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [eax + 80], ebx
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push edi
    push push dword ptr [esi + 0150h]
    mov mov ecx, esi
    push push dword ptr [esi + 088h]
    call sub_100862C8
    cmp cmp eax, -1
    mov mov ecx, dword ptr [ebp + 24]
    mov mov dword ptr [ecx], eax
    je sub_100C4E5A
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    and and dword ptr [eax + 60], 0
    and and dword ptr [eax + 48], 0
    mov mov dword ptr [eax + 72], ebx
    mov mov ecx, dword ptr [esi + 014Ch]
    mov mov dword ptr [eax + 80], ecx
    mov mov dword ptr [eax + 84], ebx
    mov mov dword ptr [eax + 88], ebx
    mov mov dword ptr [eax + 92], 1
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + ebx*4]
    cmp cmp dword ptr [ecx + 12], 0
    je sub_100C4E53
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 24], ecx
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
L13:
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [eax + 20], ecx
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100C4E94
    mov mov ecx, dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebp + 20]
    mov mov dword ptr [eax + edx*4], ecx
    add add dword ptr [ebp + 24], 4
L16:
    inc inc edi
    inc inc dword ptr [ebp + 20]
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp eax, dword ptr [ebp + 16]
    jb sub_100C4E0A
    xor xor esi, esi
    push push dword ptr [ebp - 4]
    call sub_100F7A8D
    pop pop ecx
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
L18:
    mov mov esi, 08007000Eh
    jmp sub_100C4EE4
FUN_100c4a8b ENDP
END
