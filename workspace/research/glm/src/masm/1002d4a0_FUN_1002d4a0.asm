.686
.MODEL FLAT, C
.CODE
FUN_1002d4a0 PROC
    sub esp, 20
    push ebx
    push ebp
    push esi
    push edi
    push 24
    call dword ptr [esp + 0x38]
    mov esi, dword ptr [esp + 52]
    mov ebx, dword ptr [esp + 44]
    mov ebp, eax
    add dword ptr [ebx + 000000084h], 24
    mov eax, dword ptr [esi]
    mov cl, byte ptr [eax]
    mov byte ptr [ebp], cl
    mov edi, dword ptr [esi]
    add esp, 4
    inc edi
    mov dword ptr [esi], edi
    mov eax, edi
    mov cx, word ptr [eax]
    mov edi, dword ptr [esp + 44]
    add eax, 2
    mov dword ptr [esi], eax
    mov word ptr [ebp + 2], cx
    mov eax, dword ptr [esi]
    mov cx, word ptr [eax]
    add eax, 2
    mov dword ptr [esi], eax
    mov word ptr [ebp + 4], cx
    mov eax, dword ptr [esi]
    mov cx, word ptr [eax]
    movsx ecx, cx
    add eax, 2
    cmp ecx, -1
    mov dword ptr [esp + 16], ebp
    mov dword ptr [esi], eax
    mov dword ptr [esp + 24], ecx
    jne L0
    mov cx, word ptr [eax]
    add eax, 2
    mov dword ptr [esi], eax
    movsx edx, word ptr [ebp + 2]
    movsx eax, cx
    lea eax, [eax + edx*4]
    mov word ptr [ebp + 6], 00000FFFFh
    shl eax, 4
    jmp L1
L0:
    mov edx, ecx
    shl edx, 6
    mov word ptr [ebp + 6], dx
    mov eax, ecx
    and ecx, 31
    sar eax, 5
    lea eax, [edi + eax*4]
    mov edx, 1
    shl edx, cl
    or dword ptr [eax], edx
    movsx eax, word ptr [ebp + 2]
    shl eax, 6
L1:
    push eax
    mov dword ptr [esp + 44], eax
    call dword ptr [esp + 0x38]
    mov edx, dword ptr [ebx + 000000084h]
    mov ecx, dword ptr [esp + 44]
    add edx, ecx
    mov dword ptr [ebx + 000000084h], edx
    add esp, 4
    cmp word ptr [ebp + 2], 0
    mov dword ptr [ebp + 12], eax
    mov dword ptr [esp + 20], 0
    jle L9
    lea esp, [esp]
L2:
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [esi]
    mov cl, byte ptr [edx]
    mov byte ptr [eax + 12], cl
    mov edx, dword ptr [esi]
    mov cl, byte ptr [edx + 1]
    mov byte ptr [eax + 13], cl
    mov edx, dword ptr [esi]
    mov cl, byte ptr [edx + 2]
    mov byte ptr [eax + 14], cl
    mov edx, dword ptr [esi]
    mov cl, byte ptr [edx + 3]
    mov byte ptr [eax + 15], cl
    mov edx, dword ptr [esi]
    add edx, 4
    mov dword ptr [esi], edx
    mov ecx, edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 28], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 44], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 16], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 24], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 32], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    mov dword ptr [esp + 40], edx
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 36], ecx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 40], ecx
    cmp dword ptr [esp + 24], -1
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    jne L6
    mov dl, byte ptr [ecx]
    inc ecx
    mov dword ptr [esi], ecx
    mov byte ptr [eax + 60], dl
    mov ecx, dword ptr [esi]
    add ecx, 2
    mov byte ptr [esp + 40], dl
    mov dx, word ptr [ecx - 2]
    mov dword ptr [esi], ecx
    movsx edx, dx
    mov ecx, edx
    sar ecx, 5
    lea ecx, [edi + ecx*4]
    mov dword ptr [esp + 48], ecx
    mov ecx, edx
    and ecx, 31
    mov ebx, 1
    shl ebx, cl
    mov ecx, dword ptr [esp + 48]
    shl edx, 6
    or dword ptr [ecx], ebx
    mov word ptr [eax + 62], dx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 48], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 48], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 52], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 48], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 56], ecx
    mov cl, byte ptr [esp + 40]
    test cl, cl
    mov dword ptr [esp + 48], edx
    je L7
    mov edx, dword ptr [esi]
    mov dl, byte ptr [edx]
    mov byte ptr [eax + 61], dl
    mov ebx, dword ptr [esi]
    movzx ecx, cl
    inc ebx
    add eax, 64
    xor edx, edx
    cmp ecx, 4
    mov dword ptr [esi], ebx
    mov dword ptr [esp + 32], ecx
    jl L4
    add ecx, -4
    shr ecx, 2
    inc ecx
    mov dword ptr [esp + 48], ecx
    shl ecx, 2
    mov dword ptr [esp + 28], ecx
