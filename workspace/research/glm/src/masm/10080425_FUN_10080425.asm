.686
.MODEL FLAT, C
EXTRN sub_1007F002:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_10080425 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    mov ecx, dword ptr [ebp + 8]
    push ebx
    mov ebx, dword ptr [ecx + 32]
    push esi
    mov esi, dword ptr [ecx + 24]
    movzx eax, word ptr [esi]
    xor edx, edx
    sub eax, edx
    push edi
    mov dword ptr [ebp - 4], ebx
    je L32
    dec eax
    je L25
    dec eax
    je L16
    dec eax
    je L7
    dec eax
    dec eax
    je L0
    mov eax, 080004001h
    jmp L54
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
    xor edi, edi
    test ecx, ecx
    mov dword ptr [ebp - 20], ecx
    mov edx, ebx
    jbe L3
L2:
    mov eax, edi
    shr eax, 2
    mov ebx, eax
    mov ecx, edi
    and ebx, 3
    and ecx, 3
    shr eax, 2
    lea ecx, [ebx + ecx*4]
    mov ebx, dword ptr [ebp + 16]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [edx], eax
    add edx, 4
    inc edi
    cmp edi, dword ptr [ebp - 20]
    jb L2
L3:
    mov eax, dword ptr [ebp - 4]
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 20], 0
    mov dword ptr [ebp + 16], eax
    jbe L53
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
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push eax
    call sub_1007F002
    test eax, eax
    jl L54
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [edi + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp + 16], eax
    mov eax, dword ptr [edi + 40]
    add dword ptr [ebp + 24], eax
    movzx eax, word ptr [esi + 10]
    inc ebx
    cmp ebx, eax
    jb L5
L6:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 20]
    jb L4
    jmp L53
L7:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L8
    mov dword ptr [ebp + 20], eax
L8:
    xor edi, edi
    cmp dword ptr [ebp + 20], edx
    mov dword ptr [ebp - 8], ebx
    jbe L35
L9:
    xor edx, edx
    cmp word ptr [esi + 6], dx
    jbe L15
    movzx eax, word ptr [esi + 4]
L10:
    xor ecx, ecx
    test eax, eax
    jbe L14
L11:
    cmp ecx, 4
    ja L12
    cmp edx, 4
    ja L12
    mov ebx, dword ptr [ebp + 16]
    mov ebx, dword ptr [ebx + edi*4]
    lea eax, [ecx + edx*4]
    mov eax, dword ptr [ebx + eax*4]
    jmp L13
L12:
    xor eax, eax
L13:
    mov ebx, dword ptr [ebp - 8]
    add dword ptr [ebp - 8], 4
    mov dword ptr [ebx], eax
    movzx eax, word ptr [esi + 4]
    inc ecx
    cmp ecx, eax
    jb L11
L14:
    movzx ecx, word ptr [esi + 6]
    inc edx
    cmp edx, ecx
    jb L10
L15:
    inc edi
    cmp edi, dword ptr [ebp + 20]
    jb L9
    jmp L35
L16:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L17
    mov dword ptr [ebp + 20], eax
L17:
    mov edi, dword ptr [ebp - 4]
    xor ebx, ebx
    cmp dword ptr [ebp + 20], ebx
    jbe L35
L18:
    and dword ptr [ebp - 8], 0
    cmp word ptr [esi + 4], 0
    jbe L24
    movzx eax, word ptr [esi + 6]
L19:
    xor edx, edx
    test eax, eax
    jbe L23
    mov ecx, dword ptr [ebp - 8]
    shl ecx, 2
L20:
    cmp dword ptr [ebp - 8], 4
    ja L21
    cmp edx, 4
    ja L21
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [ecx + eax]
    jmp L22
L21:
    xor eax, eax
L22:
    mov dword ptr [edi], eax
    movzx eax, word ptr [esi + 6]
    add edi, 4
    inc edx
    add ecx, 16
    cmp edx, eax
    jb L20
L23:
    movzx ecx, word ptr [esi + 4]
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], ecx
    jb L19
L24:
    inc ebx
    cmp ebx, dword ptr [ebp + 20]
    jb L18
    jmp L35
L25:
    mov ecx, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl ecx, 2
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L26
    mov dword ptr [ebp + 20], eax
L26:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 20], 0
    mov edx, ebx
    jbe L35
    movzx eax, word ptr [esi + 6]
L27:
    xor ecx, ecx
    test eax, eax
    jbe L31
L28:
    cmp ecx, 4
    jbe L29
    xor eax, eax
    jmp L30
