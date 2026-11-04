.686
.MODEL FLAT, C
.CODE
FUN_1007ec3a PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    mov eax, dword ptr [ebp + 16]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov esi, dword ptr [edi + 24]
    mov ebx, dword ptr [edi + 32]
    mov dword ptr [ebp - 4], eax
    movzx eax, word ptr [esi]
    sub eax, 0
    mov dword ptr [ebp - 8], ebx
    je L17
    dec eax
    je L15
    dec eax
    je L14
    dec eax
    je L6
    dec eax
    dec eax
    je L1
    mov eax, 080004001h
    jmp L37
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
    and dword ptr [ebp + 8], 0
    cmp dword ptr [ebp + 20], 0
    jbe L36
L3:
    and dword ptr [ebp + 16], 0
    cmp word ptr [esi + 10], 0
    jbe L5
L4:
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
    jl L37
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebx + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebx + 40]
    add dword ptr [ebp + 24], eax
    movzx eax, word ptr [esi + 10]
    inc dword ptr [ebp + 16]
    cmp dword ptr [ebp + 16], eax
    jb L4
L5:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebp + 20]
    jb L3
    jmp L36
L6:
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
    jbe L7
    mov dword ptr [ebp + 20], eax
L7:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ebp + 20], 0
    mov edx, dword ptr [ebp - 8]
    jbe L13
L8:
    movzx eax, word ptr [esi + 6]
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L12
L9:
    xor eax, eax
    test ecx, ecx
    jbe L11
L10:
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
    jb L10
L11:
    movzx eax, word ptr [esi + 6]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], eax
    jb L9
L12:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp + 20]
    jb L8
L13:
    mov ebx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], ebx
    jmp L19
L14:
    movzx ecx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    imul ecx, eax
    jmp L16
L15:
    movzx ecx, word ptr [esi + 6]
L16:
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div ecx
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jmp L18
L17:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ebp + 20], ecx
    cmp ecx, eax
L18:
    jbe L19
    mov dword ptr [ebp + 20], eax
L19:
    mov cx, word ptr [esi + 2]
    cmp cx, 2
    je L24
    mov eax, dword ptr [edi + 52]
    imul eax, dword ptr [ebp + 20]
    movzx ecx, cx
    dec ecx
    je L21
    dec ecx
    je L23
    dec ecx
    jne L23
    test eax, eax
    jbe L23
    mov edx, dword ptr [ebp - 4]
    mov ecx, ebx
    sub edx, ebx
L20:
    fild dword ptr [edx + ecx]
    fstp dword ptr [ecx]
    add ecx, 4
    dec eax
    jne L20
    jmp L23
L21:
    test eax, eax
    jbe L23
    mov edx, dword ptr [ebp - 4]
    mov ecx, ebx
    sub edx, ebx
L22:
    xor ebx, ebx
    cmp dword ptr [ecx + edx], ebx
    setne bl
    mov dword ptr [ecx], ebx
    add ecx, 4
    dec eax
    jne L22
L23:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L24:
    mov cx, word ptr [edi + 8]
    test cx, cx
    je L34
    cmp word ptr [esi], 3
    je L25
    movzx ebx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    jmp L26
L25:
    movzx ebx, word ptr [esi + 4]
    movzx eax, word ptr [esi + 6]
L26:
    test bl, 3
    je L34
    cmp cx, 1
    mov dword ptr [ebp - 16], 01010FE2Ch
    je L27
    mov dword ptr [ebp - 16], 01010FE1Ch
L27:
    imul eax, dword ptr [ebp + 20]
    lea esi, [ebx + 3]
    and esi, 0FFFFFFFCh
    test eax, eax
    mov dword ptr [ebp + 16], eax
    jbe L33
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
L28:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 12], edi
    mov edx, ebx
    shl edx, 2
    sub eax, edi
    sub ecx, edx
    cmp esi, ebx
    mov dword ptr [ebp + 16], esi
    jbe L30
    mov edx, dword ptr [ebp - 12]
L29:
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
    ja L29
L30:
    test ebx, ebx
    jbe L32
    mov edx, eax
    mov dword ptr [ebp + 16], ecx
    mov dword ptr [ebp - 4], ebx
L31:
    sub dword ptr [ebp + 16], 4
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    sub edx, 4
    dec dword ptr [ebp - 4]
    mov dword ptr [edx], edi
    jne L31
L32:
    dec dword ptr [ebp - 20]
    jne L28
    mov edi, dword ptr [ebp + 8]
L33:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L34:
    mov eax, dword ptr [edi + 44]
    imul eax, dword ptr [ebp + 20]
    movzx ecx, word ptr [edi + 12]
    cmp eax, ecx
    jbe L35
    mov eax, ecx
L35:
    push eax
    push dword ptr [ebp - 8]
    movzx eax, word ptr [edi + 10]
    push dword ptr [ebp - 4]
    add eax, dword ptr [ebp + 24]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [edi + 0x1c]
    test eax, eax
    jl L37
L36:
    xor eax, eax
L37:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007ec3a ENDP
END
