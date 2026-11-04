.686
.MODEL FLAT, C
EXTRN sub_10065555:PROC
EXTRN sub_100655C4:PROC
EXTRN sub_100655ED:PROC
EXTRN sub_1006561C:PROC
EXTRN sub_10065648:PROC
EXTRN sub_100656CE:PROC
EXTRN sub_100656ED:PROC
EXTRN sub_10082DDC:PROC
EXTRN sub_10082EE4:PROC
EXTRN sub_10082FCD:PROC
EXTRN sub_10082FD8:PROC
EXTRN sub_10083037:PROC
EXTRN sub_100831DC:PROC
EXTRN sub_1008323A:PROC
EXTRN sub_100833A6:PROC
EXTRN sub_100835F0:PROC
EXTRN sub_10083A3E:PROC
EXTRN sub_10083EE9:PROC
EXTRN sub_10083FE8:PROC
EXTRN sub_10099D2A:PROC
EXTRN sub_1009A2BE:PROC
.CODE
FUN_1009acc9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000160h
    mov eax, dword ptr [ebp + 16]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    mov dword ptr [ebp - 20], ecx
    je L0
    mov dword ptr [eax], ebx
L0:
    mov eax, dword ptr [ebp + 20]
    cmp eax, ebx
    je L1
    mov dword ptr [eax], ebx
L1:
    mov eax, dword ptr [ebp + 12]
    xor edx, edx
    cmp eax, ebx
    je L5
L2:
    mov ecx, dword ptr [eax + 8]
    cmp ecx, ebx
    je L3
    cmp dword ptr [ecx + 4], 13
    jne L3
    mov ecx, dword ptr [ecx + 16]
    cmp ecx, ebx
    je L3
    cmp dword ptr [ecx + 4], 9
    jne L3
    mov eax, dword ptr [eax + 12]
    inc edx
    cmp eax, ebx
    jne L2
L3:
    cmp eax, ebx
    jne L4
    cmp edx, 4
    jbe L5
L4:
    xor eax, eax
    inc eax
    jmp L90
L5:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    push esi
    mov dword ptr [ebp - 4], 94
    mov dword ptr [ebp - 16], eax
    push edi
L6:
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 16]
    add eax, ebx
    shr eax, 1
    mov ecx, eax
    imul ecx, ecx, 0000000A4h
    mov esi, dword ptr [ecx + 0101107FCh]
L7:
    mov dl, byte ptr [edi]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L9
    test cl, cl
    je L8
    mov dl, byte ptr [edi + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L9
    inc edi
    inc edi
    inc esi
    inc esi
    test cl, cl
    jne L7
L8:
    xor ecx, ecx
    jmp L10
L9:
    sbb ecx, ecx
    sbb ecx, -1
L10:
    test ecx, ecx
    jle L11
    lea ebx, [eax + 1]
    jmp L12
L11:
    jge L13
    mov dword ptr [ebp - 4], eax
L12:
    cmp ebx, dword ptr [ebp - 4]
    jb L6
    jmp L25
L13:
    test eax, eax
    lea ecx, [eax + 1]
    mov ebx, eax
    mov dword ptr [ebp - 4], ecx
    jbe L19
    imul eax, eax, 0000000A4h
    lea edi, [eax + 010110758h]
L14:
    mov ecx, dword ptr [edi]
    mov esi, dword ptr [ebp - 16]
L15:
    mov al, byte ptr [esi]
    mov dl, al
    cmp al, byte ptr [ecx]
    jne L17
    test dl, dl
    je L16
    mov al, byte ptr [esi + 1]
    mov dl, al
    cmp al, byte ptr [ecx + 1]
    jne L17
    inc esi
    inc esi
    inc ecx
    inc ecx
    test dl, dl
    jne L15
L16:
    xor ecx, ecx
    jmp L18
L17:
    sbb ecx, ecx
    sbb ecx, -1
L18:
    test ecx, ecx
    jne L19
    dec ebx
    sub edi, 0000000A4h
    test ebx, ebx
    ja L14
L19:
    mov edi, dword ptr [ebp - 4]
    cmp edi, 94
    jae L25
    imul edi, edi, 0000000A4h
    add edi, 0101107FCh
L20:
    mov eax, dword ptr [edi]
    mov esi, dword ptr [ebp - 16]
L21:
    mov dl, byte ptr [esi]
    mov cl, dl
    cmp dl, byte ptr [eax]
    jne L23
    test cl, cl
    je L22
    mov dl, byte ptr [esi + 1]
    mov cl, dl
    cmp dl, byte ptr [eax + 1]
    jne L23
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L21
L22:
    xor eax, eax
    jmp L24
L23:
    sbb eax, eax
    sbb eax, -1
L24:
    test eax, eax
    jne L25
    inc dword ptr [ebp - 4]
    add edi, 0000000A4h
    cmp dword ptr [ebp - 4], 94
    jb L20
L25:
    cmp ebx, dword ptr [ebp - 4]
    je L57
    mov dword ptr [ebp - 16], ebx
    jae L56
    imul ebx, ebx, 0000000A4h
    add ebx, 0101107F8h
    mov dword ptr [ebp - 12], ebx
L26:
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 80]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push 30
    pop eax
    lea edi, [ebp - 40]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov esi, dword ptr [ebp - 12]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push 5
    pop eax
    lea edi, [ebp - 60]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    lea ecx, [ebp - 000000088h]
    stosd dword ptr es:[edi], eax
    call sub_10082FCD
    lea ecx, [ebp - 0000000ACh]
    call sub_10082FD8
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    mov dword ptr [ebp - 8], 1
    je L41
    lea edi, [esi + 44]
