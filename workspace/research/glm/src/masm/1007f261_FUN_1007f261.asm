.686
.MODEL FLAT, C
EXTRN sub_1007EFC6:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_1007f261 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 16]
    push ebx
    mov ebx, dword ptr [ecx + 32]
    push esi
    mov esi, dword ptr [ecx + 24]
    mov dword ptr [ebp - 4], eax
    movzx eax, word ptr [esi]
    push edi
    xor edi, edi
    sub eax, edi
    mov dword ptr [ebp - 8], ebx
    je L31
    dec eax
    je L24
    dec eax
    je L15
    dec eax
    je L5
    dec eax
    dec eax
    je L0
    mov eax, 080004001h
    jmp L53
L0:
    mov eax, dword ptr [ebp + 20]
    shl eax, 2
    xor edx, edx
    div dword ptr [ecx + 52]
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L1
    mov dword ptr [ebp + 20], eax
L1:
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp + 16], edi
    jbe L52
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
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 12]
    push eax
    call sub_1007EFC6
    test eax, eax
    jl L53
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 4], eax
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
    jmp L52
L5:
    movzx ecx, word ptr [esi + 6]
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div ecx
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L6
    mov dword ptr [ebp + 20], eax
L6:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp + 20], 0
    mov edi, ebx
    jbe L14
L7:
    xor edx, edx
    test ecx, ecx
    jbe L13
    movzx eax, word ptr [esi + 4]
L8:
    xor ecx, ecx
    test eax, eax
    jbe L12
L9:
    cmp edx, 4
    jbe L10
    xor eax, eax
    jmp L11
L10:
    imul eax, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp + 16]
    add eax, ecx
    lea eax, [edx + eax*4]
    mov eax, dword ptr [ebx + eax*4]
    mov ebx, dword ptr [ebp - 8]
L11:
    mov dword ptr [edi], eax
    movzx eax, word ptr [esi + 4]
    add edi, 4
    inc ecx
    cmp ecx, eax
    jb L9
L12:
    movzx ecx, word ptr [esi + 6]
    inc edx
    cmp edx, ecx
    jb L8
L13:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + 20]
    cmp dword ptr [ebp - 4], eax
    jb L7
L14:
    mov dword ptr [ebp - 4], ebx
    jmp L32
L15:
    movzx ecx, word ptr [esi + 4]
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div ecx
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L16
    mov dword ptr [ebp + 20], eax
L16:
    mov dx, word ptr [esi + 6]
    cmp dx, 4
    je L32
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp + 20], 0
    mov edi, ebx
    jbe L14
L17:
    xor ebx, ebx
    test ecx, ecx
    jbe L23
    movzx eax, dx
L18:
    xor ecx, ecx
    test eax, eax
    jbe L22
L19:
    cmp ecx, 4
    jbe L20
    xor eax, eax
    jmp L21
L20:
    movzx eax, word ptr [esi + 4]
    imul eax, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp + 16]
    add eax, ebx
    lea eax, [ecx + eax*4]
    mov eax, dword ptr [edx + eax*4]
L21:
    mov dword ptr [edi], eax
    mov dx, word ptr [esi + 6]
    add edi, 4
    movzx eax, dx
    inc ecx
    cmp ecx, eax
    jb L19
L22:
    movzx ecx, word ptr [esi + 4]
    inc ebx
    cmp ebx, ecx
    jb L18
L23:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 20]
    jb L17
    mov ebx, dword ptr [ebp - 8]
    jmp L14
L24:
    movzx eax, word ptr [esi + 8]
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L25
    mov dword ptr [ebp + 20], eax
L25:
    mov ax, word ptr [esi + 6]
    cmp ax, 4
    je L32
    xor edi, edi
    cmp dword ptr [ebp + 20], edi
    mov edx, ebx
    jbe L14
    movzx eax, ax
L26:
    xor ecx, ecx
    test eax, eax
    jbe L30
L27:
    cmp ecx, 4
    jbe L28
    xor eax, eax
    jmp L29
L28:
    mov ebx, dword ptr [ebp + 16]
    lea eax, [ecx + edi*4]
    mov eax, dword ptr [ebx + eax*4]
    mov ebx, dword ptr [ebp - 8]
L29:
    mov dword ptr [edx], eax
    movzx eax, word ptr [esi + 6]
    add edx, 4
    inc ecx
    cmp ecx, eax
    jb L27
L30:
    inc edi
    cmp edi, dword ptr [ebp + 20]
    jb L26
    jmp L14
