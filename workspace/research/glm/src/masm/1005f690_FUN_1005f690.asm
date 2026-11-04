.686
.MODEL FLAT, C
EXTRN sub_1005F544:PROC
EXTRN sub_1005F5B3:PROC
EXTRN sub_1005F623:PROC
EXTRN g_101A6674:DWORD
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_1005f690 PROC
    sub esp, 8
    mov ecx, dword ptr [g_101AAC70]
    imul ecx, ecx, 00000045Ch
    push ebp
    push esi
    mov esi, dword ptr [esp + 20]
    push edi
    mov edi, eax
    mov eax, dword ptr [esi]
    xor ebp, ebp
    add ecx, 0101A66B0h
    cmp eax, ebp
    mov dword ptr [esp + 16], ebp
    mov dword ptr [esp + 12], ecx
    mov byte ptr [ecx], 0
    jne L0
    pop edi
    mov dword ptr [esi], ebp
    pop esi
    mov eax, ecx
    pop ebp
    add esp, 8
    ret
L0:
    mov edx, dword ptr [ecx + 000000400h]
    mov dword ptr [ecx + 000000414h], edx
    mov edx, dword ptr [esi]
    mov dword ptr [ecx + 000000418h], edx
    mov dl, byte ptr [ecx + 000000407h]
    test dl, dl
    je L1
    mov edx, edi
    mov edi, esi
    call sub_1005F623
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
L1:
    push ebx
    lea esi, [esp + 20]
    call sub_1005F544
    cmp eax, ebp
    je L11
L2:
    mov ecx, dword ptr [esp + 20]
    test ecx, ecx
    je L3
    test edi, edi
    je L12
L3:
    mov cl, byte ptr [eax]
    cmp cl, 47
    jne L13
    mov dl, byte ptr [eax + 1]
    cmp dl, cl
    jne L5
    test cl, cl
    je L10
L4:
    cmp cl, 10
    je L10
    mov cl, byte ptr [eax + 1]
    inc eax
    test cl, cl
    jne L4
    jmp L10
L5:
    cmp dl, 42
    jne L13
    test cl, cl
    je L10
    mov edx, dword ptr [esp + 16]
L6:
    cmp cl, 42
    jne L7
    cmp byte ptr [eax + 1], 47
    je L9
L7:
    cmp cl, 10
    jne L8
    inc dword ptr [edx + 000000400h]
L8:
    mov cl, byte ptr [eax + 1]
    inc eax
    test cl, cl
    jne L6
    jmp L10
L9:
    cmp byte ptr [eax], 0
    je L10
    add eax, 2
L10:
    lea esi, [esp + 20]
    call sub_1005F5B3
    test eax, eax
    jne L2
L11:
    mov eax, dword ptr [esp + 28]
    mov dword ptr [eax], 0
L12:
    mov eax, dword ptr [esp + 16]
    pop ebx
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
L13:
    cmp cl, 34
    mov edx, dword ptr [g_101AAC74]
    mov esi, dword ptr [esp + 16]
    mov dword ptr [g_101AAC78], edx
    mov dword ptr [g_101AAC74], eax
    jne L21
    mov cl, byte ptr [esi + 000000406h]
    test cl, cl
    je L14
    mov byte ptr [esi], 34
    mov ebp, 1
L14:
    inc eax
    lea ebx, [ebx]
L15:
    mov cl, byte ptr [eax]
    inc eax
    cmp cl, 92
    jne L17
    mov dl, byte ptr [eax]
    cmp dl, 34
    je L16
    cmp dl, cl
    jne L18
L16:
    mov cl, dl
    inc eax
    jmp L19
L17:
    cmp cl, 34
    je L20
    test cl, cl
    je L20
L18:
    cmp byte ptr [eax], 10
    jne L19
    inc dword ptr [esi + 000000400h]
L19:
    cmp ebp, 0000003FFh
    jge L15
    mov byte ptr [esi + ebp], cl
    inc ebp
    jmp L15
L20:
    mov cl, byte ptr [esi + 000000406h]
    test cl, cl
    je L52
    mov ecx, dword ptr [esp + 28]
    mov byte ptr [esi + ebp], 34
    inc ebp
    pop ebx
    mov byte ptr [esi + ebp], 0
    pop edi
    mov dword ptr [ecx], eax
    mov eax, esi
    pop esi
    pop ebp
    add esp, 8
    ret
L21:
    mov dl, byte ptr [esi + 000000405h]
    test dl, dl
    je L25
    jmp L22
    lea ecx, [ecx]
L22:
    cmp ebp, 0000003FFh
    jge L23
    mov byte ptr [esi + ebp], cl
    inc ebp
L23:
    mov cl, byte ptr [eax + 1]
    inc eax
    cmp cl, 32
    jg L22
    cmp ebp, 000000400h
    jne L24
    xor ebp, ebp