L27:
    cmp dword ptr [ebp - 8], 5
    jae L40
    cmp dword ptr [edi - 8], 0
    je L40
    mov eax, dword ptr [ebx + 8]
    mov esi, dword ptr [eax + 16]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ebp + eax*4 - 60]
    cmp eax, 5
    je L31
    test eax, eax
    jne L28
    mov ecx, dword ptr [esi + 16]
    cmp ecx, 1
    je L31
    cmp ecx, 2
    je L31
L28:
    mov ecx, dword ptr [esi + 16]
    test ecx, ecx
    jne L29
    test eax, eax
    je L32
    cmp eax, 1
    je L32
    cmp eax, 2
    jmp L30
L29:
    cmp ecx, eax
L30:
    jne L40
    jmp L32
L31:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [esi + 16]
    shl eax, 2
    mov dword ptr [ebp + eax - 60], ecx
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [ebp + eax - 100], ecx
L32:
    mov eax, dword ptr [edi + 8]
    cmp dword ptr [ebp + eax*4 - 40], 30
    jne L33
    mov ecx, dword ptr [esi + 20]
    shl eax, 2
    mov dword ptr [ebp + eax - 40], ecx
    mov ecx, dword ptr [edi + 12]
    mov dword ptr [ebp + eax - 100], ecx
    jmp L34
L33:
    mov eax, dword ptr [ebp + eax*4 - 40]
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [ebp - 116], eax
    mov eax, dword ptr [esi + 20]
    mov dword ptr [ebp - 000000098h], eax
    mov eax, dword ptr [edi + 8]
    lea eax, [ebp + eax*4 - 40]
    push eax
    lea eax, [ebp - 0000000ACh]
    push eax
    lea eax, [ebp - 000000088h]
    push eax
    call sub_1009A2BE
    test eax, eax
    jl L40
L34:
    mov edx, dword ptr [esi + 16]
    test edx, edx
    je L38
    mov eax, dword ptr [edi + 16]
    test eax, eax
    jge L35
    mov ecx, dword ptr [esi + 24]
    not eax
    lea eax, [ebp + eax*4 - 80]
    cmp dword ptr [eax], ecx
    jbe L36
    mov dword ptr [eax], ecx
    jmp L36
L35:
    cmp dword ptr [esi + 24], eax
    jb L40
L36:
    test edx, edx
    je L38
    mov eax, dword ptr [edi + 20]
    test eax, eax
    jge L37
    mov ecx, dword ptr [esi + 28]
    not eax
    lea eax, [ebp + eax*4 - 80]
    cmp dword ptr [eax], ecx
    jbe L38
    mov dword ptr [eax], ecx
    jmp L38
L37:
    cmp dword ptr [esi + 28], eax
    jb L40
L38:
    test byte ptr [edi - 4], 32
    je L39
    mov ecx, dword ptr [ebp - 20]
    push esi
    call sub_10099D2A
    test eax, eax
    jne L40
L39:
    mov ebx, dword ptr [ebx + 12]
    inc dword ptr [ebp - 8]
    add edi, 32
    test ebx, ebx
    jne L27
