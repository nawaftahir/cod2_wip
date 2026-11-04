.686
.MODEL FLAT, C
EXTRN sub_1007F008:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_1007ff1d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 32]
    push ebx
    mov ebx, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ecx + 24]
    mov dword ptr [ebp - 4], eax
    movzx eax, word ptr [esi]
    sub eax, 0
    push edi
    mov dword ptr [ebp - 8], ebx
    je L35
    dec eax
    je L28
    dec eax
    je L17
    dec eax
    je L7
    dec eax
    dec eax
    je L0
    mov eax, 080004001h
    jmp L60
L0:
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ecx + 52]
    shl eax, 4
    xor edx, edx
    div ecx
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L1
    mov dword ptr [ebp + 20], eax
L1:
    imul ecx, dword ptr [ebp + 20]
    mov edx, dword ptr [ebp - 4]
    xor edi, edi
    test ecx, ecx
    mov dword ptr [ebp - 20], ecx
    jbe L3
L2:
    mov eax, edi
    shr eax, 2
    mov ecx, eax
    shr ecx, 2
    mov ebx, edi
    and ebx, 3
    and eax, 3
    lea ecx, [ebx + ecx*4]
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [edx], eax
    add edx, 4
    inc edi
    cmp edi, dword ptr [ebp - 20]
    jb L2
L3:
    mov eax, dword ptr [ebp - 4]
    and dword ptr [ebp + 16], 0
    cmp dword ptr [ebp + 20], 0
    mov dword ptr [ebp - 8], eax
    jbe L59
L4:
    xor ebx, ebx
    cmp word ptr [esi + 10], bx
    jbe L6
L5:
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 24]
    mov ecx, dword ptr [eax + 56]
    mov edi, dword ptr [ecx + ebx*4]
    push dword ptr [edi + 48]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 12]
    push eax
    call sub_1007F008
    test eax, eax
    jl L60
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [edi + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [edi + 40]
    add dword ptr [ebp + 24], eax
    movzx eax, word ptr [esi + 10]
    inc ebx
    cmp ebx, eax
    jb L5
L6:
    inc dword ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ebp + 20]
    jb L4
    jmp L59
L7:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L8
    mov dword ptr [ebp + 20], eax
L8:
    mov dx, word ptr [esi + 4]
    cmp dx, 4
    jne L9
    cmp word ptr [esi + 6], dx
    je L39
L9:
    mov edi, dword ptr [ebp - 4]
    xor ebx, ebx
    cmp dword ptr [ebp + 20], ebx
    jbe L38
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
    mov edx, dword ptr [ebp + 16]
    lea eax, [eax + ebx*4]
    lea eax, [ecx + eax*4]
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
    jmp L38
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
    jne L20
    cmp word ptr [esi + 6], cx
    jne L20
    cmp dword ptr [ebp + 20], 0
    jbe L38
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp + 16]
    lea ecx, [edx + 8]
    lea eax, [edi + 32]
    sub edx, edi
    mov edi, dword ptr [ebp + 20]
L19:
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
    fstp dword ptr [edx + eax]
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
    jne L19
    jmp L38
L20:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 20], 0
    mov edi, dword ptr [ebp - 4]
    jbe L38
L21:
    xor edx, edx
    test cx, cx
    jbe L27
    movzx eax, word ptr [esi + 6]
L22:
    xor ecx, ecx
    test eax, eax
    jbe L26
L23:
    cmp edx, 4
    ja L24
    cmp ecx, 4
    ja L24
    mov eax, dword ptr [ebp - 8]
    mov ebx, dword ptr [ebp + 16]
    lea eax, [ecx + eax*4]
    lea eax, [edx + eax*4]
    mov eax, dword ptr [ebx + eax*4]
    jmp L25
L24:
    xor eax, eax
L25:
    mov dword ptr [edi], eax
    movzx eax, word ptr [esi + 6]
    add edi, 4
    inc ecx
    cmp ecx, eax
    jb L23
L26:
    mov cx, word ptr [esi + 4]
    movzx ebx, cx
    inc edx
    cmp edx, ebx
    jb L22
L27:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 20]
    jb L21
    jmp L38
L28:
    mov ecx, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl ecx, 2
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L29
    mov dword ptr [ebp + 20], eax
L29:
    mov edx, dword ptr [ebp - 4]
    xor edi, edi
    cmp dword ptr [ebp + 20], edi
    jbe L38
    movzx eax, word ptr [esi + 6]
L30:
    xor ecx, ecx
    test eax, eax
    jbe L34
L31:
    cmp ecx, 4
    jbe L32
    xor eax, eax
    jmp L33
