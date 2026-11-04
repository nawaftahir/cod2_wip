.686
.MODEL FLAT, C
.CODE
FUN_10054870 PROC
    sub esp, 68
    mov eax, dword ptr [esp + 72]
    mov eax, dword ptr [eax + 000000128h]
    mov ecx, dword ptr [esp + 76]
    mov ecx, dword ptr [ecx + 80]
    push ebx
    push ebp
    push esi
    add eax, 000000080h
    push edi
    mov edi, 6
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 96]
    lea edx, [esp + 20]
    mov dword ptr [esp + 88], edi
L0:
    lea esi, [edi + 2]
    cmp esi, 6
    je L3
    cmp esi, 4
    je L3
    cmp esi, 2
    je L3
    mov bx, word ptr [eax + 16]
    test bx, bx
    jne L1
    cmp word ptr [eax + 48], bx
    jne L1
    cmp word ptr [eax + 80], bx
    jne L1
    cmp word ptr [eax + 112], bx
    jne L1
    movsx esi, word ptr [eax]
    imul esi, dword ptr [ecx]
    shl esi, 2
    mov dword ptr [edx], esi
    jmp L2
L1:
    movsx ebp, word ptr [eax + 48]
    imul ebp, dword ptr [ecx + 96]
    movsx edi, word ptr [eax + 80]
    imul ebp, ebp, 0000028BAh
    imul edi, dword ptr [ecx + 0000000A0h]
    movsx esi, word ptr [eax]
    imul edi, edi, 000001B37h
    imul esi, dword ptr [ecx]
    sub edi, ebp
    movsx ebp, word ptr [eax + 112]
    imul ebp, dword ptr [ecx + 0000000E0h]
    movsx ebx, bx
    imul ebp, ebp, 000001712h
    imul ebx, dword ptr [ecx + 32]
    imul ebx, ebx, 0000073FCh
    sub edi, ebp
    add edi, ebx
    shl esi, 15
    lea ebx, [edi + esi + 000001000h]
    sub esi, edi
    mov edi, dword ptr [esp + 88]
    sar ebx, 13
    add esi, 000001000h
    mov dword ptr [edx], ebx
    sar esi, 13
L2:
    mov dword ptr [edx + 32], esi
L3:
    lea esi, [edi + 1]
    add eax, 2
    add ecx, 4
    add edx, 4
    cmp esi, 6
    je L6
    cmp esi, 4
    je L6
    cmp esi, 2
    je L6
    mov bx, word ptr [eax + 16]
    test bx, bx
    jne L4
    cmp word ptr [eax + 48], bx
    jne L4
    cmp word ptr [eax + 80], bx
    jne L4
    cmp word ptr [eax + 112], bx
    jne L4
    movsx esi, word ptr [eax]
    imul esi, dword ptr [ecx]
    shl esi, 2
    mov dword ptr [edx], esi
    jmp L5
L4:
    movsx ebp, word ptr [eax + 48]
    imul ebp, dword ptr [ecx + 96]
    movsx edi, word ptr [eax + 80]
    imul ebp, ebp, 0000028BAh
    imul edi, dword ptr [ecx + 0000000A0h]
    movsx esi, word ptr [eax]
    imul edi, edi, 000001B37h
    imul esi, dword ptr [ecx]
    sub edi, ebp
    movsx ebp, word ptr [eax + 112]
    imul ebp, dword ptr [ecx + 0000000E0h]
    movsx ebx, bx
    imul ebp, ebp, 000001712h
    imul ebx, dword ptr [ecx + 32]
    imul ebx, ebx, 0000073FCh
    sub edi, ebp
    add edi, ebx
    shl esi, 15
    lea ebx, [edi + esi + 000001000h]
    sub esi, edi
    mov edi, dword ptr [esp + 88]
    sar ebx, 13
    add esi, 000001000h
    mov dword ptr [edx], ebx
    sar esi, 13
L5:
    mov dword ptr [edx + 32], esi
L6:
    add eax, 2
    add ecx, 4
    add edx, 4
    cmp edi, 6
    je L9
    cmp edi, 4
    je L9
    cmp edi, 2
    je L9
    mov bx, word ptr [eax + 16]
    test bx, bx
    jne L7
    cmp word ptr [eax + 48], bx
    jne L7
    cmp word ptr [eax + 80], bx
    jne L7
    cmp word ptr [eax + 112], bx
    jne L7
    movsx esi, word ptr [eax]
    imul esi, dword ptr [ecx]
    shl esi, 2
    mov dword ptr [edx], esi
    jmp L8
L7:
    movsx ebp, word ptr [eax + 48]
    imul ebp, dword ptr [ecx + 96]
    movsx edi, word ptr [eax + 80]
    imul ebp, ebp, 0000028BAh
    imul edi, dword ptr [ecx + 0000000A0h]
    movsx esi, word ptr [eax]
    imul edi, edi, 000001B37h
    imul esi, dword ptr [ecx]
    sub edi, ebp
    movsx ebp, word ptr [eax + 112]
    imul ebp, dword ptr [ecx + 0000000E0h]
    movsx ebx, bx
    imul ebp, ebp, 000001712h
    imul ebx, dword ptr [ecx + 32]
    imul ebx, ebx, 0000073FCh
    sub edi, ebp
    add edi, ebx
    shl esi, 15
    lea ebx, [edi + esi + 000001000h]
    sub esi, edi
    mov edi, dword ptr [esp + 88]
    sar ebx, 13
    add esi, 000001000h
    mov dword ptr [edx], ebx
    sar esi, 13
