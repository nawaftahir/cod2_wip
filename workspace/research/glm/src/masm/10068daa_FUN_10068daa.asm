.686
.MODEL FLAT, C
EXTRN sub_100F7889:PROC
EXTRN sub_100F7A5B:PROC
EXTRN sub_100F8985:PROC
EXTRN sub_100F8A7D:PROC
EXTRN sub_100F8B57:PROC
EXTRN sub_100F8C48:PROC
.CODE
FUN_10068daa PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 84
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    push ebx
    xor ebx, ebx
    push esi
    mov esi, ecx
    xor ecx, ecx
    mov dword ptr [esi + 84], ebx
    cmp byte ptr [eax], cl
    push edi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 4], 00000010Dh
    mov dword ptr [ebp - 64], ecx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 60], 1
    mov dword ptr [ebp - 36], ebx
    mov dword ptr [ebp - 44], ebx
    mov dword ptr [ebp - 48], ebx
    mov dword ptr [ebp - 28], ebx
    mov dword ptr [ebp - 40], ebx
    mov dword ptr [ebp - 32], ebx
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 52], ebx
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 20], eax
    je L110
L0:
    mov ecx, dword ptr [ebp - 20]
    push 3
    pop edx
    jmp L2
L1:
    cmp al, 95
    je L3
    inc ecx
    mov dword ptr [ebp - 20], ecx
L2:
    mov al, byte ptr [ecx]
    test al, al
    jne L1
L3:
    mov esi, dword ptr [ebp - 56]
    mov eax, ecx
    sub eax, esi
    cmp eax, 15
    ja L109
    mov ecx, eax
    mov ebx, ecx
    shr ecx, 2
    lea edi, [ebp - 84]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, edx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov byte ptr [ebp + eax - 84], 0
    mov eax, dword ptr [ebp - 20]
    cmp byte ptr [eax], 0
    je L4
    inc dword ptr [ebp - 20]
L4:
    mov eax, dword ptr [ebp - 20]
    xor ebx, ebx
    cmp dword ptr [ebp - 60], ebx
    mov dword ptr [ebp - 56], eax
    je L37
    xor edx, edx
    xor edi, edi
L5:
    mov esi, dword ptr [edi + 01010CBF0h]
    lea eax, [ebp - 84]
L6:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L8
    test cl, cl
    je L7
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L8
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L6
L7:
    xor ebx, ebx
    xor eax, eax
    jmp L9
L8:
    sbb eax, eax
    sbb eax, -1
    xor ebx, ebx
L9:
    cmp eax, ebx
    je L10
    add edi, 68
    inc edx
    cmp edi, 000001650h
    jb L5
L10:
    cmp edx, 84
    je L109
    mov esi, dword ptr [ebp - 16]
    mov ecx, dword ptr [esi + 56]
    mov eax, edx
    shl eax, 4
    add eax, ecx
    add eax, edx
    mov eax, dword ptr [eax*4 + 01010CBF8h]
    cmp eax, -6
    ja L17
    je L16
    sub eax, ebx
    je L15
    dec eax
    je L14
    dec eax
    je L13
    dec eax
    je L12
    dec eax
    je L11
    dec eax
    jne L22
    mov dword ptr [ebp - 4], 000000107h
    jmp L22
L11:
    mov dword ptr [ebp - 4], 000000106h
    jmp L22
L12:
    mov dword ptr [ebp - 4], 000000105h
    jmp L22
L13:
    mov dword ptr [ebp - 4], 000000104h
    jmp L22
L14:
    mov dword ptr [ebp - 4], 000000103h
    jmp L22
L15:
    mov dword ptr [ebp - 4], 000000102h
    jmp L22
L16:
    mov dword ptr [ebp - 4], 00000010Ch
    jmp L22
L17:
    cmp eax, -5
    je L21
    cmp eax, -4
    je L20
    cmp eax, -3
    je L19
    cmp eax, -2
    je L18
    cmp eax, -1
    jne L22
    mov dword ptr [esi + 84], 0000007E7h
    jmp L109
L18:
    mov dword ptr [ebp - 4], 000000109h
    jmp L22
L19:
    mov dword ptr [ebp - 4], 000000108h
    jmp L22
L20:
    mov dword ptr [ebp - 4], 00000010Ah
    jmp L22
L21:
    mov dword ptr [ebp - 4], 00000010Bh
