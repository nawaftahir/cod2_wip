.686
.MODEL FLAT, C
EXTRN sub_1007D7F0:PROC
EXTRN sub_10080977:PROC
EXTRN sub_100F7892:PROC
.CODE
FUN_10080af7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 24]
    cmp word ptr [eax + 10], 0
    push esi
    push edi
    je L2
    movzx eax, word ptr [eax + 10]
    shl eax, 2
    push eax
    call sub_100F7892
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebx + 56], edi
    je L5
    mov eax, dword ptr [ebx + 24]
    movzx ecx, word ptr [eax + 10]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebx + 32]
    push 5
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebx + 24]
    lea esi, [ebx + 4]
    pop ecx
    lea edi, [ebp - 40]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    movzx edx, word ptr [eax + 10]
    mov eax, dword ptr [eax + 12]
    mov ecx, dword ptr [ebx]
    lea esi, [eax + edx*8]
    cmp esi, dword ptr [ecx + 12]
    ja L4
    mov edi, dword ptr [ecx + 8]
    and dword ptr [ebp - 4], 0
    add edi, eax
    test edx, edx
    jbe L2
L0:
    mov ecx, dword ptr [edi + 4]
    mov eax, dword ptr [ebx]
    lea edx, [ecx + 16]
    cmp edx, dword ptr [eax + 12]
    ja L4
    mov esi, dword ptr [eax + 8]
    and dword ptr [ebp - 12], 0
    and dword ptr [ebp - 16], 0
    add esi, ecx
    lea ecx, [ebp - 16]
    push ecx
    lea ecx, [ebp - 12]
    push ecx
    push 1
    push esi
    lea ecx, [ebp - 40]
    push ecx
    push eax
    call sub_1007D7F0
    mov eax, dword ptr [edi]
    mov cx, word ptr [ebx + 12]
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [edi + 4]
    xor edx, edx
    mov dx, word ptr [ebx + 10]
    mov dword ptr [ebp - 28], eax
    mov ax, word ptr [esi + 8]
    imul ax, word ptr [ebp - 12]
    mov dword ptr [ebp - 20], edx
    movzx ecx, cx
    movzx edx, dx
    add edx, ecx
    movzx ecx, word ptr [ebp - 34]
    mov word ptr [ebp - 32], ax
    movzx eax, ax
    add ecx, eax
    cmp ecx, edx
    jle L1
    mov eax, dword ptr [ebp - 20]
    sub eax, dword ptr [ebp - 34]
    xor ecx, ecx
    mov cx, word ptr [ebx + 12]
    add eax, ecx
    mov word ptr [ebp - 32], ax
L1:
    push dword ptr [ebp - 8]
    lea eax, [ebp - 40]
    push esi
    push eax
    push dword ptr [ebx]
    call sub_10080977
    mov ecx, dword ptr [ebx + 56]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [ebx + 56]
    mov ecx, edx
    lea eax, [eax + ecx*4]
    cmp dword ptr [eax], 0
    je L5
    mov cx, word ptr [ebp - 32]
    add word ptr [ebp - 34], cx
    mov cx, word ptr [ebp - 36]
    mov eax, dword ptr [eax]
    neg cx
    sbb ecx, ecx
    and ecx, 3
    inc ecx
    imul ecx, dword ptr [eax + 44]
    movzx eax, word ptr [esi + 8]
    imul ecx, eax
    mov eax, dword ptr [ebp - 8]
    lea eax, [eax + ecx*4]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebx + 24]
    movzx eax, word ptr [eax + 10]
    add edi, 8
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], eax
    jb L0
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L4:
    mov eax, 080004005h
    jmp L3
L5:
    mov eax, 08007000Eh
    jmp L3
FUN_10080af7 ENDP
END
