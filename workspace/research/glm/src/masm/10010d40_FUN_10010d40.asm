.686
.MODEL FLAT, C
EXTRN sub_10010C18:PROC
EXTRN sub_10010D44:PROC
EXTRN sub_10010D4E:PROC
EXTRN sub_10010D5D:PROC
EXTRN sub_10010D76:PROC
EXTRN sub_10010E4B:PROC
EXTRN sub_10010E62:PROC
EXTRN sub_10010E7D:PROC
EXTRN sub_10010F46:PROC
EXTRN sub_10010F61:PROC
EXTRN sub_10010F7C:PROC
EXTRN sub_10011060:PROC
EXTRN sub_10011075:PROC
EXTRN sub_1001108C:PROC
.CODE
FUN_10010d40 PROC
    sub esp, 84
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [esi + 12]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 100]
    sar eax, cl
    sar edx, cl
    push edi
    mov edi, 1
    cmp eax, edi
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 28], edx
    jle L10
    cmp edx, edi
    jle L9
    mov cl, byte ptr [esi + 28]
    test cl, cl
    jne L0
    mov ecx, dword ptr [esi + 4]
    xor edx, edx
    mov dh, byte ptr [ecx + 1]
    add ecx, 2
    mov dl, byte ptr [ecx - 2]
    mov word ptr [esi + 2], 0
    mov dword ptr [esi + 4], ecx
    mov byte ptr [esi + 28], 1
    mov word ptr [esi], dx
L0:
    mov ebx, dword ptr [esi + 20]
    mov ecx, ebx
    imul ecx, eax
    mov al, byte ptr [esi]
    and al, 1
    mov byte ptr [esp + 15], al
    mov eax, esi
    mov dword ptr [esp + 16], ebx
    mov dword ptr [esp + 24], ecx
    call sub_10010C18
    mov al, byte ptr [esp + 15]
    test al, al
    je L1
    mov eax, dword ptr [esp + 28]
    imul eax, dword ptr [esp + 32]
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    push eax
    mov eax, dword ptr [esp + 104]
    mov ebx, esi
    call sub_10010D4E
    mov ebx, dword ptr [esp + 20]
    add esp, 4
L1:
    mov eax, dword ptr [esp + 28]
    test eax, eax
    jle L17
    mov ecx, dword ptr [esp + 32]
    dec eax
    shr eax, 1
    inc eax
    mov dword ptr [esp + 44], eax
    lea ecx, [ecx]
L2:
    test ecx, ecx
    jle L8
    lea eax, [ecx - 1]
    shr eax, 1
    inc eax
    mov dword ptr [esp + 40], eax