L40:
    test ebx, ebx
    jne L55
    mov eax, dword ptr [ebp - 8]
    cmp eax, 5
    mov esi, dword ptr [ebp - 12]
    jae L41
    shl eax, 5
    cmp dword ptr [eax + esi + 4], ebx
    jne L55
L41:
    cmp dword ptr [esi + 8], 0
    je L43
    mov eax, dword ptr [esi + 12]
    lea eax, [ebp + eax*4 - 60]
    cmp dword ptr [eax], 5
    jne L42
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax], ecx
L42:
    mov eax, dword ptr [esi + 20]
    lea eax, [ebp + eax*4 - 40]
    cmp dword ptr [eax], 30
    jne L43
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax], ecx
L43:
    mov ebx, dword ptr [ebp - 12]
    and dword ptr [ebp - 8], 0
    add ebx, 24
L44:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx - 8]
    lea ecx, [ebp + ecx*4 - 60]
    mov esi, dword ptr [ecx]
    push 5
    pop edi
    cmp esi, edi
    je L49
    test esi, esi
    jne L47
    mov edx, dword ptr [eax]
    cmp edx, 1
    je L45
    cmp edx, 2
    jne L47
L45:
    mov dword ptr [ecx], edx
    jmp L48
L46:
    cmp esi, ecx
    je L48
    add eax, 4
L47:
    mov ecx, dword ptr [eax]
    cmp ecx, edi
    jne L46
L48:
    cmp dword ptr [eax], edi
    je L54
    jmp L50
L49:
    test eax, eax
    je L50
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
L50:
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [ebx]
    lea ecx, [ebp + ecx*4 - 40]
    mov edi, dword ptr [ecx]
    cmp edi, 30
    mov eax, esi
    jne L59
    test eax, eax
    je L52
    mov eax, dword ptr [eax]
L51:
    mov dword ptr [ecx], eax
L52:
    mov eax, dword ptr [ebp - 8]
    lea eax, [ebp + eax*4 - 80]
    cmp dword ptr [eax], -1
    jne L53
    mov dword ptr [eax], 1
L53:
    inc dword ptr [ebp - 8]
    add ebx, 32
    cmp dword ptr [ebp - 8], 5
    jb L44
L54:
    cmp dword ptr [ebp - 8], 5
    je L56
L55:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    add dword ptr [ebp - 12], 0000000A4h
    cmp eax, dword ptr [ebp - 4]
    jb L26
L56:
    mov edi, dword ptr [ebp - 16]
    cmp edi, dword ptr [ebp - 4]
    jne L61
L57:
    xor eax, eax
    inc eax
    jmp L89
L58:
    cmp edi, edx
    je L60
    add eax, 4
L59:
    mov edx, dword ptr [eax]
    cmp edx, 30
    jne L58
L60:
    cmp dword ptr [eax], 30
    jne L52
    mov eax, dword ptr [esi]
    jmp L51
L61:
    cmp dword ptr [ebp + 16], 0
    je L84
    push 5
    lea esi, [ebp - 000000160h]
    pop edi
L62:
    mov ecx, esi
    call sub_1008323A
    add esi, 36
    dec edi
    jne L62
    mov ebx, dword ptr [ebp - 16]
    xor edi, edi
    imul ebx, ebx, 0000000A4h
    lea eax, [ebp - 000000148h]
    lea ecx, [ebx + 010110814h]
L63:
    cmp dword ptr [ecx - 24], 0
    je L68
    mov edx, dword ptr [ecx - 20]
    test edx, edx
    mov dword ptr [ebp + 12], edx
    je L67
    mov edx, dword ptr [ecx - 16]
    mov edx, dword ptr [ebp + edx*4 - 60]
    mov dword ptr [eax - 8], edx
    mov edx, dword ptr [ecx - 8]
    mov edx, dword ptr [ebp + edx*4 - 40]
    mov dword ptr [eax - 4], edx
    mov edx, dword ptr [ecx]
    test edx, edx
    jge L64
    not edx
    mov edx, dword ptr [ebp + edx*4 - 80]
L64:
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 4]
    test edx, edx
    jge L65
    not edx
    mov edx, dword ptr [ebp + edx*4 - 80]
L65:
    mov esi, dword ptr [ebp + 12]
    and esi, 000000C00h
    test edi, edi
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], esi
    je L66
    test byte ptr [ebp + 12], 32
    jne L67
L66:
    or esi, 000000200h
    mov dword ptr [eax + 8], esi
