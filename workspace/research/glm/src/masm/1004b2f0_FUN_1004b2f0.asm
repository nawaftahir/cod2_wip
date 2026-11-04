.686
.MODEL FLAT, C
.CODE
FUN_1004b2f0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 00000010Ch
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 000000190h]
    mov ecx, dword ptr [esi + 000000084h]
    mov dword ptr [esp + 104], eax
    mov eax, dword ptr [esi + 000000124h]
    dec eax
    mov dword ptr [esp + 000000088h], eax
    cmp ecx, dword ptr [esi + 00000008Ch]
    push edi
    jg L2
    jmp L0
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [esi + 000000198h]
    mov cl, byte ptr [eax + 17]
    test cl, cl
    jne L2
    mov edx, dword ptr [esi + 000000084h]
    cmp edx, dword ptr [esi + 00000008Ch]
    jne L1
    mov ebx, dword ptr [esi + 000000174h]
    mov edi, dword ptr [esi + 000000090h]
    mov edx, dword ptr [esi + 000000088h]
    xor ecx, ecx
    test ebx, ebx
    sete cl
    add ecx, edi
    cmp edx, ecx
    ja L2
L1:
    push esi
    call dword ptr [eax]
    add esp, 4
    test eax, eax
    je L4
    mov edx, dword ptr [esi + 000000084h]
    cmp edx, dword ptr [esi + 00000008Ch]
    jle L0
L2:
    mov eax, dword ptr [esi + 0000000CCh]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [esi + 44]
    test eax, eax
    mov dword ptr [esp + 84], 0
    jle L38
    mov ecx, dword ptr [esp + 108]
    mov eax, 0FFFFFFB8h
    lea edx, [ecx + 72]
    sub eax, ecx
    mov dword ptr [esp + 92], 0
    mov dword ptr [esp + 48], edx
    mov dword ptr [esp + 000000094h], eax
L3:
    mov eax, dword ptr [esp + 20]
    mov cl, byte ptr [eax + 48]
    test cl, cl
    je L37
    mov edi, dword ptr [ebp + 8]
    mov esi, dword ptr [edi + 000000090h]
    cmp esi, dword ptr [esp + 00000008Ch]
    mov ebx, dword ptr [esp + 20]
    mov ecx, dword ptr [ebx + 12]
    jae L5
    mov eax, ecx
    mov dword ptr [esp + 24], eax
    add eax, eax
    mov byte ptr [esp + 18], 0
    jmp L7
L4:
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L5:
    mov eax, dword ptr [ebx + 32]
    xor edx, edx
    div ecx
    mov eax, edx
    test eax, eax
    mov dword ptr [esp + 24], eax
    jne L6
    mov dword ptr [esp + 24], ecx
    mov eax, ecx
L6:
    mov byte ptr [esp + 18], 1
L7:
    test esi, esi
    push 0
    jbe L8
    mov edx, dword ptr [edi + 4]
    add eax, ecx
    dec esi
    imul esi, ecx
    push eax
    push esi
    mov esi, dword ptr [esp + 60]
    mov eax, dword ptr [esi]
    push eax
    push edi
    call dword ptr [edx + 0x20]
    mov ecx, dword ptr [ebx + 12]
    lea edx, [eax + ecx*4]
    mov dword ptr [esp + 00000009Ch], edx
    mov byte ptr [esp + 39], 0
    jmp L9
L8:
    mov esi, dword ptr [esp + 52]
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [edi + 4]
    push eax
    push 0
    push edx
    push edi
    call dword ptr [ecx + 0x20]
    mov dword ptr [esp + 00000009Ch], eax
    mov byte ptr [esp + 39], 1
L9:
    mov eax, dword ptr [esp + 000000080h]
    mov eax, dword ptr [eax + 112]
    add eax, dword ptr [esp + 112]
    mov dword ptr [esp + 48], eax
    mov eax, dword ptr [ebx + 76]
    movzx ecx, word ptr [eax]
    movzx edx, word ptr [eax + 2]
    mov dword ptr [esp + 52], ecx
    movzx ecx, word ptr [eax + 16]
    mov dword ptr [esp + 116], edx
    movzx edx, word ptr [eax + 32]
    mov dword ptr [esp + 000000098h], ecx
    movzx ecx, word ptr [eax + 18]
    mov dword ptr [esp + 000000088h], edx
    movzx edx, word ptr [eax + 4]
    mov eax, dword ptr [edi + 0000001A4h]
    mov dword ptr [esp + 000000094h], ecx
    add eax, dword ptr [esp + 0000000A8h]
    mov ecx, dword ptr [eax + esi + 4]
    mov eax, dword ptr [esp + 104]
    mov dword ptr [esp + 000000090h], edx
    mov edx, dword ptr [ebp + 12]
    mov dword ptr [esp + 0000000A4h], ecx
    mov ecx, dword ptr [edx + eax*4]
    mov eax, dword ptr [esp + 44]
    add esp, 20
    test eax, eax
    mov dword ptr [esp + 52], ecx
    mov dword ptr [esp + 76], 0
    jle L37
    lea ebx, [ebx]