L24:
    mov edx, dword ptr [esp + 28]
    pop ebx
    mov byte ptr [esi + ebp], 0
    pop edi
    mov dword ptr [edx], eax
    mov eax, esi
    pop esi
    pop ebp
    add esp, 8
    ret
L25:
    cmp cl, 48
    jl L26
    cmp cl, 57
    jle L28
L26:
    mov dl, byte ptr [esi + 000000408h]
    test dl, dl
    je L27
    cmp cl, 45
    jne L27
    mov dl, byte ptr [eax + 1]
    cmp dl, 48
    jl L40
    cmp dl, 57
    jle L28
    jmp L40
L27:
    cmp cl, 46
    jne L37
    mov dl, byte ptr [eax + 1]
    cmp dl, 48
    jl L40
    cmp dl, 57
    jg L40
L28:
    cmp ebp, 0000003FFh
    jge L29
    mov byte ptr [esi + ebp], cl
    inc ebp
L29:
    mov cl, byte ptr [eax + 1]
    inc eax
    cmp cl, 48
    jl L30
    cmp cl, 57
    jle L28
L30:
    cmp cl, 46
    je L28
    cmp cl, 101
    je L31
    cmp cl, 69
    jne L51
L31:
    cmp ebp, 0000003FFh
    jge L32
    mov byte ptr [esi + ebp], cl
    inc ebp
L32:
    mov cl, byte ptr [eax + 1]
    inc eax
    cmp cl, 45
    je L33
    cmp cl, 43
    jne L35
L33:
    cmp ebp, 0000003FFh
    jge L34
    mov byte ptr [esi + ebp], cl
    inc ebp
L34:
    mov cl, byte ptr [eax + 1]
    inc eax
L35:
    cmp ebp, 0000003FFh
    jge L36
    mov byte ptr [esi + ebp], cl
    inc ebp
L36:
    mov cl, byte ptr [eax + 1]
    inc eax
    cmp cl, 48
    jl L51
    cmp cl, 57
    jle L35
    jmp L51
L37:
    cmp cl, 97
    jl L38
    cmp cl, 122
    jle L47
L38:
    cmp cl, 65
    jl L39
    cmp cl, 90
    jle L47
L39:
    cmp cl, 95
    je L47
    cmp cl, 47
    je L47
    cmp cl, 92
    je L47
L40:
    mov esi, dword ptr [g_101A6674]
    test esi, esi
    mov edi, 0101A6674h
    je L45
L41:
    mov ecx, esi
    lea ebx, [ecx + 1]
L42:
    mov dl, byte ptr [ecx]
    inc ecx
    test dl, dl
    jne L42
    sub ecx, ebx
    mov ebp, ecx
    xor ecx, ecx
    test ebp, ebp
    jle L44
L43:
    mov dl, byte ptr [ecx + eax]
    cmp dl, byte ptr [esi + ecx]
    jne L44
    inc ecx
    cmp ecx, ebp
    jl L43
L44:
    cmp ecx, ebp
    je L46
    mov esi, dword ptr [edi + 4]
    add edi, 4
    test esi, esi
    jne L41
L45:
    mov dl, byte ptr [eax]
    mov ecx, dword ptr [esp + 16]
    pop ebx
    mov byte ptr [ecx], dl
    mov edx, dword ptr [esp + 24]
    pop edi
    inc eax
    mov byte ptr [ecx + 1], 0
    pop esi
    mov dword ptr [edx], eax
    mov eax, ecx
    pop ebp
    add esp, 8
    ret
L46:
    mov esi, dword ptr [edi]
    mov edi, dword ptr [esp + 16]
    mov ecx, ebp
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 16]
    pop ebx
    mov byte ptr [ecx + ebp], 0
    add ebp, eax
    mov eax, dword ptr [esp + 24]
    pop edi
    mov dword ptr [eax], ebp
    pop esi
    mov eax, ecx
    pop ebp
    add esp, 8
    ret
    mov edi, edi
L47:
    cmp ebp, 0000003FFh
    jge L48
    mov byte ptr [esi + ebp], cl
    inc ebp
L48:
    mov cl, byte ptr [eax + 1]
    inc eax
    cmp cl, 97
    jl L49
    cmp cl, 122
    jle L47
L49:
    cmp cl, 65
    jl L50
    cmp cl, 90
    jle L47
L50:
    cmp cl, 95
    je L47
    cmp cl, 48
    jl L51
    cmp cl, 57
    jle L47
L51:
    cmp ebp, 000000400h
    jne L52
    xor ebp, ebp
L52:
    mov ecx, dword ptr [esp + 28]
    pop ebx
    mov byte ptr [esi + ebp], 0
    pop edi
    mov dword ptr [ecx], eax
    mov eax, esi
    pop esi
FUN_1005f690 ENDP
END
