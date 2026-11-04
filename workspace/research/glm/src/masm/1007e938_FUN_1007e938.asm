.686
.MODEL FLAT, C
.CODE
FUN_1007e938 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 32]
    mov esi, dword ptr [edi + 24]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 4], eax
    movzx eax, word ptr [esi]
    xor ecx, ecx
    sub eax, ecx
    je L18
    dec eax
    je L16
    dec eax
    je L15
    dec eax
    je L7
    dec eax
    dec eax
    je L1
    mov eax, 080004001h
    jmp L40
L1:
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div dword ptr [edi + 52]
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L2
    mov dword ptr [ebp + 20], eax
L2:
    cmp dword ptr [ebp + 20], ecx
    mov dword ptr [ebp + 8], ecx
    jbe L39
    jmp L4
L3:
    xor ecx, ecx
L4:
    cmp word ptr [esi + 10], cx
    mov dword ptr [ebp + 16], ecx
    jbe L6
L5:
    push dword ptr [ebp + 24]
    mov eax, dword ptr [edi + 56]
    mov ecx, dword ptr [ebp + 16]
    mov ebx, dword ptr [eax + ecx*4]
    push dword ptr [ebx + 48]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 12]
    push edi
    call L0
    test eax, eax
    jl L40
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebx + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebx + 40]
    add dword ptr [ebp + 24], eax
    movzx eax, word ptr [esi + 10]
    inc dword ptr [ebp + 16]
    cmp dword ptr [ebp + 16], eax
    jb L5
L6:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebp + 20]
    jb L3
    jmp L39
L7:
    movzx ecx, word ptr [esi + 4]
    movzx eax, word ptr [esi + 6]
    mov ebx, ecx
    imul ebx, eax
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div ebx
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L8
    mov dword ptr [ebp + 20], eax
L8:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ebp + 20], 0
    mov edx, dword ptr [ebp - 8]
    jbe L14
L9:
    movzx eax, word ptr [esi + 6]
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L13
L10:
    xor eax, eax
    test ecx, ecx
    jbe L12
L11:
    imul ecx, dword ptr [ebp - 12]
    movzx ebx, word ptr [esi + 6]
    add ecx, eax
    imul ecx, ebx
    add ecx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebx + ecx*4]
    mov dword ptr [edx], ecx
    movzx ecx, word ptr [esi + 4]
    add edx, 4
    inc eax
    cmp eax, ecx
    jb L11
L12:
    movzx eax, word ptr [esi + 6]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], eax
    jb L10
L13:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp + 20]
    jb L9
L14:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
    jmp L20
L15:
    movzx ecx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    imul ecx, eax
    jmp L17
L16:
    movzx ecx, word ptr [esi + 6]
L17:
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div ecx
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jmp L19
L18:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ebp + 20], ecx
    cmp ecx, eax
L19:
    jbe L20
    mov dword ptr [ebp + 20], eax
L20:
    mov cx, word ptr [esi + 2]
    cmp cx, 1
    je L27
    mov eax, dword ptr [edi + 52]
    imul eax, dword ptr [ebp + 20]
    movzx ecx, cx
    dec ecx
    je L26
    dec ecx
    je L24
    dec ecx
    jne L26
    test eax, eax
    jbe L26
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 4]
    sub edx, ecx
L21:
    cmp dword ptr [edx + ecx], 0
    je L22
    fld1
    jmp L23
L22:
    fldz
L23:
    fstp dword ptr [ecx]
    add ecx, 4
    dec eax
    jne L21
    jmp L26
L24:
    test eax, eax
    jbe L26
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 4]
    sub edx, ecx
L25:
    xor ebx, ebx
    cmp dword ptr [ecx + edx], ebx
    setne bl
    mov dword ptr [ecx], ebx
    add ecx, 4
    dec eax
    jne L25
L26:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L27:
    mov cx, word ptr [edi + 8]
    test cx, cx
    je L37
    cmp word ptr [esi], 3
    je L28
    movzx ebx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    jmp L29
L28:
    movzx ebx, word ptr [esi + 4]
    movzx eax, word ptr [esi + 6]
L29:
    test bl, 3
    je L37
    cmp cx, 1
    mov dword ptr [ebp - 16], 01010FE0Ch
    je L30
    mov dword ptr [ebp - 16], 01010FDFCh
L30:
    imul eax, dword ptr [ebp + 20]
    lea esi, [ebx + 3]
    and esi, 0FFFFFFFCh
    test eax, eax
    mov dword ptr [ebp + 16], eax
    jbe L36
    mov edi, dword ptr [ebp - 8]
    lea edx, [eax*4 + 4]
    imul eax, esi
    mov ecx, edx
    imul edx, esi
    imul ecx, ebx
    add ecx, dword ptr [ebp - 4]
    add eax, ebx
    add edx, edi
    mov dword ptr [ebp - 12], edx
    mov edx, dword ptr [ebp + 16]
    lea eax, [edi + eax*4]
    mov dword ptr [ebp - 20], edx
L31:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 12], edi
    mov edx, ebx
    shl edx, 2
    sub eax, edi
    sub ecx, edx
    cmp esi, ebx
    mov dword ptr [ebp + 16], esi
    jbe L33
    mov edx, dword ptr [ebp - 12]
L32:
    dec dword ptr [ebp + 16]
    mov edi, dword ptr [ebp - 16]
    sub edx, 4
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [ebp + 16]
    and edx, 3
    cmp dword ptr [ebp + 16], ebx
    mov edi, dword ptr [edi + edx*4]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [edx], edi
    ja L32
L33:
    test ebx, ebx
    jbe L35
    mov edx, eax
    mov dword ptr [ebp + 16], ecx
    mov dword ptr [ebp - 4], ebx
L34:
    sub dword ptr [ebp + 16], 4
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    sub edx, 4
    dec dword ptr [ebp - 4]
    mov dword ptr [edx], edi
    jne L34
L35:
    dec dword ptr [ebp - 20]
    jne L31
    mov edi, dword ptr [ebp + 8]
L36:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L37:
    mov eax, dword ptr [edi + 44]
    imul eax, dword ptr [ebp + 20]
    movzx ecx, word ptr [edi + 12]
    cmp eax, ecx
    jbe L38
    mov eax, ecx
L38:
    push eax
    push dword ptr [ebp - 8]
    movzx eax, word ptr [edi + 10]
    push dword ptr [ebp - 4]
    add eax, dword ptr [ebp + 24]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [edi + 0x1c]
    test eax, eax
    jl L40
L39:
    xor eax, eax
L40:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007e938 ENDP
END