L22:
    mov eax, edx
    shl eax, 4
    add eax, edx
    cmp ecx, 6
    mov edx, dword ptr [eax*4 + 01010CBF4h]
    mov dword ptr [ebp - 64], edx
    mov dword ptr [ebp - 60], ebx
    jl L23
    cmp ecx, 9
    jg L23
    cmp dword ptr [ebp - 4], 000000103h
    jl L23
    cmp dword ptr [ebp - 4], 000000107h
    jg L23
    xor eax, eax
    inc eax
    mov dword ptr [ebp - 36], eax
    jmp L24
L23:
    xor eax, eax
    inc eax
L24:
    cmp ecx, 4
    jl L25
    cmp ecx, 5
    jle L26
L25:
    cmp ecx, 6
    jl L27
    cmp ecx, 14
    jg L27
L26:
    cmp dword ptr [ebp - 4], 000000103h
    jl L27
    cmp dword ptr [ebp - 4], 000000107h
    jg L27
    cmp edx, 31
    je L27
    mov dword ptr [ebp - 44], eax
L27:
    cmp ecx, 10
    jl L29
    cmp ecx, 14
    jg L28
    cmp edx, 31
    jne L28
    mov dword ptr [ebp - 48], eax
L28:
    cmp ecx, 10
    jl L29
    cmp ecx, 14
    jg L29
    cmp dword ptr [ebp - 4], 000000103h
    jl L29
    cmp dword ptr [ebp - 4], 000000107h
    jg L29
    mov dword ptr [ebp - 52], eax
L29:
    cmp ecx, 4
    jl L30
    cmp ecx, 5
    jle L31
L30:
    cmp ecx, 10
    jl L32
    cmp ecx, 14
    jg L32
L31:
    cmp edx, 31
    jne L32
    mov dword ptr [ebp - 28], eax
L32:
    cmp ecx, 13
    jl L33
    cmp ecx, 14
    jg L33
    cmp edx, 31
    jne L33
    mov dword ptr [ebp - 40], eax
L33:
    cmp ecx, ebx
    jl L34
    cmp ecx, 5
    jg L34
    cmp edx, 31
    jne L34
    mov dword ptr [ebp - 32], eax
L34:
    cmp edx, 40
    je L35
    cmp edx, 44
    je L35
    cmp edx, 94
    jne L36
L35:
    mov dword ptr [ebp - 24], eax
L36:
    mov dword ptr [esi + 84], 0000007E8h
    jmp L105
L37:
    cmp dword ptr [ebp - 44], ebx
    je L38
    push 4
    mov edi, 01010ECF8h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L38
    or byte ptr [ebp - 6], 16
    mov dword ptr [ebp - 36], ebx
    mov dword ptr [ebp - 44], ebx
    jmp L104
L38:
    cmp dword ptr [ebp - 48], ebx
    je L39
    push 9
    mov edi, 01010ECECh
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L39
    or byte ptr [ebp - 6], 64
    mov dword ptr [ebp - 48], ebx
    jmp L104
L39:
    cmp dword ptr [ebp - 36], ebx
    je L46
    mov edi, 01010ECE8h
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L40
    mov dword ptr [ebp - 8], 003000000h
    jmp L45
L40:
    mov edi, 01010ECE4h
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L41
    mov dword ptr [ebp - 8], 002000000h
    jmp L45
L41:
    mov edi, 01010ECE0h
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L42
    mov dword ptr [ebp - 8], 001000000h
    jmp L45
L42:
    mov edi, 01010ECDCh
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L43
    mov dword ptr [ebp - 8], 00F000000h
    jmp L45
L43:
    mov edi, 01010ECD8h
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L44
    mov dword ptr [ebp - 8], 00E000000h
    jmp L45
L44:
    mov edi, 01010ECD4h
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L109
    mov dword ptr [ebp - 8], 00D000000h
L45:
    mov dword ptr [ebp - 36], ebx
    jmp L104
L46:
    cmp dword ptr [ebp - 28], ebx
    je L50
    xor eax, eax
    mov edi, 01010ECD0h
    lea esi, [ebp - 84]
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L47
    mov eax, 010000000h
    jmp L49
L47:
    push 5
    mov edi, 01010ECC8h
    lea esi, [ebp - 84]
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L48
    mov eax, 018000000h
    jmp L49
