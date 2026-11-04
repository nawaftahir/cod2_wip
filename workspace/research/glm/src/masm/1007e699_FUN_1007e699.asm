.686
.MODEL FLAT, C
.CODE
FUN_1007e699 PROC
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
    jmp L32
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
    jbe L31
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
    jl L32
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
    jmp L31
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
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
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
    mov cx, word ptr [edi + 8]
    test cx, cx
    je L29
    cmp word ptr [esi], 3
    je L20
    movzx ebx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    jmp L21
L20:
    movzx ebx, word ptr [esi + 4]
    movzx eax, word ptr [esi + 6]
L21:
    test bl, 3
    je L29
    cmp cx, 1
    mov dword ptr [ebp - 16], 01010FDECh
    je L22
    mov dword ptr [ebp - 16], 01010FDDCh
L22:
    imul eax, dword ptr [ebp + 20]
    lea esi, [ebx + 3]
    and esi, 0FFFFFFFCh
    test eax, eax
    mov dword ptr [ebp + 16], eax
    jbe L28
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
L23:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 12], edi
    mov edx, ebx
    shl edx, 2
    sub eax, edi
    sub ecx, edx
    cmp esi, ebx
    mov dword ptr [ebp + 16], esi
    jbe L25
    mov edx, dword ptr [ebp - 12]
L24:
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
    ja L24
L25:
    test ebx, ebx
    jbe L27
    mov edx, eax
    mov dword ptr [ebp + 16], ecx
    mov dword ptr [ebp - 4], ebx
L26:
    sub dword ptr [ebp + 16], 4
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    sub edx, 4
    dec dword ptr [ebp - 4]
    mov dword ptr [edx], edi
    jne L26
L27:
    dec dword ptr [ebp - 20]
    jne L23
    mov edi, dword ptr [ebp + 8]
L28:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L29:
    mov eax, dword ptr [edi + 44]
    imul eax, dword ptr [ebp + 20]
    movzx ecx, word ptr [edi + 12]
    cmp eax, ecx
    jbe L30
    mov eax, ecx
L30:
    push eax
    push dword ptr [ebp - 8]
    movzx eax, word ptr [edi + 10]
    push dword ptr [ebp - 4]
    add eax, dword ptr [ebp + 24]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [edi + 0x1c]
    test eax, eax
    jl L32
L31:
    xor eax, eax
L32:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007e699 ENDP
END
