.686
.MODEL FLAT, C
EXTRN sub_1007EFC7:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_1007f64e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    mov ecx, dword ptr [ebp + 8]
    push ebx
    mov ebx, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ecx + 24]
    movzx eax, word ptr [esi]
    sub eax, 0
    push edi
    mov edi, dword ptr [ecx + 32]
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 8], ebx
    je L34
    dec eax
    je L27
    dec eax
    je L17
    dec eax
    je L5
    dec eax
    dec eax
    je L0
    mov eax, 080004001h
    jmp L56
L0:
    mov eax, dword ptr [ebp + 20]
    shl eax, 4
    xor edx, edx
    div dword ptr [ecx + 52]
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L1
    mov dword ptr [ebp + 20], eax
L1:
    and dword ptr [ebp + 16], 0
    cmp dword ptr [ebp + 20], 0
    jbe L55
L2:
    xor ebx, ebx
    cmp word ptr [esi + 10], bx
    jbe L4
L3:
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 24]
    mov ecx, dword ptr [eax + 56]
    mov edi, dword ptr [ecx + ebx*4]
    push dword ptr [edi + 48]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 12]
    push eax
    call sub_1007EFC7
    test eax, eax
    jl L56
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [edi + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [edi + 40]
    add dword ptr [ebp + 24], eax
    movzx eax, word ptr [esi + 10]
    inc ebx
    cmp ebx, eax
    jb L3
L4:
    inc dword ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ebp + 20]
    jb L2
    jmp L55
L5:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L6
    mov dword ptr [ebp + 20], eax
L6:
    mov dx, word ptr [esi + 4]
    cmp dx, 4
    jne L9
    cmp word ptr [esi + 6], dx
    jne L9
    cmp dword ptr [ebp + 20], 0
    jbe L8
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp + 16]
    lea ecx, [edx + 8]
    lea eax, [edi + 32]
    sub edx, edi
    mov edi, dword ptr [ebp + 20]
L7:
    mov ebx, dword ptr [eax - 32]
    mov dword ptr [ecx - 8], ebx
    mov ebx, dword ptr [eax - 16]
    mov dword ptr [ecx - 4], ebx
    mov ebx, dword ptr [eax]
    mov dword ptr [ecx], ebx
    mov ebx, dword ptr [eax + 16]
    mov dword ptr [ecx + 4], ebx
    mov ebx, dword ptr [eax - 28]
    mov dword ptr [ecx + 8], ebx
    mov ebx, dword ptr [eax - 12]
    mov dword ptr [ecx + 12], ebx
    mov ebx, dword ptr [eax + 4]
    mov dword ptr [ecx + 16], ebx
    mov ebx, dword ptr [eax + 20]
    mov dword ptr [ecx + 20], ebx
    fld dword ptr [eax - 24]
    fstp dword ptr [eax + edx]
    mov ebx, dword ptr [eax - 8]
    mov dword ptr [ecx + 28], ebx
    mov ebx, dword ptr [eax + 8]
    mov dword ptr [ecx + 32], ebx
    mov ebx, dword ptr [eax + 24]
    mov dword ptr [ecx + 36], ebx
    mov ebx, dword ptr [eax - 20]
    mov dword ptr [ecx + 40], ebx
    mov ebx, dword ptr [eax - 4]
    mov dword ptr [ecx + 44], ebx
    mov ebx, dword ptr [eax + 12]
    mov dword ptr [ecx + 48], ebx
    mov ebx, dword ptr [eax + 28]
    mov dword ptr [ecx + 52], ebx
    add eax, 64
    add ecx, 64
    dec edi
    jne L7
L8:
    mov ebx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], ebx
    jmp L35
L9:
    xor ebx, ebx
    cmp dword ptr [ebp + 20], ebx
    jbe L8
L10:
    and dword ptr [ebp - 8], 0
    cmp word ptr [esi + 6], 0
    jbe L16
    movzx eax, dx
L11:
    xor ecx, ecx
    test eax, eax
    jbe L15
L12:
    cmp ecx, 4
    ja L13
    mov eax, dword ptr [ebp - 8]
    cmp eax, 4
    ja L13
    lea edx, [ecx + ebx*4]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [ebp + 16]
    mov eax, dword ptr [edx + eax*4]
    jmp L14
L13:
    xor eax, eax
L14:
    mov dword ptr [edi], eax
    mov dx, word ptr [esi + 4]
    add edi, 4
    movzx eax, dx
    inc ecx
    cmp ecx, eax
    jb L12
L15:
    movzx ecx, word ptr [esi + 6]
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], ecx
    jb L11
L16:
    inc ebx
    cmp ebx, dword ptr [ebp + 20]
    jb L10
    jmp L8
L17:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L18
    mov dword ptr [ebp + 20], eax
L18:
    mov cx, word ptr [esi + 4]
    cmp cx, 4
    jne L19
    cmp word ptr [esi + 6], cx
    je L35
L19:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 20], 0
    mov edi, dword ptr [ebp - 4]
    jbe L8
L20:
    xor edx, edx
    test cx, cx
    jbe L26
    movzx eax, word ptr [esi + 6]
L21:
    xor ecx, ecx
    test eax, eax
    jbe L25
L22:
    cmp edx, 4
    ja L23
    cmp ecx, 4
    ja L23
    mov eax, dword ptr [ebp - 8]
    mov ebx, dword ptr [ebp + 16]
    lea eax, [edx + eax*4]
    lea eax, [ecx + eax*4]
    mov eax, dword ptr [ebx + eax*4]
    jmp L24
L23:
    xor eax, eax