L8:
    mov dword ptr [edx + 32], esi
L9:
    lea esi, [edi - 1]
    add eax, 2
    add ecx, 4
    add edx, 4
    cmp esi, 6
    je L12
    cmp esi, 4
    je L12
    cmp esi, 2
    je L12
    mov bx, word ptr [eax + 16]
    test bx, bx
    jne L10
    cmp word ptr [eax + 48], bx
    jne L10
    cmp word ptr [eax + 80], bx
    jne L10
    cmp word ptr [eax + 112], bx
    jne L10
    movsx esi, word ptr [eax]
    imul esi, dword ptr [ecx]
    shl esi, 2
    mov dword ptr [edx], esi
    jmp L11
L10:
    movsx ebp, word ptr [eax + 48]
    imul ebp, dword ptr [ecx + 96]
    movsx edi, word ptr [eax + 80]
    imul ebp, ebp, 0000028BAh
    imul edi, dword ptr [ecx + 0000000A0h]
    movsx esi, word ptr [eax]
    imul edi, edi, 000001B37h
    imul esi, dword ptr [ecx]
    sub edi, ebp
    movsx ebp, word ptr [eax + 112]
    imul ebp, dword ptr [ecx + 0000000E0h]
    movsx ebx, bx
    imul ebp, ebp, 000001712h
    imul ebx, dword ptr [ecx + 32]
    imul ebx, ebx, 0000073FCh
    sub edi, ebp
    add edi, ebx
    shl esi, 15
    lea ebx, [edi + esi + 000001000h]
    sub esi, edi
    mov edi, dword ptr [esp + 88]
    sar ebx, 13
    add esi, 000001000h
    mov dword ptr [edx], ebx
    sar esi, 13
L11:
    mov dword ptr [edx + 32], esi
L12:
    sub edi, 4
    lea esi, [edi + 2]
    add eax, 2
    add ecx, 4
    add edx, 4
    test esi, esi
    mov dword ptr [esp + 88], edi
    jg L0
    mov ebp, dword ptr [esp + 100]
    mov ecx, dword ptr [esp + 104]
    mov edx, dword ptr [ebp]
    mov esi, dword ptr [esp + 48]
    mov edi, dword ptr [esp + 40]
    mov ebx, dword ptr [esp + 32]
    add edx, ecx
    mov ecx, dword ptr [esp + 24]
    test ecx, ecx
    jne L13
    test ebx, ebx
    jne L13
    test edi, edi
    jne L13
    test esi, esi
    jne L13
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 16]
    add eax, 16
    sar eax, 5
    and eax, 0000003FFh
    mov al, byte ptr [eax + ecx]
    mov byte ptr [edx], al
    jmp L14
L13:
    mov eax, dword ptr [esp + 20]
    imul ecx, ecx, 0000073FCh
    imul ebx, ebx, 0000028BAh
    imul edi, edi, 000001B37h
    imul esi, esi, 000001712h
    sub ecx, ebx
    add ecx, edi
    mov edi, dword ptr [esp + 16]
    sub ecx, esi
    shl eax, 15
    mov esi, ecx
    lea ecx, [esi + eax + 000080000h]
    sub eax, esi
    sar ecx, 20
    add eax, 000080000h
    and ecx, 0000003FFh
    mov cl, byte ptr [ecx + edi]
    sar eax, 20
    and eax, 0000003FFh
    mov byte ptr [edx], cl
    mov al, byte ptr [eax + edi]
L14:
    mov ecx, dword ptr [esp + 104]
    mov esi, dword ptr [esp + 80]
    mov edi, dword ptr [esp + 72]
    mov ebx, dword ptr [esp + 64]
    mov byte ptr [edx + 1], al
    mov edx, dword ptr [ebp + 4]
    add edx, ecx
    mov ecx, dword ptr [esp + 56]
    test ecx, ecx
    jne L15
    test ebx, ebx
    jne L15
    test edi, edi
    jne L15
    test esi, esi
    jne L15
    mov ecx, dword ptr [esp + 52]
    mov eax, dword ptr [esp + 16]
    add ecx, 16
    pop edi
    sar ecx, 5
    pop esi
    and ecx, 0000003FFh
    mov al, byte ptr [ecx + eax]
    pop ebp
    mov byte ptr [edx], al
    mov byte ptr [edx + 1], al
    pop ebx
    add esp, 68
    ret
L15:
    mov eax, dword ptr [esp + 52]
    imul ecx, ecx, 0000073FCh
    imul edi, edi, 000001B37h
    imul esi, esi, 000001712h
    imul ebx, ebx, 0000028BAh
    add ecx, edi
    mov edi, dword ptr [esp + 16]
    sub ecx, esi
    sub ecx, ebx
    shl eax, 15
    mov esi, ecx
    lea ecx, [esi + eax + 000080000h]
    sub eax, esi
    sar ecx, 20
    add eax, 000080000h
    and ecx, 0000003FFh
    mov cl, byte ptr [ecx + edi]
    sar eax, 20
    and eax, 0000003FFh
    mov byte ptr [edx], cl
    mov al, byte ptr [eax + edi]
    pop edi
    pop esi
    pop ebp
    mov byte ptr [edx + 1], al
    pop ebx
    add esp, 68
    ret
FUN_10054870 ENDP
END