L32:
    mov eax, edi
    shr eax, 2
    mov ebx, edi
    lea eax, [ecx + eax*4]
    and ebx, 3
    lea eax, [ebx + eax*4]
    mov ebx, dword ptr [ebp + 16]
    mov eax, dword ptr [ebx + eax*4]
L33:
    mov dword ptr [edx], eax
    movzx eax, word ptr [esi + 6]
    add edx, 4
    inc ecx
    cmp ecx, eax
    jb L31
L34:
    inc edi
    cmp edi, dword ptr [ebp + 20]
    jb L30
    jmp L38
L35:
    mov edi, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl edi, 4
    cmp edi, eax
    mov dword ptr [ebp + 20], edi
    jbe L36
    mov edi, eax
    mov dword ptr [ebp + 20], edi
L36:
    mov ecx, dword ptr [ebp - 4]
    xor edx, edx
    test edi, edi
    jbe L38
L37:
    mov eax, edx
    shr eax, 2
    mov edi, eax
    shr edi, 2
    mov ebx, edx
    and ebx, 3
    and eax, 3
    lea edi, [ebx + edi*4]
    lea eax, [eax + edi*4]
    mov edi, dword ptr [ebp + 16]
    mov eax, dword ptr [edi + eax*4]
    mov dword ptr [ecx], eax
    add ecx, 4
    inc edx
    cmp edx, dword ptr [ebp + 20]
    jb L37
L38:
    mov ebx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], ebx
L39:
    mov ax, word ptr [esi + 2]
    cmp ax, 3
    je L47
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 52]
    imul ecx, dword ptr [ebp + 20]
    movzx eax, ax
    dec eax
    je L42
    dec eax
    jne L46
    fnstcw word ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    or eax, 000000C00h
    mov dword ptr [ebp - 20], eax
    fldcw word ptr [ebp - 20]
    test ecx, ecx
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], eax
    jbe L41
    mov eax, dword ptr [ebp - 4]
    mov edx, ebx
    sub edx, eax
L40:
    fld dword ptr [edx + eax]
    fstp dword ptr [ebp + 16]
    fld dword ptr [ebp + 16]
    fistp dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 20]
    mov dword ptr [eax], edi
    add eax, 4
    dec ecx
    jne L40
L41:
    fldcw word ptr [ebp - 16]
    jmp L46
L42:
    test ecx, ecx
    jbe L46
    mov edx, dword ptr [ebp - 4]
    mov edi, ebx
    sub edi, edx
L43:
    fld dword ptr [g_1019BC84]
    fld dword ptr [edx + edi]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L44
    xor eax, eax
    inc eax
    jmp L45
L44:
    xor eax, eax
L45:
    mov dword ptr [edx], eax
    add edx, 4
    dec ecx
    jne L43
L46:
    mov ebx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], ebx
L47:
    mov eax, dword ptr [ebp + 8]
    mov ax, word ptr [eax + 8]
    test ax, ax
    je L57
    cmp word ptr [esi], 3
    je L48
    movzx edx, word ptr [esi + 6]
    movzx edi, word ptr [esi + 4]
    jmp L49
L48:
    movzx edx, word ptr [esi + 4]
    movzx edi, word ptr [esi + 6]
L49:
    test dl, 3
    je L57
    cmp ax, 1
    mov dword ptr [ebp - 12], 01010FECCh
    je L50
    mov dword ptr [ebp - 12], 01010FEBCh
L50:
    imul edi, dword ptr [ebp + 20]
    lea esi, [edx + 3]
    and esi, 0FFFFFFFCh
    test edi, edi
    mov dword ptr [ebp + 16], edi
    jbe L56
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
L51:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 8], edi
    mov ecx, edx
    shl ecx, 2
    sub ebx, edi
    sub eax, ecx
    cmp esi, edx
    mov dword ptr [ebp + 16], esi
    jbe L53
    mov ecx, dword ptr [ebp - 8]
L52:
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
    ja L52
L53:
    test edx, edx
    jbe L55
    mov ecx, ebx
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 16], edx
L54:
    sub dword ptr [ebp + 16], 4
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    sub ecx, 4
    dec dword ptr [ebp - 16]
    mov dword ptr [ecx], edi
    jne L54
L55:
    dec dword ptr [ebp - 20]
    jne L51
L56:
    mov ebx, dword ptr [ebp - 4]
L57:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 44]
    imul eax, dword ptr [ebp + 20]
    movzx edx, word ptr [ecx + 12]
    cmp eax, edx
    jbe L58
    mov eax, edx
L58:
    push eax
    push dword ptr [ebp - 4]
    movzx eax, word ptr [ecx + 10]
    add eax, dword ptr [ebp + 24]
    push ebx
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jl L60
L59:
    xor eax, eax
L60:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007ff1d ENDP
END
