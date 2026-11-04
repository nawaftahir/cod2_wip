.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_1007ef30 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 32]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ebx + 24]
    mov dword ptr [ebp - 4], eax
    movzx eax, word ptr [esi]
    xor ecx, ecx
    sub eax, ecx
    push edi
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
    jmp L41
L1:
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div dword ptr [ebx + 52]
    mov dword ptr [ebp + 20], eax
    movzx eax, word ptr [esi + 8]
    cmp dword ptr [ebp + 20], eax
    jbe L2
    mov dword ptr [ebp + 20], eax
L2:
    cmp dword ptr [ebp + 20], ecx
    mov dword ptr [ebp + 8], ecx
    jbe L40
    jmp L4
L3:
    xor ecx, ecx
L4:
    cmp word ptr [esi + 10], cx
    mov dword ptr [ebp + 16], ecx
    jbe L6
L5:
    push dword ptr [ebp + 24]
    mov eax, dword ptr [ebx + 56]
    mov ecx, dword ptr [ebp + 16]
    mov edi, dword ptr [eax + ecx*4]
    push dword ptr [edi + 48]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 12]
    push ebx
    call L0
    test eax, eax
    jl L41
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 48]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [edi + 40]
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
    jmp L40
L7:
    movzx ecx, word ptr [esi + 4]
    movzx eax, word ptr [esi + 6]
    mov edi, ecx
    imul edi, eax
    mov eax, dword ptr [ebp + 20]
    xor edx, edx
    div edi
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
    movzx edi, word ptr [esi + 6]
    add ecx, eax
    imul ecx, edi
    add ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp + 16]
    mov ecx, dword ptr [edi + ecx*4]
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
    mov ax, word ptr [esi + 2]
    cmp ax, 3
    je L28
    mov ecx, dword ptr [ebx + 52]
    imul ecx, dword ptr [ebp + 20]
    movzx eax, ax
    dec eax
    je L23
    dec eax
    jne L27
    fnstcw word ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    or eax, 000000C00h
    mov dword ptr [ebp - 20], eax
    fldcw word ptr [ebp - 20]
    test ecx, ecx
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], eax
    jbe L22
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 4]
    sub edx, eax
L21:
    fld dword ptr [edx + eax]
    fstp dword ptr [ebp + 16]
    fld dword ptr [ebp + 16]
    fistp dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 20]
    mov dword ptr [eax], edi
    add eax, 4
    dec ecx
    jne L21
L22:
    fldcw word ptr [ebp - 16]
    jmp L27
L23:
    test ecx, ecx
    jbe L27
    mov edx, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 4]
    sub edi, edx
L24:
    fld dword ptr [g_1019BC84]
    fld dword ptr [edx + edi]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L25
    xor eax, eax
    inc eax
    jmp L26
L25:
    xor eax, eax
L26:
    mov dword ptr [edx], eax
    add edx, 4
    dec ecx
    jne L24
L27:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L28:
    mov ax, word ptr [ebx + 8]
    test ax, ax
    je L38
    cmp word ptr [esi], 3
    je L29
    movzx edx, word ptr [esi + 6]
    movzx edi, word ptr [esi + 4]
    jmp L30
L29:
    movzx edx, word ptr [esi + 4]
    movzx edi, word ptr [esi + 6]
L30:
    test dl, 3
    je L38
    cmp ax, 1
    mov dword ptr [ebp - 16], 01010FE4Ch
    je L31
    mov dword ptr [ebp - 16], 01010FE3Ch
L31:
    imul edi, dword ptr [ebp + 20]
    lea esi, [edx + 3]
    and esi, 0FFFFFFFCh
    test edi, edi
    mov dword ptr [ebp + 16], edi
    jbe L37
    mov ebx, dword ptr [ebp - 8]
    lea ecx, [edi*4 + 4]
    imul edi, esi
    mov eax, ecx
    imul ecx, esi
    imul eax, edx
    add eax, dword ptr [ebp - 4]
    add edi, edx
    add ecx, ebx
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [ebp + 16]
    lea edi, [ebx + edi*4]
    mov dword ptr [ebp - 20], ecx
L32:
    mov ebx, esi
    shl ebx, 2
    sub dword ptr [ebp - 12], ebx
    mov ecx, edx
    shl ecx, 2
    sub edi, ebx
    sub eax, ecx
    cmp esi, edx
    mov dword ptr [ebp + 16], esi
    jbe L34
    mov ecx, dword ptr [ebp - 12]
L33:
    dec dword ptr [ebp + 16]
    mov ebx, dword ptr [ebp - 16]
    sub ecx, 4
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [ebp + 16]
    and ecx, 3
    cmp dword ptr [ebp + 16], edx
    mov ebx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx], ebx
    ja L33
L34:
    test edx, edx
    jbe L36
    mov ecx, edi
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 4], edx
L35:
    sub dword ptr [ebp + 16], 4
    mov ebx, dword ptr [ebp + 16]
    mov ebx, dword ptr [ebx]
    sub ecx, 4
    dec dword ptr [ebp - 4]
    mov dword ptr [ecx], ebx
    jne L35
L36:
    dec dword ptr [ebp - 20]
    jne L32
    mov ebx, dword ptr [ebp + 8]
L37:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
L38:
    mov eax, dword ptr [ebx + 44]
    imul eax, dword ptr [ebp + 20]
    movzx ecx, word ptr [ebx + 12]
    cmp eax, ecx
    jbe L39
    mov eax, ecx
L39:
    push eax
    push dword ptr [ebp - 8]
    movzx eax, word ptr [ebx + 10]
    push dword ptr [ebp - 4]
    add eax, dword ptr [ebp + 24]
    push eax
    push dword ptr [ebp + 12]
    call dword ptr [ebx + 0x1c]
    test eax, eax
    jl L41
L40:
    xor eax, eax
L41:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1007ef30 ENDP
END