L67:
    inc edi
    add ecx, 32
    add eax, 36
    cmp edi, 5
    jb L63
L68:
    cmp dword ptr [ebp - 000000150h], 1
    je L69
    cmp dword ptr [ebp - 000000150h], 2
    jne L70
L69:
    cmp dword ptr [ebp - 000000144h], 1
    jne L70
    cmp dword ptr [ebp - 000000148h], 1
    jne L70
    and dword ptr [ebp - 000000150h], 0
L70:
    push 64
    call sub_10065555
    test eax, eax
    je L71
    mov ecx, eax
    call sub_100833A6
    mov esi, eax
    mov dword ptr [ebp - 4], esi
    jmp L72
L71:
    and dword ptr [ebp - 4], 0
    mov esi, dword ptr [ebp - 4]
L72:
    test esi, esi
    je L91
    cmp dword ptr [ebx + 010110800h], 0
    je L73
    lea ecx, [ebp - 000000160h]
    call sub_10083EE9
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L91
L73:
    add esi, 36
    lea eax, [ebx + 01011081Ch]
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 8], 1
    lea edi, [ebp - 000000120h]
    mov dword ptr [ebp + 12], eax
L74:
    mov eax, dword ptr [ebp + 12]
    cmp dword ptr [eax], 0
    je L83
    push 20
    call sub_100655C4
    test eax, eax
    je L75
    push 010114A3Ch
    push 0
    push 0
    mov ecx, eax
    call sub_10082DDC
    jmp L76
L75:
    xor eax, eax
L76:
    test eax, eax
    mov dword ptr [esi], eax
    je L91
    push 48
    call sub_100655ED
    test eax, eax
    je L77
    xor ecx, ecx
    push ecx
    push ecx
    push ecx
    push 1
    mov ecx, eax
    call sub_100831DC
    mov ebx, eax
    jmp L78
L77:
    xor ebx, ebx
L78:
    test ebx, ebx
    je L91
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    push 48
    mov dword ptr [eax + 8], ebx
    call sub_1006561C
    test eax, eax
    je L79
    push dword ptr [ebp + 8]
    mov ecx, eax
    call sub_10083037
    jmp L80
L79:
    xor eax, eax
L80:
    test eax, eax
    mov dword ptr [ebx + 20], eax
    je L91
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx]
    push 64
    mov dword ptr [eax + 24], ecx
    call sub_10065648
    test eax, eax
    je L81
    mov ecx, eax
    call sub_100835F0
    mov esi, eax
    jmp L82
L81:
    xor esi, esi
L82:
    test esi, esi
    je L91
    mov dword ptr [ebx + 24], esi
    or dword ptr [esi + 16], 0FFFFFFFFh
    mov eax, dword ptr [edi - 4]
    imul eax, dword ptr [edi]
    mov dword ptr [esi + 20], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esi + 24], 2
    mov eax, dword ptr [eax + 4]
    lea ecx, [edi - 28]
    mov dword ptr [esi + 28], eax
    call sub_10083FE8
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L91
    mov eax, dword ptr [ebp - 12]
    mov esi, dword ptr [eax]
    add dword ptr [ebp + 12], 32
    add esi, 12
    inc dword ptr [ebp - 8]
    add edi, 36
    cmp dword ptr [ebp - 8], 5
    mov dword ptr [ebp - 12], esi
    jb L74
L83:
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 16]
    mov dword ptr [eax], ecx
L84:
    mov ebx, dword ptr [ebp + 20]
    xor esi, esi
    cmp ebx, esi
    je L88
    push 20
    call sub_100656CE
    cmp eax, esi
    je L85
    push 010114A34h
    push esi
    push esi
    mov ecx, eax
    call sub_10082EE4
    mov esi, eax
L85:
    test esi, esi
    je L91
    push 64
    call sub_100656ED
    test eax, eax
    je L86
    push dword ptr [ebp + 8]
    imul edi, edi, 0000000A4h
    push dword ptr [edi + 0101107F8h]
    mov ecx, eax
    push 2
    call sub_10083A3E
    jmp L87
L86:
    xor eax, eax
L87:
    test eax, eax
    mov dword ptr [esi + 8], eax
    je L91
    mov dword ptr [ebx], esi
L88:
    xor eax, eax
L89:
    pop edi
    pop esi
L90:
    pop ebx
    leave
    ret 16
L91:
    mov eax, 08007000Eh
    jmp L89
FUN_1009acc9 ENDP
END