L3:
    cmp dword ptr [esi + 16], 1
    je L5
    xor edi, edi
    mov di, word ptr [esi]
    mov dx, word ptr [esi + 2]
    xor ebx, ebx
    push 0000000FFh
    push 9
    push 010182988h
    mov eax, edi
    and eax, 1
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [esi + 4]
    shr di, 1
    mov word ptr [esi], di
    mov bh, byte ptr [eax + 3]
    movzx ecx, byte ptr [eax + 1]
    mov bl, byte ptr [eax + 2]
    shl ebx, 8
    or ebx, ecx
    movzx ecx, byte ptr [eax]
    shl ebx, 8
    or ebx, ecx
    mov cl, dl
    shr ebx, cl
    lea ecx, [edx + 1]
    movzx edx, cx
    shr edx, 3
    shl ebx, 15
    add edx, eax
    and ecx, 7
    or ebx, edi
    mov eax, esi
    mov word ptr [esi], bx
    mov dword ptr [esi + 4], edx
    mov word ptr [esi + 2], cx
    call sub_10010D44
    push 0000000FFh
    mov ebx, eax
    push 9
    push 010182988h
    mov eax, esi
    mov dword ptr [esp + 72], ebx
    call sub_10010D5D
    push 0000000FFh
    mov edi, eax
    push 9
    push 010182988h
    mov eax, esi
    mov dword ptr [esp + 88], edi
    call sub_10010D76
    mov ecx, dword ptr [esp + 000000088h]
    movzx ecx, byte ptr [ecx]
    shl ecx, 1
    lea edx, [ecx + eax]
    add edx, edi
    add edx, ebx
    sar edx, 1
    add dl, byte ptr [esp + 56]
    mov dword ptr [esp + 92], eax
    mov byte ptr [ebp], dl
    mov edx, ecx
    sub edx, eax
    mov eax, dword ptr [esp + 52]
    mov dword ptr [esp + 72], edx
    sub edx, edi
    add edx, ebx
    sar edx, 1
    mov byte ptr [eax + ebp], dl
    mov edx, dword ptr [esp + 72]
    mov eax, dword ptr [esp + 60]
    sub edx, ebx
    add edx, edi
    sar edx, 1
    mov byte ptr [eax + ebp], dl
    mov edx, dword ptr [esp + 52]
    sub ecx, edi
    mov edi, dword ptr [esp + 92]
    add eax, edx
    sub ecx, ebx
    add esp, 36
    mov dword ptr [esp + 36], eax
    add ecx, edi
    sar ecx, 1
    mov byte ptr [eax + ebp], cl
    cmp dword ptr [esi + 16], 3
    jl L4
    xor edi, edi
    mov di, word ptr [esi]
    xor edx, edx
    push 0000001FEh
    push 10
    push 010186988h
    mov eax, edi
    and eax, 1
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [esi + 4]
    shr di, 1
    mov word ptr [esi], di
    mov dh, byte ptr [eax + 3]
    movzx ecx, byte ptr [eax + 1]
    mov dl, byte ptr [eax + 2]
    shl edx, 8
    or edx, ecx
    movzx ecx, byte ptr [eax]
    shl edx, 8
    or edx, ecx
    mov cl, byte ptr [esi + 2]
    shr edx, cl
    xor ecx, ecx
    mov cx, word ptr [esi + 2]
    shl edx, 15
    or edx, edi
    mov word ptr [esi], dx
    inc ecx
    movzx edx, cx
    shr edx, 3
    add edx, eax
    and ecx, 7
    mov eax, esi
    mov dword ptr [esi + 4], edx
    mov word ptr [esi + 2], cx
    call sub_10010E4B
    push 0000001FEh
    mov edi, eax
    push 10
    push 010186988h
    mov eax, esi
    add edi, ebx
    call sub_10010E62
    mov ebx, eax
    mov eax, dword ptr [esp + 76]
    push 0000001FEh
    add ebx, eax
    push 10
    push 010186988h
    mov eax, esi
    call sub_10010E7D
    add eax, dword ptr [esp + 92]
    mov ecx, dword ptr [esp + 000000088h]
    movzx ecx, byte ptr [ecx + 1]
    shl ecx, 1
    lea edx, [eax + ebx]
    add edx, edi
    add edx, ecx
    sar edx, 1
    add dl, byte ptr [esp + 56]
    mov dword ptr [esp + 64], ecx
    mov byte ptr [ebp + 1], dl
    mov edx, edi
    sub edx, eax
    sub edx, ebx
    add edx, ecx
    mov ecx, dword ptr [esp + 52]
    sar edx, 1
    mov byte ptr [ecx + ebp + 1], dl
    mov ecx, dword ptr [esp + 64]
    mov edx, ebx
    sub edx, eax
    sub edx, edi
    add edx, ecx
    mov ecx, dword ptr [esp + 60]
    sar edx, 1
    sub eax, ebx
    mov byte ptr [ecx + ebp + 1], dl
    mov edx, dword ptr [esp + 64]
    sub eax, edi
    add eax, edx
    mov edx, dword ptr [esp + 72]
    sar eax, 1
    mov byte ptr [edx + ebp + 1], al
    xor edi, edi
    mov di, word ptr [esi]
    mov dx, word ptr [esi + 2]
    xor ebx, ebx
    push 0000001FEh
    push 10
    push 010186988h
    mov eax, edi
    and eax, 1
    mov dword ptr [esp + 68], eax
    mov eax, dword ptr [esi + 4]
    shr di, 1
    mov word ptr [esi], di
    mov bh, byte ptr [eax + 3]
    movzx ecx, byte ptr [eax + 1]
    mov bl, byte ptr [eax + 2]
    shl ebx, 8
    or ebx, ecx
    movzx ecx, byte ptr [eax]
    shl ebx, 8
    or ebx, ecx
    mov cl, dl
    shr ebx, cl
    lea ecx, [edx + 1]
    movzx edx, cx
    shr edx, 3
    shl ebx, 15
    add edx, eax
    and ecx, 7
    or ebx, edi
    mov eax, esi
    mov word ptr [esi], bx
    mov dword ptr [esi + 4], edx
    mov word ptr [esi + 2], cx
    call sub_10010F46
    mov ecx, dword ptr [esp + 96]
    push 0000001FEh
    mov edi, eax
    push 10
    push 010186988h
    mov eax, esi
    add edi, ecx
    call sub_10010F61
    mov ebx, eax
    mov eax, dword ptr [esp + 112]
    push 0000001FEh
    add ebx, eax
    push 10
    push 010186988h
    mov eax, esi
    call sub_10010F7C
    add eax, dword ptr [esp + 000000080h]
    mov ecx, dword ptr [esp + 0000000ACh]
    movzx ecx, byte ptr [ecx + 2]
    shl ecx, 1
    lea edx, [eax + ebx]
    add edx, edi
    add edx, ecx
    sar edx, 1
    add dl, byte ptr [esp + 92]
    mov dword ptr [esp + 100], ecx
    mov byte ptr [ebp + 2], dl
    mov edx, edi
    sub edx, eax
    sub edx, ebx
    add edx, ecx
    mov ecx, dword ptr [esp + 88]
    sar edx, 1
    mov byte ptr [ecx + ebp + 2], dl
    mov ecx, dword ptr [esp + 100]
    mov edx, ebx
    sub edx, eax
    sub edx, edi
    add edx, ecx
    add esp, 72
    sar edx, 1
    mov ecx, dword ptr [esp + 24]
    sub eax, ebx
    mov byte ptr [ecx + ebp + 2], dl
    mov edx, dword ptr [esp + 28]
    sub eax, edi
    add eax, edx
    mov edx, dword ptr [esp + 36]
    sar eax, 1
    mov byte ptr [edx + ebp + 2], al