L24:
    mov dword ptr [edi], eax
    movzx eax, word ptr [esi + 6]
    add edi, 4
    inc ecx
    cmp ecx, eax
    jb L22
L25:
    mov cx, word ptr [esi + 4]
    movzx ebx, cx
    inc edx
    cmp edx, ebx
    jb L21
L26:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 20]
    jb L20
    jmp L8
L27:
    mov ecx, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl ecx, 2
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L28
    mov dword ptr [ebp + 20], eax
L28:
    mov ax, word ptr [esi + 6]
    cmp ax, 4
    je L35
    mov edx, edi
    xor edi, edi
    cmp dword ptr [ebp + 20], edi
    jbe L8
    movzx eax, ax
L29:
    xor ecx, ecx
    test eax, eax
    jbe L33
L30:
    cmp ecx, 4
    jbe L31
    xor eax, eax
    jmp L32
L31:
    mov eax, edi
    shr eax, 2
    mov ebx, edi
    and ebx, 3
    lea eax, [ebx + eax*4]
    mov ebx, dword ptr [ebp + 16]
    lea eax, [ecx + eax*4]
    mov eax, dword ptr [ebx + eax*4]
L32:
    mov dword ptr [edx], eax
    movzx eax, word ptr [esi + 6]
    add edx, 4
    inc ecx
    cmp ecx, eax
    jb L30
L33:
    inc edi
    cmp edi, dword ptr [ebp + 20]
    jb L29
    jmp L8
L34:
    mov ecx, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl ecx, 4
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L35
    mov dword ptr [ebp + 20], eax
L35:
    mov ax, word ptr [esi + 2]
    cmp ax, 3
    je L43
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 52]
    imul ecx, dword ptr [ebp + 20]
    movzx eax, ax
    dec eax
    je L38
    dec eax
    jne L42
    fnstcw word ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    or eax, 000000C00h
    mov dword ptr [ebp - 20], eax
    fldcw word ptr [ebp - 20]
    test ecx, ecx
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], eax
    jbe L37
    mov eax, dword ptr [ebp - 4]
    mov edx, ebx
    sub edx, eax
L36:
    fld dword ptr [edx + eax]
    fstp dword ptr [ebp + 16]
    fld dword ptr [ebp + 16]
    fistp dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 20]
    mov dword ptr [eax], edi
    add eax, 4
    dec ecx
    jne L36
L37:
    fldcw word ptr [ebp - 16]
    jmp L42
L38:
    test ecx, ecx
    jbe L42
    mov edx, dword ptr [ebp - 4]
    mov edi, ebx
    sub edi, edx
L39:
    fld dword ptr [g_1019BC84]
    fld dword ptr [edx + edi]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L40
    xor eax, eax
    inc eax
    jmp L41
L40:
    xor eax, eax
L41:
    mov dword ptr [edx], eax
    add edx, 4
    dec ecx
    jne L39
L42:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], eax
L43:
    mov eax, dword ptr [ebp + 8]
    mov ax, word ptr [eax + 8]
    test ax, ax
    je L53
    cmp word ptr [esi], 3
    je L44
    movzx edx, word ptr [esi + 6]
    movzx edi, word ptr [esi + 4]
    jmp L45
L44:
    movzx edx, word ptr [esi + 4]
    movzx edi, word ptr [esi + 6]
L45:
    test dl, 3
    je L53
    cmp ax, 1
    mov dword ptr [ebp - 12], 01010FE8Ch
    je L46
    mov dword ptr [ebp - 12], 01010FE7Ch
L46:
    imul edi, dword ptr [ebp + 20]
    lea esi, [edx + 3]
    and esi, 0FFFFFFFCh
    test edi, edi
    mov dword ptr [ebp + 16], edi
    jbe L52
    mov ebx, dword ptr [ebp - 4]
    lea ecx, [edi*4 + 4]
    imul edi, esi
    mov eax, ecx
    imul ecx, esi
    imul eax, edx
    add eax, dword ptr [ebp - 8]
    add edi, edx
    add ecx, dword ptr [ebp - 4]
    lea ebx, [ebx + edi*4]
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ebp - 20], ecx
L47:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 8], edi
    mov ecx, edx
    shl ecx, 2
    sub ebx, edi
    sub eax, ecx
    cmp esi, edx
    mov dword ptr [ebp + 16], esi
    jbe L49
    mov ecx, dword ptr [ebp - 8]
L48:
    dec dword ptr [ebp + 16]
    mov edi, dword ptr [ebp - 12]
    sub ecx, 4
    mov dword ptr [ebp - 16], ecx
    mov ecx, dword ptr [ebp + 16]
    and ecx, 3
    cmp dword ptr [ebp + 16], edx
    mov edi, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ecx], edi
    ja L48
L49:
    test edx, edx
    jbe L51
    mov ecx, ebx
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 16], edx
L50:
    sub dword ptr [ebp + 16], 4
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    sub ecx, 4
    dec dword ptr [ebp - 16]
    mov dword ptr [ecx], edi
    jne L50
L51:
    dec dword ptr [ebp - 20]
    jne L47
L52:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], eax
L53:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 44]
    imul eax, dword ptr [ebp + 20]
    movzx edx, word ptr [ecx + 12]
    cmp eax, edx
    jbe L54
    mov eax, edx
L54:
    push eax
    push dword ptr [ebp - 4]
    movzx eax, word ptr [ecx + 10]
    push dword ptr [ebp - 8]
    add eax, dword ptr [ebp + 24]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jl L56
L55:
    xor eax, eax
L56:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007f64e ENDP
END
