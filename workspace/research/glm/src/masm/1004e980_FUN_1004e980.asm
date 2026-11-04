.686
.MODEL FLAT, C
.CODE
FUN_1004e980 PROC
    cmp eax, 14
    push ebp
    lea ebp, [eax + ecx]
    mov cl, 70
    jb L2
    cmp byte ptr [edi], 74
    jne L2
    cmp byte ptr [edi + 1], cl
    jne L2
    cmp byte ptr [edi + 2], 73
    jne L2
    cmp byte ptr [edi + 3], cl
    jne L2
    mov dl, byte ptr [edi + 4]
    test dl, dl
    jne L2
    mov byte ptr [esi + 000000108h], 1
    mov dl, byte ptr [edi + 5]
    mov byte ptr [esi + 000000109h], dl
    mov al, byte ptr [edi + 6]
    mov byte ptr [esi + 00000010Ah], al
    mov cl, byte ptr [edi + 7]
    mov byte ptr [esi + 00000010Bh], cl
    movzx dx, byte ptr [edi + 8]
    movzx ax, byte ptr [edi + 9]
    shl edx, 8
    add edx, eax
    mov al, byte ptr [esi + 000000109h]
    mov word ptr [esi + 00000010Ch], dx
    movzx cx, byte ptr [edi + 10]
    movzx dx, byte ptr [edi + 11]
    shl ecx, 8
    add ecx, edx
    cmp al, 1
    mov word ptr [esi + 00000010Eh], cx
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 119
    movzx ecx, byte ptr [esi + 000000109h]
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], ecx
    movzx eax, byte ptr [esi + 00000010Ah]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 28], eax
    mov edx, dword ptr [esi]
    push -1
    push esi
    call dword ptr [edx + 4]
    add esp, 8
L0:
    mov eax, dword ptr [esi]
    movzx ecx, byte ptr [esi + 000000109h]
    add eax, 24
    mov dword ptr [eax], ecx
    movzx edx, byte ptr [esi + 00000010Ah]
    mov dword ptr [eax + 4], edx
    movzx ecx, word ptr [esi + 00000010Ch]
    mov dword ptr [eax + 8], ecx
    movzx edx, word ptr [esi + 00000010Eh]
    mov dword ptr [eax + 12], edx
    movzx ecx, byte ptr [esi + 00000010Bh]
    mov dword ptr [eax + 16], ecx
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 87
    mov eax, dword ptr [esi]
    push 1
    push esi
    call dword ptr [eax + 4]
    mov cl, byte ptr [edi + 12]
    mov al, byte ptr [edi + 13]
    add esp, 8
    or cl, al
    je L1
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 90
    movzx eax, byte ptr [edi + 12]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], eax
    movzx edx, byte ptr [edi + 13]
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 28], edx
    mov ecx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [ecx + 4]
    add esp, 8
L1:
    movzx eax, byte ptr [edi + 12]
    movzx edx, byte ptr [edi + 13]
    imul eax, edx
    sub ebp, 14
    lea eax, [eax + eax*2]
    cmp ebp, eax
    je L7
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 88
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], ebp
    mov eax, dword ptr [esi]
    push 1
    push esi
    call dword ptr [eax + 4]
    add esp, 8
    pop ebp
    ret
L2:
    cmp eax, 6
    jb L6
    cmp byte ptr [edi], 74
    jne L6
    cmp byte ptr [edi + 1], cl
    jne L6
    mov cl, byte ptr [edi + 2]
    mov al, 88
    cmp cl, al
    jne L6
    cmp byte ptr [edi + 3], al
    jne L6
    mov al, byte ptr [edi + 4]
    test al, al
    jne L6
    movzx eax, byte ptr [edi + 5]
    sub eax, 16
    je L5
    dec eax
    je L4
    sub eax, 2
    push 1
    push esi
    je L3
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 89
    movzx edx, byte ptr [edi + 5]
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 24], edx
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 28], ebp
    mov edx, dword ptr [esi]
    call dword ptr [edx + 4]
    add esp, 8
    pop ebp
    ret
L3:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 110
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], ebp
    mov edx, dword ptr [esi]
    call dword ptr [edx + 4]
    add esp, 8
    pop ebp
    ret
L4:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 109
    mov ecx, dword ptr [esi]
    push 1
    mov dword ptr [ecx + 24], ebp
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 4]
    add esp, 8
    pop ebp
    ret
L5:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 108
    mov ecx, dword ptr [esi]
    push 1
    mov dword ptr [ecx + 24], ebp
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 4]
    add esp, 8
    pop ebp
    ret
L6:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 77
    mov ecx, dword ptr [esi]
    push 1
    mov dword ptr [ecx + 24], ebp
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 4]
    add esp, 8
L7:
    pop ebp
    ret
FUN_1004e980 ENDP
END