L4:
    mov ebx, dword ptr [esp + 16]
L5:
    mov ecx, dword ptr [esi + 16]
    mov eax, 3
    cmp ecx, eax
    je L6
    xor edi, edi
    mov di, word ptr [esi]
    xor edx, edx
    push 0000000FFh
    push 9
    push 01018A988h
    mov eax, edi
    and eax, 1
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [esi + 4]
    shr di, 1
    mov word ptr [esi], di
    mov dh, byte ptr [eax + 3]
    movzx ecx, byte ptr [eax + 1]
    mov dl, byte ptr [eax + 2]
    shl edx, 8
    or edx, ecx
    movzx ecx, byte ptr [eax]
    shl edx, 8
    or edx, ecx
    mov cl, byte ptr [esi + 2]
    shr edx, cl
    xor ecx, ecx
    mov cx, word ptr [esi + 2]
    shl edx, 15
    or edx, edi
    mov word ptr [esi], dx
    inc ecx
    movzx edx, cx
    shr edx, 3
    add edx, eax
    and ecx, 7
    mov eax, esi
    mov dword ptr [esi + 4], edx
    mov word ptr [esi + 2], cx
    call sub_10011060
    push 0000000FFh
    mov edi, eax
    push 9
    push 01018A988h
    mov eax, esi
    call sub_10011075
    push 0000000FFh
    mov dword ptr [esp + 116], eax
    push 9
    push 01018A988h
    mov eax, esi
    call sub_1001108C
    mov ecx, dword ptr [esp + 000000088h]
    movzx ecx, byte ptr [ebx + ecx - 1]
    mov edx, dword ptr [esp + 124]
    mov dword ptr [esp + 000000080h], eax
    add eax, edx
    mov dl, byte ptr [esp + 56]
    add eax, edi
    shl ecx, 1
    add eax, ecx
    sar eax, 1
    add al, dl
    mov byte ptr [ebx + ebp - 1], al
    mov eax, dword ptr [esp + 000000080h]
    mov edx, edi
    sub edx, eax
    mov eax, dword ptr [esp + 124]
    sub edx, eax
    add edx, ecx
    sar edx, 1
    mov byte ptr [ebp + ebx*2 - 1], dl
    sub eax, dword ptr [esp + 000000080h]
    mov edx, dword ptr [esp + 60]
    sub eax, edi
    add eax, ecx
    sar eax, 1
    lea edx, [ebx + edx - 1]
    mov byte ptr [edx + ebp], al
    mov eax, dword ptr [esp + 000000080h]
    sub eax, dword ptr [esp + 124]
    add esp, 36
    sub eax, edi
    add eax, ecx
    mov ecx, dword ptr [esp + 24]
    sar eax, 1
    lea edx, [ecx + ebx*2 - 1]
    mov byte ptr [edx + ebp], al
    jmp L7
