.686
.MODEL FLAT, C
EXTRN sub_1007D9B0:PROC
EXTRN sub_1007E461:PROC
EXTRN sub_10080C5E:PROC
EXTRN sub_100F78AB:PROC
EXTRN sub_100F78F8:PROC
EXTRN sub_100F7998:PROC
.CODE
FUN_10080c7b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 24]
    mov cx, word ptr [eax + 8]
    movzx eax, cx
    push esi
    mov esi, dword ptr [ebp + 8]
    cmp esi, eax
    jb L0
    xor eax, eax
    jmp L14
L0:
    cmp cx, 1
    jne L1
    mov eax, ebx
    jmp L14
L1:
    cmp dword ptr [ebx + 60], 0
    push edi
    jne L4
    shl eax, 2
    push eax
    call sub_100F78AB
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebx + 60], edi
    jne L3
L2:
    xor eax, eax
    jmp L13
L3:
    mov eax, dword ptr [ebx + 24]
    movzx ecx, word ptr [eax + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
L4:
    mov ecx, dword ptr [ebx + 60]
    mov eax, esi
    shl eax, 2
    cmp dword ptr [eax + ecx], 0
    mov dword ptr [ebp - 4], eax
    jne L12
    cmp dword ptr [ebx + 64], 0
    jne L5
    push 16
    call sub_100F78F8
    test eax, eax
    pop ecx
    mov dword ptr [ebx + 64], eax
    je L2
    mov esi, dword ptr [ebx + 24]
    mov edi, eax
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov eax, dword ptr [ebx + 64]
    mov word ptr [eax + 8], 1
L5:
    xor eax, eax
    mov ax, word ptr [ebx + 44]
    imul ax, word ptr [ebp + 8]
    xor edx, edx
    mov dx, word ptr [ebx + 10]
    push 5
    lea esi, [ebx + 4]
    pop ecx
    lea edi, [ebp - 24]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov cx, word ptr [ebx + 12]
    mov si, word ptr [ebx + 44]
    add eax, edx
    mov word ptr [ebp - 18], ax
    movzx eax, ax
    movzx edi, cx
    sub edi, eax
    movzx eax, dx
    add edi, eax
    movzx eax, si
    cmp eax, edi
    mov word ptr [ebp - 16], si
    jle L6
    sub ecx, dword ptr [ebp - 18]
    add ecx, edx
    mov word ptr [ebp - 16], cx
L6:
    mov ax, word ptr [ebx + 8]
    mov ecx, dword ptr [ebx + 20]
    neg ax
    sbb eax, eax
    and eax, 3
    inc eax
    test ecx, ecx
    je L7
    mov edx, dword ptr [ebx + 44]
    imul edx, eax
    imul edx, dword ptr [ebp + 8]
    lea ecx, [ecx + edx*4]
    mov dword ptr [ebp - 8], ecx
L7:
    mov ecx, dword ptr [ebx + 44]
    imul ecx, eax
    imul ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 32]
    push 68
    lea esi, [eax + ecx*4]
    call sub_100F7998
    test eax, eax
    pop ecx
    je L8
    push esi
    push dword ptr [ebx + 28]
    lea ecx, [ebp - 24]
    push dword ptr [ebx + 64]
    push ecx
    push dword ptr [ebx]
    mov ecx, eax
    call sub_1007D9B0
    jmp L9
L8:
    xor eax, eax
L9:
    test eax, eax
    mov edx, dword ptr [ebx + 60]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx], eax
    je L2
    mov eax, dword ptr [ebx + 60]
    mov ecx, dword ptr [ecx + eax]
    call sub_10080C5E
    test eax, eax
    jge L11
    mov eax, dword ptr [ebx + 60]
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + eax]
    test ecx, ecx
    je L10
    push 1
    call sub_1007E461
L10:
    mov eax, dword ptr [ebx + 60]
    and dword ptr [esi + eax], 0
    jmp L2
L11:
    mov eax, dword ptr [ebp - 4]
L12:
    mov ecx, dword ptr [ebx + 60]
    mov eax, dword ptr [eax + ecx]
L13:
    pop edi
L14:
    pop esi
    pop ebx
    leave
    ret 4
FUN_10080c7b ENDP
END