L31:
    mov ecx, dword ptr [ebp + 20]
    movzx eax, word ptr [esi + 8]
    shl ecx, 2
    cmp ecx, eax
    mov dword ptr [ebp + 20], ecx
    jbe L32
    mov dword ptr [ebp + 20], eax
L32:
    mov ax, word ptr [esi + 2]
    cmp ax, 3
    je L40
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 52]
    imul ecx, dword ptr [ebp + 20]
    movzx eax, ax
    dec eax
    je L35
    dec eax
    jne L39
    fnstcw word ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    or eax, 000000C00h
    mov dword ptr [ebp - 20], eax
    fldcw word ptr [ebp - 20]
    test ecx, ecx
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], eax
    jbe L34
    mov edx, dword ptr [ebp - 4]
    mov eax, ebx
    sub edx, ebx
L33:
    fld dword ptr [edx + eax]
    fstp dword ptr [ebp + 16]
    fld dword ptr [ebp + 16]
    fistp dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 20]
    mov dword ptr [eax], edi
    add eax, 4
    dec ecx
    jne L33
L34:
    fldcw word ptr [ebp - 16]
    jmp L39
L35:
    test ecx, ecx
    jbe L39
    mov edi, dword ptr [ebp - 4]
    mov edx, ebx
    sub edi, ebx
L36:
    fld dword ptr [g_1019BC84]
    fld dword ptr [edx + edi]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L37
    xor eax, eax
    inc eax
    jmp L38
L37:
    xor eax, eax
L38:
    mov dword ptr [edx], eax
    add edx, 4
    dec ecx
    jne L36
L39:
    mov dword ptr [ebp - 4], ebx
L40:
    mov eax, dword ptr [ebp + 8]
    mov ax, word ptr [eax + 8]
    test ax, ax
    je L50
    cmp word ptr [esi], 3
    je L41
    movzx edx, word ptr [esi + 6]
    movzx edi, word ptr [esi + 4]
    jmp L42
L41:
    movzx edx, word ptr [esi + 4]
    movzx edi, word ptr [esi + 6]
L42:
    test dl, 3
    je L50
    cmp ax, 1
    mov dword ptr [ebp - 16], 01010FE6Ch
    je L43
    mov dword ptr [ebp - 16], 01010FE5Ch
L43:
    imul edi, dword ptr [ebp + 20]
    lea esi, [edx + 3]
    and esi, 0FFFFFFFCh
    test edi, edi
    jbe L49
    lea ecx, [edi*4 + 4]
    mov eax, edx
    imul eax, ecx
    add eax, dword ptr [ebp - 4]
    mov ecx, edi
    imul ecx, esi
    add ecx, edx
    lea ecx, [ebx + ecx*4]
    mov dword ptr [ebp - 12], ecx
    mov ecx, esi
    lea ebx, [edi*4 + 4]
    imul ecx, ebx
    add ecx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 20], edi
L44:
    mov edi, esi
    shl edi, 2
    sub dword ptr [ebp - 12], edi
    sub ecx, edi
    mov edi, edx
    shl edi, 2
    sub eax, edi
    cmp esi, edx
    mov dword ptr [ebp + 16], esi
    jbe L46
    mov dword ptr [ebp - 4], ecx
L45:
    dec dword ptr [ebp + 16]
    mov edi, dword ptr [ebp + 16]
    mov ebx, dword ptr [ebp - 16]
    sub dword ptr [ebp - 4], 4
    and edi, 3
    cmp dword ptr [ebp + 16], edx
    mov edi, dword ptr [ebx + edi*4]
    mov ebx, dword ptr [ebp - 4]
    mov dword ptr [ebx], edi
    ja L45
L46:
    test edx, edx
    jbe L48
    mov edi, dword ptr [ebp - 12]
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 4], edx
L47:
    sub dword ptr [ebp + 16], 4
    mov ebx, dword ptr [ebp + 16]
    mov ebx, dword ptr [ebx]
    sub edi, 4
    dec dword ptr [ebp - 4]
    mov dword ptr [edi], ebx
    jne L47
L48:
    dec dword ptr [ebp - 20]
    jne L44
    mov ebx, dword ptr [ebp - 8]
L49:
    mov dword ptr [ebp - 4], ebx
L50:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 44]
    imul eax, dword ptr [ebp + 20]
    movzx edx, word ptr [ecx + 12]
    cmp eax, edx
    jbe L51
    mov eax, edx
L51:
    push eax
    movzx eax, word ptr [ecx + 10]
    add eax, dword ptr [ebp + 24]
    push ebx
    push dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jl L53
L52:
    xor eax, eax
L53:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007f261 ENDP
END