L3:
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    movsx edx, dx
    mov ecx, edx
    sar ecx, 5
    lea ebx, [edi + ecx*4]
    mov ecx, edx
    and ecx, 31
    shl edx, 6
    mov ebp, 1
    shl ebp, cl
    mov ecx, dword ptr [ebx]
    add eax, 16
    or ecx, ebp
    mov dword ptr [ebx], ecx
    mov word ptr [eax - 4], dx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 16], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 12], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 8], ecx
    mov ecx, dword ptr [esi]
    add ecx, 2
    mov dword ptr [esp + 40], edx
    mov dx, word ptr [ecx - 2]
    mov dword ptr [esi], ecx
    mov word ptr [eax - 2], dx
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    movsx edx, dx
    mov ecx, edx
    sar ecx, 5
    lea ebx, [edi + ecx*4]
    mov ecx, edx
    and ecx, 31
    mov ebp, 1
    shl ebp, cl
    mov ecx, dword ptr [ebx]
    shl edx, 6
    or ecx, ebp
    mov dword ptr [ebx], ecx
    mov word ptr [eax + 12], dx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov dword ptr [esp + 40], edx
    mov ecx, edx
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    mov word ptr [eax + 14], dx
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    movsx edx, dx
    mov ecx, edx
    sar ecx, 5
    lea ebx, [edi + ecx*4]
    mov ecx, edx
    and ecx, 31
    shl edx, 6
    mov ebp, 1
    shl ebp, cl
    mov ecx, dword ptr [ebx]
    add eax, 16
    add eax, 16
    or ecx, ebp
    mov dword ptr [ebx], ecx
    mov word ptr [eax - 4], dx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 16], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 12], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 8], ecx
    mov ecx, dword ptr [esi]
    add ecx, 2
    mov dword ptr [esp + 40], edx
    mov dx, word ptr [ecx - 2]
    mov dword ptr [esi], ecx
    mov word ptr [eax - 2], dx
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    movsx edx, dx
    mov ecx, edx
    sar ecx, 5
    lea ebx, [edi + ecx*4]
    mov ecx, edx
    and ecx, 31
    mov ebp, 1
    shl ebp, cl
    mov ecx, dword ptr [ebx]
    shl edx, 6
    or ecx, ebp
    mov dword ptr [ebx], ecx
    mov word ptr [eax + 12], dx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov dword ptr [esp + 40], edx
    mov ecx, edx
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [esp + 48]
    mov word ptr [eax + 14], dx
    add eax, 16
    dec ecx
    mov dword ptr [esp + 48], ecx
    jne L3
    mov ebp, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 32]
L4:
    cmp edx, ecx
    jge L8
    sub ecx, edx
    mov dword ptr [esp + 48], ecx
L5:
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    movsx edx, dx
    mov ecx, edx
    sar ecx, 5
    lea ebx, [edi + ecx*4]
    mov ecx, edx
    and ecx, 31
    mov ebp, 1
    shl ebp, cl
    mov ecx, dword ptr [ebx]
    shl edx, 6
    add eax, 16
    or ecx, ebp
    mov dword ptr [ebx], ecx
    mov word ptr [eax - 4], dx
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 16], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 12], ecx
    mov ecx, dword ptr [esi]
    add ecx, 4
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax - 8], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [esp + 48]
    mov word ptr [eax - 2], dx
    dec ecx
    mov dword ptr [esp + 48], ecx
    jne L5
    mov ebp, dword ptr [esp + 16]
    jmp L8
L6:
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 48], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [eax + 52], ecx
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esi], ecx
    mov ecx, edx
    mov dword ptr [esp + 40], edx
    mov dword ptr [eax + 56], ecx
L7:
    add eax, 64
L8:
    mov ecx, dword ptr [esp + 20]
    movsx edx, word ptr [ebp + 2]
    inc ecx
    cmp ecx, edx
    mov dword ptr [esp + 20], ecx
    jl L2
L9:
    movsx eax, word ptr [ebp + 4]
    lea edi, [eax + 1]
    lea eax, [eax + eax*2 + 3]
    shl eax, 1
    push eax
    and edi, 0FFFFFFFEh
    call dword ptr [esp + 0x38]
    movsx ecx, word ptr [ebp + 4]
    mov dword ptr [ebp + 8], eax
    lea ecx, [ecx + ecx*2]
    add esp, 4
    xor eax, eax
    test ecx, ecx
    jle L11
L10:
    mov ecx, dword ptr [esi]
    mov dx, word ptr [ecx]
    add ecx, 2
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [ebp + 8]
    mov word ptr [ecx + eax*2], dx
    movsx ecx, word ptr [ebp + 4]
    inc eax
    lea edx, [ecx + ecx*2]
    cmp eax, edx
    jl L10
L11:
    movsx ecx, word ptr [ebp + 4]
    cmp edi, ecx
    je L12
    mov edx, dword ptr [ebp + 8]
    lea ecx, [edx + eax*2]
    mov dx, word ptr [ecx - 2]
    mov word ptr [ecx], dx
    mov ecx, dword ptr [ebp + 8]
    mov dx, word ptr [ecx + eax*2 - 2]
    lea ecx, [ecx + eax*2]
    mov word ptr [ecx + 2], dx
    mov ecx, dword ptr [ebp + 8]
    mov dx, word ptr [ecx + eax*2 - 2]
    mov word ptr [ecx + eax*2 + 4], dx
    inc word ptr [ebp + 4]
L12:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 20
    ret
FUN_1002d4a0 ENDP
END