L29:
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 8]
    mov ebx, dword ptr [ebp + 16]
    and eax, 3
    shr edi, 2
    mov edi, dword ptr [ebx + edi*4]
    lea eax, [eax + ecx*4]
    mov eax, dword ptr [edi + eax*4]
L30:
    mov dword ptr [edx], eax
    movzx eax, word ptr [esi + 6]
    add edx, 4
    inc ecx
    cmp ecx, eax
    jb L28
L31:
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebp + 20]
    jb L27
    jmp L35
L32:
    mov edi, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl edi, 4
    cmp edi, eax
    mov dword ptr [ebp + 20], edi
    jbe L33
    mov edi, eax
    mov dword ptr [ebp + 20], edi
L33:
    test edi, edi
    mov ecx, ebx
    jbe L35
L34:
    mov eax, edx
    shr eax, 2
    mov ebx, eax
    mov edi, edx
    and ebx, 3
    and edi, 3
    shr eax, 2
    lea edi, [ebx + edi*4]
    mov ebx, dword ptr [ebp + 16]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [ecx], eax
    add ecx, 4
    inc edx
    cmp edx, dword ptr [ebp + 20]
    jb L34
L35:
    mov ax, word ptr [esi + 2]
    cmp ax, 3
    je L42
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
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], eax
    xor eax, eax
    test ecx, ecx
    jbe L37
L36:
    mov edx, dword ptr [ebp - 4]
    lea edx, [edx + eax*4]
    mov edi, dword ptr [edx]
    mov dword ptr [ebp + 16], edi
    fld dword ptr [ebp + 16]
    fistp dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 20]
    inc eax
    cmp eax, ecx
    mov dword ptr [edx], edi
    jb L36
L37:
    fldcw word ptr [ebp - 16]
    jmp L42
L38:
    xor edx, edx
    test ecx, ecx
    jbe L42
L39:
    mov eax, dword ptr [ebp - 4]
    fld dword ptr [g_1019BC84]
    lea edi, [eax + edx*4]
    fld dword ptr [edi]
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
    inc edx
    cmp edx, ecx
    mov dword ptr [edi], eax
    jb L39
L42:
    mov eax, dword ptr [ebp + 8]
    mov ax, word ptr [eax + 8]
    test ax, ax
    je L51
    cmp word ptr [esi], 3
    je L43
    movzx edx, word ptr [esi + 6]
    movzx edi, word ptr [esi + 4]
    jmp L44
L43:
    movzx edx, word ptr [esi + 4]
    movzx edi, word ptr [esi + 6]
L44:
    test dl, 3
    je L51
    cmp ax, 1
    mov dword ptr [ebp - 12], 01010FEECh
    je L45
    mov dword ptr [ebp - 12], 01010FEDCh
L45:
    imul edi, dword ptr [ebp + 20]
    lea esi, [edx + 3]
    and esi, 0FFFFFFFCh
    test edi, edi
    mov dword ptr [ebp + 16], edi
    jbe L51
    mov ebx, dword ptr [ebp - 4]
    lea ecx, [edi*4 + 4]
    imul edi, esi
    mov eax, ecx
    imul ecx, esi
    imul eax, edx
    add eax, ebx
    add edi, edx
    add ecx, dword ptr [ebp - 4]
    lea ebx, [ebx + edi*4]
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ebp - 20], ecx
L46:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 8], edi
    mov ecx, edx
    shl ecx, 2
    sub ebx, edi
    sub eax, ecx
    cmp esi, edx
    mov dword ptr [ebp + 16], esi
    jbe L48
    mov ecx, dword ptr [ebp - 8]
L47:
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
    ja L47
L48:
    test edx, edx
    jbe L50
    mov ecx, ebx
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 16], edx
L49:
    sub dword ptr [ebp + 16], 4
    mov edi, dword ptr [ebp + 16]
    mov edi, dword ptr [edi]
    sub ecx, 4
    dec dword ptr [ebp - 16]
    mov dword ptr [ecx], edi
    jne L49
L50:
    dec dword ptr [ebp - 20]
    jne L46
L51:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 44]
    imul eax, dword ptr [ebp + 20]
    movzx edx, word ptr [ecx + 12]
    cmp eax, edx
    jbe L52
    mov eax, edx
L52:
    push eax
    push dword ptr [ebp - 4]
    movzx eax, word ptr [ecx + 10]
    push dword ptr [ebp - 4]
    add eax, dword ptr [ebp + 24]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jl L54
L53:
    xor eax, eax
L54:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_10080425 ENDP
END
