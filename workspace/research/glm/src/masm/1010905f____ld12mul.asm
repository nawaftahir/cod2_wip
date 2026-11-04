.686
.MODEL FLAT, C
EXTRN sub_10100F7D:PROC
EXTRN sub_10108FAB:PROC
EXTRN sub_10109071:PROC
EXTRN sub_101090E0:PROC
EXTRN g_101A50D0:DWORD
.CODE
___ld12mul PROC
    push ebp
    mov ebp, esp
    sub esp, 40
    mov eax, dword ptr [g_101A50D0]
    push ebx
    mov ebx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    xor ecx, ecx
    mov cx, word ptr [ebx + 10]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 8], eax
    mov ax, word ptr [esi + 10]
    push edi
    mov edi, ecx
    mov edx, 000007FFFh
    and ecx, edx
    xor edi, eax
    and eax, edx
    and edi, 000008000h
    cmp ax, 000007FFFh
    lea edx, [ecx + eax]
    mov dword ptr [ebp + 8], edx
    jae L21
    cmp cx, 000007FFFh
    jae L21
    cmp dx, 00000BFFDh
    ja L21
    cmp dx, 000003FBFh
    ja L0
    xor eax, eax
    jmp L3
L0:
    test ax, ax
    mov edx, 07FFFFFFFh
    jne L1
    inc dword ptr [ebp + 8]
    xor eax, eax
    test dword ptr [esi + 8], edx
    jne L2
    cmp dword ptr [esi + 4], eax
    jne L2
    cmp dword ptr [esi], eax
    jne L2
    jmp L20
L1:
    xor eax, eax
L2:
    cmp cx, ax
    jne L4
    inc dword ptr [ebp + 8]
    test dword ptr [ebx + 8], edx
    jne L4
    cmp dword ptr [ebx + 4], eax
    jne L4
    cmp dword ptr [ebx], eax
    jne L4
L3:
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi], eax
    jmp L22
L4:
    mov dword ptr [ebp - 24], eax
    lea eax, [ebp - 12]
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp + 12], 5
L5:
    mov eax, dword ptr [ebp - 24]
    add eax, eax
    cmp dword ptr [ebp + 12], 0
    jle L8
    add eax, esi
    mov dword ptr [ebp - 36], eax
    mov eax, dword ptr [ebp + 12]
    lea ecx, [ebx + 8]
    mov dword ptr [ebp - 32], ecx
    mov dword ptr [ebp - 40], eax
L6:
    mov eax, dword ptr [ebp - 32]
    mov ecx, dword ptr [ebp - 36]
    movzx ecx, word ptr [ecx]
    movzx eax, word ptr [eax]
    imul eax, ecx
    mov ecx, dword ptr [ebp - 20]
    add ecx, -4
    push ecx
    push eax
    push dword ptr [ecx]
    call sub_10108FAB
    add esp, 12
    test eax, eax
    je L7
    mov eax, dword ptr [ebp - 20]
    inc word ptr [eax]
L7:
    add dword ptr [ebp - 36], 2
    sub dword ptr [ebp - 32], 2
    dec dword ptr [ebp - 40]
    jne L6
L8:
    add dword ptr [ebp - 20], 2
    inc dword ptr [ebp - 24]
    dec dword ptr [ebp + 12]
    cmp dword ptr [ebp + 12], 0
    jg L5
    add dword ptr [ebp + 8], 00000C002h
    cmp word ptr [ebp + 8], 0
    jle L11
L9:
    test byte ptr [ebp - 5], 000000080h
    jne L10
    lea eax, [ebp - 16]
    push eax
    call sub_10109071
    add dword ptr [ebp + 8], 00000FFFFh
    cmp word ptr [ebp + 8], 0
    pop ecx
    jg L9
L10:
    cmp word ptr [ebp + 8], 0
    jg L14
L11:
    add dword ptr [ebp + 8], 00000FFFFh
    cmp word ptr [ebp + 8], 0
    jge L14
    mov eax, dword ptr [ebp + 8]
    neg eax
    movzx ebx, ax
    add dword ptr [ebp + 8], ebx
L12:
    test byte ptr [ebp - 16], 1
    je L13
    inc dword ptr [ebp - 28]
L13:
    lea eax, [ebp - 16]
    push eax
    call sub_101090E0
    dec ebx
    pop ecx
    jne L12
    cmp dword ptr [ebp - 28], 0
    je L14
    or byte ptr [ebp - 16], 1
L14:
    cmp word ptr [ebp - 16], 000008000h
    ja L15
    mov eax, dword ptr [ebp - 16]
    and eax, 00001FFFFh
    cmp eax, 000018000h
    jne L19
L15:
    cmp dword ptr [ebp - 14], -1
    jne L18
    and dword ptr [ebp - 14], 0
    cmp dword ptr [ebp - 10], -1
    jne L17
    and dword ptr [ebp - 10], 0
    cmp word ptr [ebp - 6], 00000FFFFh
    jne L16
    inc dword ptr [ebp + 8]
    mov word ptr [ebp - 6], 000008000h
    jmp L19
L16:
    inc word ptr [ebp - 6]
    jmp L19
L17:
    inc dword ptr [ebp - 10]
    jmp L19
L18:
    inc dword ptr [ebp - 14]
L19:
    mov eax, dword ptr [ebp + 8]
    cmp ax, 000007FFFh
    jae L21
    mov cx, word ptr [ebp - 14]
    mov word ptr [esi], cx
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [esi + 2], ecx
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [esi + 6], ecx
    or eax, edi
L20:
    mov word ptr [esi + 10], ax
    jmp L22
L21:
    neg di
    sbb edi, edi
    and dword ptr [esi + 4], 0
    and edi, 080000000h
    add edi, 07FFF8000h
    and dword ptr [esi], 0
    mov dword ptr [esi + 8], edi
L22:
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    call sub_10100F7D
    leave
    ret
___ld12mul ENDP
END