L10:
    mov edx, dword ptr [esp + 000000088h]
    mov eax, dword ptr [esp + 76]
    mov cl, byte ptr [esp + 19]
    test cl, cl
    mov esi, dword ptr [edx + eax*4]
    mov dword ptr [esp + 80], esi
    je L11
    test eax, eax
    mov ecx, esi
    je L12
L11:
    mov ecx, dword ptr [edx + eax*4 - 4]
L12:
    mov bl, byte ptr [esp + 18]
    test bl, bl
    je L13
    mov edi, dword ptr [esp + 24]
    dec edi
    cmp eax, edi
    jne L13
    mov eax, esi
    jmp L14
L13:
    mov eax, dword ptr [edx + eax*4 + 4]
L14:
    movsx edx, word ptr [ecx]
    movsx ebx, word ptr [esi]
    mov dword ptr [esp + 68], edx
    mov dword ptr [esp + 44], edx
    mov dword ptr [esp + 100], edx
    movsx edx, word ptr [eax]
    mov dword ptr [esp + 64], edx
    mov dword ptr [esp + 40], edx
    mov dword ptr [esp + 104], edx
    mov edx, dword ptr [esp + 20]
    mov edx, dword ptr [edx + 28]
    xor esi, esi
    dec edx
    add eax, 000000080h
    add ecx, 000000080h
    mov dword ptr [esp + 36], ebx
    mov dword ptr [esp + 88], ebx
    mov dword ptr [esp + 112], esi
    mov dword ptr [esp + 120], edx
    mov dword ptr [esp + 60], esi
    mov dword ptr [esp + 56], eax
    mov dword ptr [esp + 72], ecx
    nop
L15:
    mov eax, dword ptr [esp + 80]
    mov edx, dword ptr [esp + 60]
    mov ecx, 32
    mov esi, eax
    lea edi, [esp + 000000098h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 120]
    cmp edx, ecx
    jae L16
    mov edx, dword ptr [esp + 72]
    movsx ecx, word ptr [edx]
    mov edx, dword ptr [esp + 56]
    movsx ebx, word ptr [eax + 000000080h]
    movsx eax, word ptr [edx]
    mov dword ptr [esp + 68], ecx
    mov dword ptr [esp + 64], eax
L16:
    mov ecx, dword ptr [esp + 28]
    mov ecx, dword ptr [ecx + 4]
    test ecx, ecx
    je L20
    cmp word ptr [esp + 00000009Ah], 0
    jne L20
    mov eax, dword ptr [esp + 88]
    mov esi, dword ptr [esp + 96]
    sub eax, ebx
    imul eax, dword ptr [esp + 32]
    lea edx, [eax + eax*8]
    mov eax, esi
    shl edx, 2
    shl esi, 8
    shl eax, 7
    test edx, edx
    jl L17
    add eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L19
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L19
    lea eax, [edx - 1]
    jmp L19
L17:
    sub eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L18
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L18
    lea eax, [edx - 1]
L18:
    neg eax
L19:
    mov word ptr [esp + 00000009Ah], ax
L20:
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [edx + 8]
    test ecx, ecx
    je L24
    cmp word ptr [esp + 0000000A8h], 0
    jne L24
    mov eax, dword ptr [esp + 44]
    mov edi, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 000000084h]
    sub eax, edi
    imul eax, dword ptr [esp + 32]
    lea edx, [eax + eax*8]
    mov eax, esi
    shl edx, 2
    shl esi, 8
    shl eax, 7
    test edx, edx
    jl L21
    add eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L23
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L23
    lea eax, [edx - 1]
    jmp L23
L21:
    sub eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L22
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L22
    lea eax, [edx - 1]
L22:
    neg eax
L23:
    mov word ptr [esp + 0000000A8h], ax
L24:
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [eax + 12]
    test ecx, ecx
    je L28
    cmp word ptr [esp + 0000000B8h], 0
    jne L28
    mov edx, dword ptr [esp + 36]
    mov esi, dword ptr [esp + 116]
    lea eax, [edx + edx]
    mov edx, eax
    mov eax, dword ptr [esp + 40]
    sub eax, edx
    add eax, dword ptr [esp + 44]
    imul eax, dword ptr [esp + 32]
    lea edx, [eax + eax*8]
    mov eax, esi
    shl esi, 8
    shl eax, 7
    test edx, edx
    jl L25
    add eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L27
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L27
    lea eax, [edx - 1]
    jmp L27
L25:
    sub eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L26
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L26
    lea eax, [edx - 1]
