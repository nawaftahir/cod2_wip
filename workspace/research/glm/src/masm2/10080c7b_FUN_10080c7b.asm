.686
.MODEL FLAT, C
EXTRN sub_1007D9B0:PROC
EXTRN sub_1007E461:PROC
EXTRN sub_10080C5E:PROC
EXTRN sub_10080E22:PROC
EXTRN sub_10080E34:PROC
EXTRN sub_10080E41:PROC
EXTRN sub_10080E51:PROC
EXTRN sub_10080E58:PROC
EXTRN sub_10080E61:PROC
EXTRN sub_10080E8A:PROC
EXTRN sub_10080E99:PROC
EXTRN sub_10080EF7:PROC
EXTRN sub_10080F0F:PROC
EXTRN sub_10080F71:PROC
EXTRN sub_10080F72:PROC
EXTRN sub_100F78AB:PROC
EXTRN sub_100F78F8:PROC
EXTRN sub_100F7998:PROC
.CODE
FUN_10080c7b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 24]
    mov mov cx, word ptr [eax + 8]
    movzx movzx eax, cx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp esi, eax
    jb L0
    xor xor eax, eax
    jmp sub_10080E34
    cmp cmp cx, 1
    jne L1
    mov mov eax, ebx
    jmp sub_10080E41
    cmp cmp dword ptr [ebx + 60], 0
    push push edi
    jne L3
    shl shl eax, 2
    push push eax
    call sub_100F78AB
L0:
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebx + 60], edi
    jne L2
    xor xor eax, eax
    jmp sub_10080E61
    mov mov eax, dword ptr [ebx + 24]
    movzx movzx ecx, word ptr [eax + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [ebx + 60]
    mov mov eax, esi
    shl shl eax, 2
    cmp cmp dword ptr [eax + ecx], 0
    mov mov dword ptr [ebp - 4], eax
    jne sub_10080E8A
    cmp cmp dword ptr [ebx + 64], 0
    jne L5
    push push 16
    call sub_100F78F8
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebx + 64], eax
    je L4
    mov mov esi, dword ptr [ebx + 24]
    mov mov edi, eax
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
L2:
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov eax, dword ptr [ebx + 64]
    mov mov word ptr [eax + 8], 1
    xor xor eax, eax
    mov mov ax, word ptr [ebx + 44]
    imul imul ax, word ptr [ebp + 8]
    xor xor edx, edx
    mov mov dx, word ptr [ebx + 10]
    push push 5
    lea lea esi, [ebx + 4]
    pop pop ecx
    lea lea edi, [ebp - 24]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov cx, word ptr [ebx + 12]
    mov mov si, word ptr [ebx + 44]
    add add eax, edx
    mov mov word ptr [ebp - 18], ax
    movzx movzx eax, ax
    movzx movzx edi, cx
    sub sub edi, eax
    movzx movzx eax, dx
    add add edi, eax
    movzx movzx eax, si
    cmp cmp eax, edi
    mov mov word ptr [ebp - 16], si
    jle sub_10080E58
    sub sub ecx, dword ptr [ebp - 18]
    add add ecx, edx
    mov mov word ptr [ebp - 16], cx
    mov mov ax, word ptr [ebx + 8]
    mov mov ecx, dword ptr [ebx + 20]
    neg neg ax
    sbb sbb eax, eax
    and and eax, 3
    inc inc eax
    test test ecx, ecx
    je sub_10080E99
    mov mov edx, dword ptr [ebx + 44]
    imul imul edx, eax
    imul imul edx, dword ptr [ebp + 8]
    lea lea ecx, [ecx + edx*4]
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [ebx + 44]
    imul imul ecx, eax
    imul imul ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx + 32]
    push push 68
    lea lea esi, [eax + ecx*4]
    call sub_100F7998
    test test eax, eax
    pop pop ecx
    je sub_10080EF7
    push push esi
    push push dword ptr [ebx + 28]
    lea lea ecx, [ebp - 24]
    push push dword ptr [ebx + 64]
    push push ecx
    push push dword ptr [ebx]
    mov mov ecx, eax
    call sub_1007D9B0
    jmp sub_10080F0F
    xor xor eax, eax
    test test eax, eax
    mov mov edx, dword ptr [ebx + 60]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx], eax
    je sub_10080E22
    mov mov eax, dword ptr [ebx + 60]
    mov mov ecx, dword ptr [ecx + eax]
    call sub_10080C5E
    test test eax, eax
    jge sub_10080F71
    mov mov eax, dword ptr [ebx + 60]
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + eax]
    test test ecx, ecx
    je sub_10080F72
    push push 1
    call sub_1007E461
    mov mov eax, dword ptr [ebx + 60]
    and and dword ptr [esi + eax], 0
    jmp sub_10080E51
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebx + 60]
    mov mov eax, dword ptr [eax + ecx]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10080c7b ENDP
END