L48:
    push 7
    mov edi, 01010ECC0h
    lea esi, [ebp - 84]
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L49
    mov eax, 020000000h
L49:
    or dword ptr [ebp - 12], eax
    xor ebx, ebx
    cmp eax, ebx
    mov dword ptr [ebp - 28], ebx
    je L50
    mov dword ptr [ebp - 40], ebx
    mov dword ptr [ebp - 32], ebx
    jmp L104
L50:
    cmp dword ptr [ebp - 52], ebx
    je L51
    mov edi, 01010ECBCh
    lea esi, [ebp - 84]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L51
    or byte ptr [ebp - 6], 32
    mov dword ptr [ebp - 52], ebx
    jmp L104
L51:
    cmp dword ptr [ebp - 40], ebx
    je L74
    cmp byte ptr [ebp - 84], 0
    lea esi, [ebp - 84]
    je L54
L52:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8985
    test eax, eax
    pop ecx
    je L53
    inc esi
    cmp byte ptr [esi], 0
    jne L52
L53:
    cmp byte ptr [esi], 0
    je L54
    push esi
    call sub_100F7889
    pop ecx
    mov ebx, eax
    jmp L55
L54:
    xor ebx, ebx
L55:
    cmp ebx, 15
    ja L74
    mov al, byte ptr [esi]
    test al, al
    mov byte ptr [ebp + 11], al
    mov dword ptr [ebp - 68], esi
    je L56
    mov byte ptr [esi], 0
    inc esi
L56:
    mov al, byte ptr [esi]
    test al, al
    je L59
L57:
    movsx eax, al
    push eax
    call sub_100F8A7D
    test eax, eax
    pop ecx
    je L58
    inc esi
    mov al, byte ptr [esi]
    test al, al
    jne L57
L58:
    cmp byte ptr [esi], 0
    jne L73
L59:
    push 9
    mov edi, 0101966DCh
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L61
    test ebx, ebx
    je L73
L60:
    and ebx, 15
    shl ebx, 16
    and eax, 15
    or ebx, eax
    or dword ptr [ebp - 12], ebx
    and dword ptr [ebp - 40], 0
    jmp L95
L61:
    push 12
    mov edi, 01010ECB0h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L62
    inc eax
    jmp L60
L62:
    push 13
    mov edi, 01010ECA0h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L63
    push 2
    jmp L72
L63:
    push 7
    mov edi, 010192F8Ch
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L64
    push 3
    jmp L72
L64:
    push 6
    pop eax
    mov edi, 01010EC98h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L65
    push 4
    jmp L72
L65:
    push 9
    mov edi, 0101956A0h
    lea esi, [ebp - 84]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L66
    push 5
    jmp L72
L66:
    push 8
    mov edi, 010195674h
    lea esi, [ebp - 84]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L60
    push 9
    mov edi, 010195668h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L67
    push 7
    jmp L72
L67:
    push 11
    mov edi, 01010EC8Ch
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L68
    push 8
    jmp L72
L68:
    push 10
    pop eax
    mov edi, 01010EC80h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L69
    push 9
    jmp L72
L69:
    push 6
    mov edi, 0101966D4h
    lea esi, [ebp - 84]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L60
    push 4
    mov edi, 010195A98h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L70
    push 11
    jmp L72
L70:
    push 6
    mov edi, 01010EC78h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L71
    push 12
    jmp L72
L71:
    push 7
    mov edi, 01010EC70h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L73
    push 13
L72:
    pop eax
    jmp L60
L73:
    mov eax, dword ptr [ebp - 68]
    mov cl, byte ptr [ebp + 11]
    mov byte ptr [eax], cl
L74:
    xor edx, edx
    cmp dword ptr [ebp - 32], edx
    je L96
    cmp byte ptr [ebp - 84], dl
    lea esi, [ebp - 84]
    je L77
L75:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8B57
    test eax, eax
    pop ecx
    je L76
    inc esi
    cmp byte ptr [esi], 0
    jne L75
L76:
    cmp byte ptr [esi], 0
    je L77
    push esi
    call sub_100F7A5B
    pop ecx
    mov ebx, eax
    jmp L78
L77:
    xor ebx, ebx
L78:
    cmp ebx, 15
    ja L109
    cmp byte ptr [esi], 0
    je L79
    mov byte ptr [esi], 0
    inc esi
L79:
    mov al, byte ptr [esi]
    test al, al
    je L82