L6:
    cmp dword ptr [esi + 20], eax
    je L7
    mov eax, dword ptr [esp + 24]
    mov byte ptr [ebx + ebp - 1], 0000000FFh
    mov byte ptr [ebp + ebx*2 - 1], 0000000FFh
    lea ecx, [ebx + eax - 1]
    lea edx, [eax + ebx*2 - 1]
    mov byte ptr [ecx + ebp], 0000000FFh
    mov byte ptr [edx + ebp], 0000000FFh
L7:
    mov edx, dword ptr [esp + 100]
    lea eax, [ebx + ebx]
    add ebp, eax
    mov eax, dword ptr [esp + 40]
    add edx, ebx
    dec eax
    mov dword ptr [esp + 100], edx
    mov dword ptr [esp + 40], eax
    jne L3
    mov ecx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 44]
L8:
    add ebp, dword ptr [esp + 24]
    dec eax
    mov dword ptr [esp + 44], eax
    jne L2
    pop edi
    pop ebp
    pop ebx
    add esp, 84
    ret
L9:
    cmp eax, edi
L10:
    jge L11
    mov dword ptr [esp + 32], edi
    mov eax, edi
L11:
    cmp edx, edi
    jge L12
    mov dword ptr [esp + 28], edi
    mov edx, edi
L12:
    lea ecx, [edx + eax - 1]
L13:
    mov edx, dword ptr [esi + 16]
    xor eax, eax
    test edx, edx
    jle L15
    lea esp, [esp]
L14:
    mov edx, dword ptr [esi + 4]
    mov dl, byte ptr [edx]
    mov byte ptr [ebp], dl
    mov ebx, dword ptr [esi + 4]
    inc ebp
    inc ebx
    mov dword ptr [esi + 4], ebx
    mov edx, dword ptr [esi + 16]
    inc eax
    cmp eax, edx
    jl L14
L15:
    mov eax, dword ptr [esi + 20]
    cmp eax, dword ptr [esi + 16]
    je L16
    mov byte ptr [ebp], 0000000FFh
    inc ebp
L16:
    dec ecx
    jne L13
L17:
    pop edi
    pop ebp
    pop ebx
    add esp, 84
    ret
FUN_10010d40 ENDP
END
