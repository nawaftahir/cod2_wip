.686
.MODEL FLAT, C
EXTRN sub_1007D7F0:PROC
EXTRN sub_10080977:PROC
EXTRN sub_10080C81:PROC
EXTRN sub_10080CAA:PROC
EXTRN sub_10080CE6:PROC
EXTRN sub_10080CF0:PROC
EXTRN sub_10080CF7:PROC
EXTRN sub_10080D08:PROC
EXTRN sub_10080DA2:PROC
EXTRN sub_10080DE5:PROC
EXTRN sub_10080DEC:PROC
EXTRN sub_100F7892:PROC
.CODE
FUN_10080af7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 40
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 24]
    cmp cmp word ptr [eax + 10], 0
    push push esi
    push push edi
    je sub_10080C81
    movzx movzx eax, word ptr [eax + 10]
    shl shl eax, 2
    push push eax
    call sub_100F7892
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebx + 56], edi
    je sub_10080CAA
    mov mov eax, dword ptr [ebx + 24]
    movzx movzx ecx, word ptr [eax + 10]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [ebx + 32]
    push push 5
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebx + 24]
    lea lea esi, [ebx + 4]
    pop pop ecx
    lea lea edi, [ebp - 40]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    movzx movzx edx, word ptr [eax + 10]
    mov mov eax, dword ptr [eax + 12]
    mov mov ecx, dword ptr [ebx]
    lea lea esi, [eax + edx*8]
    cmp cmp esi, dword ptr [ecx + 12]
    ja sub_10080CE6
    mov mov edi, dword ptr [ecx + 8]
    and and dword ptr [ebp - 4], 0
    add add edi, eax
    test test edx, edx
    jbe sub_10080CF0
    mov mov ecx, dword ptr [edi + 4]
    mov mov eax, dword ptr [ebx]
    lea lea edx, [ecx + 16]
    cmp cmp edx, dword ptr [eax + 12]
    ja sub_10080D08
    mov mov esi, dword ptr [eax + 8]
    and and dword ptr [ebp - 12], 0
    and and dword ptr [ebp - 16], 0
    add add esi, ecx
    lea lea ecx, [ebp - 16]
    push push ecx
    lea lea ecx, [ebp - 12]
    push push ecx
    push push 1
    push push esi
    lea lea ecx, [ebp - 40]
    push push ecx
    push push eax
    call sub_1007D7F0
    mov mov eax, dword ptr [edi]
    mov mov cx, word ptr [ebx + 12]
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [edi + 4]
    xor xor edx, edx
    mov mov dx, word ptr [ebx + 10]
    mov mov dword ptr [ebp - 28], eax
    mov mov ax, word ptr [esi + 8]
    imul imul ax, word ptr [ebp - 12]
    mov mov dword ptr [ebp - 20], edx
    movzx movzx ecx, cx
    movzx movzx edx, dx
    add add edx, ecx
    movzx movzx ecx, word ptr [ebp - 34]
    mov mov word ptr [ebp - 32], ax
    movzx movzx eax, ax
    add add ecx, eax
    cmp cmp ecx, edx
    jle sub_10080CF7
    mov mov eax, dword ptr [ebp - 20]
    sub sub eax, dword ptr [ebp - 34]
    xor xor ecx, ecx
    mov mov cx, word ptr [ebx + 12]
    add add eax, ecx
    mov mov word ptr [ebp - 32], ax
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 40]
    push push esi
    push push eax
    push push dword ptr [ebx]
    call sub_10080977
    mov mov ecx, dword ptr [ebx + 56]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [ebx + 56]
    mov mov ecx, edx
    lea lea eax, [eax + ecx*4]
    cmp cmp dword ptr [eax], 0
    je sub_10080DA2
    mov mov cx, word ptr [ebp - 32]
    add add word ptr [ebp - 34], cx
    mov mov cx, word ptr [ebp - 36]
    mov mov eax, dword ptr [eax]
    neg neg cx
    sbb sbb ecx, ecx
    and and ecx, 3
    inc inc ecx
    imul imul ecx, dword ptr [eax + 44]
    movzx movzx eax, word ptr [esi + 8]
    imul imul ecx, eax
    mov mov eax, dword ptr [ebp - 8]
    lea lea eax, [eax + ecx*4]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebx + 24]
    movzx movzx eax, word ptr [eax + 10]
    add add edi, 8
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], eax
    jb sub_10080CF0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 080004005h
    jmp sub_10080DE5
    mov mov eax, 08007000Eh
    jmp sub_10080DEC
FUN_10080af7 ENDP
END