L80:
    movsx eax, al
    push eax
    call sub_100F8C48
    test eax, eax
    pop ecx
    je L81
    inc esi
    mov al, byte ptr [esi]
    test al, al
    jne L80
L81:
    cmp byte ptr [esi], 0
    jne L109
L82:
    push 9
    mov edi, 0101966DCh
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L94
    push 12
    mov edi, 01010ECB0h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L83
    inc eax
    jmp L94
L83:
    push 13
    mov edi, 01010ECA0h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L84
    push 2
    jmp L93
L84:
    push 7
    mov edi, 010192F8Ch
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L85
    push 3
    jmp L93
L85:
    push 6
    mov edi, 01010EC98h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L86
    push 4
    jmp L93
L86:
    push 9
    mov edi, 0101956A0h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L87
    push 5
    jmp L93
L87:
    push 8
    pop eax
    mov edi, 010195674h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L88
    push 6
    jmp L93
L88:
    push 9
    mov edi, 010195668h
    lea esi, [ebp - 84]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L89
    push 7
    jmp L93
L89:
    push 11
    mov edi, 01010EC8Ch
    lea esi, [ebp - 84]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L94
    push 10
    pop eax
    mov edi, 01010EC80h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L90
    push 9
    jmp L93
L90:
    push 6
    mov edi, 0101966D4h
    lea esi, [ebp - 84]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L94
    push 4
    mov edi, 010195A98h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L91
    push 11
    jmp L93
L91:
    push 6
    mov edi, 01010EC78h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L92
    push 12
    jmp L93
L92:
    push 7
    mov edi, 01010EC70h
    lea esi, [ebp - 84]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L109
    push 13
L93:
    pop eax
L94:
    and ebx, 15
    shl ebx, 16
    and eax, 15
    or ebx, eax
    and dword ptr [ebp - 32], 0
    mov dword ptr [ebp - 12], ebx
L95:
    and dword ptr [ebp - 28], 0
    jmp L103
L96:
    cmp dword ptr [ebp - 24], edx
    je L109
    push 3
    pop eax
    mov edi, 01010EC6Ch
    lea esi, [ebp - 84]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L97
    mov dword ptr [ebp - 12], 1
    jmp L102
L97:
    mov edi, 01010EC68h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L98
    mov dword ptr [ebp - 12], 2
    jmp L102
L98:
    mov edi, 01010EC64h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L99
    mov dword ptr [ebp - 12], eax
    jmp L102
L99:
    mov edi, 01010EC60h
    lea esi, [ebp - 84]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L100
    mov dword ptr [ebp - 12], 4
    jmp L102
L100:
    mov edi, 01010EC5Ch
    lea esi, [ebp - 84]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L101
    mov dword ptr [ebp - 12], 5
    jmp L102
L101:
    mov ecx, eax
    mov edi, 01010EC58h
    lea esi, [ebp - 84]
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L109
    mov dword ptr [ebp - 12], 6
L102:
    mov dword ptr [ebp - 24], edx
L103:
    xor ebx, ebx
L104:
    mov esi, dword ptr [ebp - 16]
L105:
    mov eax, dword ptr [ebp - 20]
    cmp byte ptr [eax], 0
    jne L0
    mov ecx, dword ptr [ebp - 64]
    cmp ecx, 40
    jne L106
    cmp dword ptr [ebp - 24], ebx
    jne L108
    mov eax, dword ptr [esi + 56]
    cmp dword ptr [eax*4 + 01010E248h], -1
    je L109
    push 41
    pop ecx
    mov dword ptr [ebp - 4], 00000010Ch
L106:
    cmp ecx, 44
    jne L107
    cmp dword ptr [ebp - 24], ebx
    jne L108
    mov eax, dword ptr [esi + 56]
    cmp dword ptr [eax*4 + 01010E290h], -1
    je L109
    push 45
    pop ecx
    mov dword ptr [ebp - 4], 00000010Ch
L107:
    cmp ecx, 94
    jne L108
    cmp dword ptr [ebp - 24], ebx
    jne L109
L108:
    cmp dword ptr [ebp - 32], ebx
    je L110
L109:
    mov eax, 00000010Dh
    jmp L111
L110:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [esi + 68], eax
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [esi + 72], eax
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [esi + 64], ecx
    mov dword ptr [esi + 84], ebx
L111:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10068daa ENDP
END