L26:
    neg eax
L27:
    mov word ptr [esp + 0000000B8h], ax
L28:
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [eax + 16]
    test ecx, ecx
    je L32
    cmp word ptr [esp + 0000000AAh], 0
    jne L32
    mov eax, dword ptr [esp + 64]
    mov edi, dword ptr [esp + 104]
    mov esi, dword ptr [esp + 68]
    mov edx, dword ptr [esp + 100]
    sub eax, edi
    sub eax, esi
    mov esi, dword ptr [esp + 000000080h]
    add eax, edx
    imul eax, dword ptr [esp + 32]
    lea edx, [eax + eax*4]
    mov eax, esi
    shl esi, 8
    shl eax, 7
    test edx, edx
    jl L29
    add eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L31
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L31
    lea eax, [edx - 1]
    jmp L31
L29:
    sub eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L30
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L30
    lea eax, [edx - 1]
L30:
    neg eax
L31:
    mov word ptr [esp + 0000000AAh], ax
L32:
    mov ecx, dword ptr [esp + 28]
    mov ecx, dword ptr [ecx + 20]
    test ecx, ecx
    je L36
    cmp word ptr [esp + 00000009Ch], 0
    jne L36
    mov edx, dword ptr [esp + 36]
    mov esi, dword ptr [esp + 124]
    lea eax, [edx + edx]
    mov edx, eax
    mov eax, ebx
    sub eax, edx
    add eax, dword ptr [esp + 88]
    imul eax, dword ptr [esp + 32]
    lea edx, [eax + eax*8]
    mov eax, esi
    shl esi, 8
    shl eax, 7
    test edx, edx
    jl L33
    add eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L35
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L35
    lea eax, [edx - 1]
    jmp L35
L33:
    sub eax, edx
    cdq
    idiv esi
    test ecx, ecx
    jle L34
    mov edx, 1
    shl edx, cl
    cmp eax, edx
    jl L34
    lea eax, [edx - 1]
L34:
    neg eax
L35:
    mov word ptr [esp + 00000009Ch], ax
L36:
    mov esi, dword ptr [esp + 112]
    mov eax, dword ptr [esp + 52]
    mov edi, dword ptr [esp + 20]
    mov edx, dword ptr [ebp + 8]
    push esi
    push eax
    lea ecx, [esp + 0000000A0h]
    push ecx
    push edi
    push edx
    call dword ptr [esp + 0xa4]
    mov eax, dword ptr [esp + 64]
    mov ecx, dword ptr [esp + 88]
    mov edx, dword ptr [esp + 56]
    mov dword ptr [esp + 64], ecx
    mov ecx, dword ptr [esp + 84]
    mov dword ptr [esp + 120], eax
    mov eax, dword ptr [esp + 60]
    mov dword ptr [esp + 60], ecx
    mov ecx, dword ptr [esp + 100]
    mov dword ptr [esp + 124], eax
    mov eax, 000000080h
    add ecx, eax
    mov dword ptr [esp + 100], ecx
    mov ecx, dword ptr [esp + 76]
    add ecx, eax
    mov dword ptr [esp + 108], edx
    mov edx, dword ptr [esp + 92]
    add edx, eax
    add esi, dword ptr [edi + 36]
    mov eax, dword ptr [esp + 80]
    add esp, 20
    mov dword ptr [esp + 56], ecx
    mov ecx, dword ptr [esp + 120]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 36], ebx
    mov dword ptr [esp + 72], edx
    mov dword ptr [esp + 112], esi
    mov dword ptr [esp + 60], eax
    jbe L15
    mov eax, dword ptr [esp + 52]
    mov edx, dword ptr [edi + 36]
    lea ecx, [eax + edx*4]
    mov eax, dword ptr [esp + 76]
    mov dword ptr [esp + 52], ecx
    mov ecx, dword ptr [esp + 24]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 76], eax
    jl L10
L37:
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 84]
    mov edi, dword ptr [esp + 92]
    mov esi, dword ptr [esp + 48]
    add edx, 84
    mov dword ptr [esp + 20], edx
    mov edx, dword ptr [ebp + 8]
    mov ecx, dword ptr [edx + 44]
    inc eax
    add edi, 24
    add esi, 4
    cmp eax, ecx
    mov dword ptr [esp + 84], eax
    mov dword ptr [esp + 92], edi
    mov dword ptr [esp + 48], esi
    jl L3
L38:
    mov ecx, dword ptr [ebp + 8]
    mov esi, dword ptr [ecx + 000000090h]
    mov edx, dword ptr [ecx + 000000124h]
    inc esi
    mov eax, esi
    cmp eax, edx
    pop edi
    mov dword ptr [ecx + 000000090h], esi
    sbb eax, eax
    pop esi
FUN_1004b2f0 ENDP
END
