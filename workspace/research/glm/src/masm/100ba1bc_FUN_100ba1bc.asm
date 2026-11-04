.686
.MODEL FLAT, C
EXTRN sub_10086BC3:PROC
EXTRN sub_1008B287:PROC
EXTRN sub_1008B3CD:PROC
EXTRN sub_1008B6B9:PROC
EXTRN sub_100BA23B:PROC
EXTRN sub_100F75B3:PROC
EXTRN sub_100F76EB:PROC
EXTRN sub_100F790A:PROC
EXTRN sub_100F7AAB:PROC
EXTRN sub_100F7CD7:PROC
EXTRN sub_100F7D70:PROC
EXTRN sub_100F7ECB:PROC
EXTRN sub_100F7ED3:PROC
EXTRN sub_100F7EDB:PROC
EXTRN sub_100F874C:PROC
EXTRN sub_100F8760:PROC
.CODE
FUN_100ba1bc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    xor ebx, ebx
    mov esi, ecx
    cmp dword ptr [esi + 4], ebx
    push edi
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 24], ebx
    jbe L7
L0:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [eax + 4]
    and dword ptr [eax + 16], 0
    test dh, 4
    jne L6
    xor edi, edi
    mov dword ptr [eax + 8], edi
    cmp dword ptr [esi + 8], edi
    jbe L3
L1:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edi*4]
    cmp dword ptr [ecx + 4], ebx
    jne L2
    mov ecx, dword ptr [ecx + 12]
    inc ecx
    cmp ecx, dword ptr [eax + 8]
    jbe L2
    mov dword ptr [eax + 8], ecx
L2:
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L1
L3:
    test dh, 1
    je L4
    test dh, 8
    jne L4
    and edx, 0FFFFFFBFh
    mov dword ptr [eax + 4], edx
L4:
    mov ecx, dword ptr [eax + 4]
    test cl, 16
    je L5
    test ch, 10
    jne L5
    and ecx, 0FFFFFFBFh
    mov dword ptr [eax + 4], ecx
L5:
    mov ecx, dword ptr [eax + 4]
    test cl, cl
    jns L6
    test ch, 8
    jne L6
    cmp dword ptr [eax + 8], 1
    jne L6
    and ecx, 0FFFFFFBFh
    mov dword ptr [eax + 4], ecx
L6:
    inc ebx
    cmp ebx, dword ptr [esi + 4]
    jb L0
L7:
    mov edi, dword ptr [ebp + 12]
    shl edi, 3
    push edi
    call sub_100F790A
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L57
    and dword ptr [ebp - 4], 0
    mov ecx, edi
    mov edi, dword ptr [ebp - 8]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [esi + 4], 0
    jbe L16
L8:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    mov ecx, eax
    and ecx, dword ptr [ebp + 16]
    cmp ecx, dword ptr [ebp + 16]
    jne L15
    mov ecx, dword ptr [ebp + 20]
    test ecx, eax
    jne L15
    test al, 64
    je L15
    test ah, 8
    je L15
    cmp dword ptr [edi + 8], 0
    je L15
    push dword ptr [ebp - 4]
    or dword ptr [edi + 16], 0FFFFFFFFh
    push dword ptr [ebp + 24]
    lea eax, [ebp - 20]
    push eax
    push dword ptr [edi]
    mov ecx, esi
    call sub_100BA23B
    mov ebx, eax
    test ebx, ebx
    jl L75
    mov ebx, dword ptr [ebp - 20]
    test ebx, ebx
    je L12
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F76EB
    pop ecx
    movsx ecx, byte ptr [ebp + 24]
    cmp ecx, eax
    jne L12
    lea eax, [ebx + 1]
    mov dword ptr [ebp - 12], eax
    movsx eax, byte ptr [eax]
    push eax
    call sub_100F874C
    test eax, eax
    pop ecx
    je L12
    add ebx, 2
    jmp L10
L9:
    inc ebx
L10:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8760
    test eax, eax
    pop ecx
    jne L9
    mov bl, byte ptr [ebx]
    test bl, bl
    je L11
    cmp bl, 59
    jne L12
L11:
    push dword ptr [ebp - 12]
    call sub_100F75B3
    pop ecx
    mov dword ptr [edi + 16], eax
L12:
    mov eax, dword ptr [ebp + 12]
    cmp dword ptr [edi + 16], eax
    jae L24
    and dword ptr [ebp - 12], 0
    cmp dword ptr [edi + 8], 0
    jbe L15
L13:
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp - 12]
    add eax, ecx
    cmp eax, dword ptr [ebp + 12]
    jae L29
    mov ecx, dword ptr [ebp - 8]
    lea ebx, [ecx + eax*8]
    cmp dword ptr [ebx], 0
    je L14
    push eax
    movsx eax, byte ptr [ebp + 24]
    push eax
    push 010119FB4h
    push 000001194h
    push 0
    push esi
    call sub_1008B287
    add esp, 24
L14:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebx + 4], eax
    inc eax
    cmp eax, dword ptr [edi + 8]
    mov dword ptr [ebp - 12], eax
    jb L13
L15:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 4]
    jb L8
L16:
    mov eax, dword ptr [esi + 4]
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L19
    mov edx, dword ptr [esi + 16]
    mov edi, eax
L17:
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [eax + 4]
    mov ebx, ecx
    and ebx, dword ptr [ebp + 16]
    cmp ebx, dword ptr [ebp + 16]
    jne L18
    test dword ptr [ebp + 20], ecx
    jne L18
    test cl, 64
    je L18
    test ch, 8
    jne L18
    cmp dword ptr [eax + 8], 0
    je L18
    inc dword ptr [ebp - 4]
L18:
    add edx, 4
    dec edi
    jne L17
L19:
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    push eax
    call sub_100F7AAB
    pop ecx
    xor ecx, ecx
    cmp eax, ecx
    mov dword ptr [ebp - 16], eax
    je L57
    cmp dword ptr [esi + 4], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L22
L20:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov edi, edx
    and edi, dword ptr [ebp + 16]
    cmp edi, dword ptr [ebp + 16]
    jne L21
    test dword ptr [ebp + 20], edx
    jne L21
    test dl, 64
    je L21
    test dh, 8
    jne L21
    cmp dword ptr [eax + 8], 0
    je L21
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 16]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + edx*4], ecx
L21:
    inc ecx
    cmp ecx, dword ptr [esi + 4]
    jb L20
L22:
    mov edi, dword ptr [ebp - 16]
    push esi
    push dword ptr [ebp - 4]
    push edi
    push 0100B9661h
    call sub_10086BC3
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebp - 4], 0
    jbe L39
    mov dword ptr [ebp - 12], edi
L23:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + eax*4]
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    jbe L36
    mov edi, dword ptr [ecx + 8]
    jmp L32
L24:
    mov ecx, dword ptr [esi + 8]
    xor edx, edx
    test ecx, ecx
    jbe L27
    mov eax, dword ptr [esi + 20]
    mov dword ptr [ebp + 12], ecx
L25:
    mov ecx, dword ptr [eax]
    mov ebx, dword ptr [ecx + 4]
    cmp ebx, dword ptr [ebp - 4]
    jne L26
    mov edx, ecx
L26:
    add eax, 4
    dec dword ptr [ebp + 12]
    jne L25
    test edx, edx
    je L27
    mov eax, dword ptr [edx + 96]
    jmp L28
L27:
    xor eax, eax
L28:
    movsx ecx, byte ptr [ebp + 24]
    push ecx
    push dword ptr [edi]
    push 010119F40h
    push 00000119Dh
    push eax
    push esi
    call sub_1008B3CD
    add esp, 24
    jmp L69
L29:
    movsx eax, byte ptr [ebp + 24]
    sub eax, 98
    je L65
    dec eax
    je L61
    sub eax, 6
    je L56
    sub eax, 10
    je L30
    sub eax, 3
    jne L69
    jmp L59
L30:
    push 010119F18h
    push 00000119Eh
    jmp L68
L31:
    mov edx, dword ptr [ebp - 8]
    cmp dword ptr [edx + eax*8], 0
    je L33
    inc eax
L32:
    cmp eax, dword ptr [ebp + 12]
    jb L31
L33:
    cmp eax, dword ptr [ebp + 12]
    mov edx, eax
    jae L35
L34:
    mov ebx, dword ptr [ebp - 8]
    cmp dword ptr [ebx + edx*8], 0
    jne L35
    inc edx
    cmp edx, dword ptr [ebp + 12]
    jb L34
L35:
    mov ebx, edx
    sub ebx, eax
    cmp ebx, edi
    jae L36
    cmp edx, dword ptr [ebp + 12]
    mov eax, edx
    jb L32
L36:
    mov edx, dword ptr [ecx + 8]
    lea edi, [edx + eax]
    cmp edi, dword ptr [ebp + 12]
    ja L55
    xor edi, edi
    test edx, edx
    jbe L38
    mov edx, dword ptr [ebp - 8]
    lea edx, [edx + eax*8]
L37:
    mov ebx, dword ptr [ebp - 12]
    mov ebx, dword ptr [ebx]
    mov dword ptr [edx + 4], edi
    mov dword ptr [edx], ebx
    inc edi
    add edx, 8
    cmp edi, dword ptr [ecx + 8]
    jb L37
L38:
    inc dword ptr [ebp - 20]
    add dword ptr [ebp - 12], 4
    mov dword ptr [ecx + 16], eax
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 4]
    jb L23
L39:
    xor ebx, ebx
    xor ecx, ecx
    cmp dword ptr [esi + 8], ebx
    jbe L41
L40:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [esi + 16]
    mov edx, dword ptr [eax + 4]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 16]
    add dword ptr [eax + 12], edx
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L40
L41:
    xor ecx, ecx
    cmp dword ptr [esi + 4], ebx
    jbe L43
L42:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 16]
    add dword ptr [eax + 8], edx
    inc ecx
    mov dword ptr [eax + 16], ebx
    cmp ecx, dword ptr [esi + 4]
    jb L42
L43:
    cmp dword ptr [esi + 4], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L52
L44:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    mov ecx, eax
    and ecx, dword ptr [ebp + 16]
    cmp ecx, dword ptr [ebp + 16]
    jne L51
    mov ecx, dword ptr [ebp + 20]
    test ecx, eax
    jne L51
    test al, 64
    jne L51
    test ah, 8
    jne L51
    mov eax, dword ptr [edi + 8]
    cmp eax, ebx
    je L51
    shl eax, 2
    push eax
    call sub_100F7CD7
    mov edx, eax
    cmp edx, ebx
    pop ecx
    mov dword ptr [ebp - 24], edx
    je L57
    mov ecx, dword ptr [edi + 8]
    shl ecx, 2
    mov ebx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    mov edi, edx
    rep stosd dword ptr es:[edi], eax
    mov ecx, ebx
    and ecx, 3
    xor ebx, ebx
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [esi + 8], ebx
    mov dword ptr [ebp - 12], ebx
    jbe L50
L45:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp - 4]
    cmp dword ptr [eax + 4], ecx
    jne L49
    mov ecx, dword ptr [eax + 12]
    cmp dword ptr [edx + ecx*4], -1
    jne L48
    xor ecx, ecx
    cmp dword ptr [ebp + 12], ebx
    jbe L58
    mov edi, dword ptr [ebp - 8]
L46:
    cmp dword ptr [edi + ecx*8], 0
    je L47
    inc ecx
    cmp ecx, dword ptr [ebp + 12]
    jb L46
L47:
    cmp ecx, dword ptr [ebp + 12]
    jae L58
    mov ebx, dword ptr [ebp - 4]
    lea edi, [edi + ecx*8]
    mov dword ptr [edi], ebx
    mov ebx, dword ptr [eax + 12]
    mov dword ptr [edi + 4], ebx
    mov edi, dword ptr [eax + 12]
    mov dword ptr [edx + edi*4], ecx
L48:
    mov ecx, dword ptr [eax + 12]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [eax + 12], ecx
    xor ebx, ebx
L49:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 8]
    jb L45
L50:
    push edx
    call sub_100F7D70
    pop ecx
    mov dword ptr [ebp - 24], ebx
L51:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 4]
    jb L44
L52:
    mov edi, dword ptr [ebp + 8]
    cmp edi, -1
    je L74
    xor edx, edx
    cmp dword ptr [esi + 8], edx
    jbe L73
L53:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ebx, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    mov ebx, ecx
    and ebx, dword ptr [ebp + 16]
    cmp ebx, dword ptr [ebp + 16]
    jne L72
    mov ebx, dword ptr [ebp + 20]
    test ebx, ecx
    jne L72
    test ch, 1
    je L71
    test ecx, 000040000h
    je L70
    mov ecx, dword ptr [esi + 000000184h]
L54:
    mov dword ptr [eax + 4], ecx
    jmp L72
L55:
    mov al, byte ptr [ebp + 24]
    cmp al, 118
    je L59
    cmp al, 99
    je L61
    cmp al, 115
    je L63
    cmp al, 98
    je L65
    cmp al, 105
    jne L69
L56:
    push 010119ED0h
    jmp L67
L57:
    mov ebx, 08007000Eh
    jmp L75
L58:
    mov al, byte ptr [ebp + 24]
    cmp al, 118
    jne L60
L59:
    push 010119EA8h
    push 00000119Ah
    jmp L68
L60:
    cmp al, 99
    jne L62
L61:
    push 010119E50h
    push 00000119Bh
    jmp L68
L62:
    cmp al, 115
    jne L64
L63:
    push 010119F18h
    push 0000011C2h
    jmp L68
L64:
    cmp al, 98
    jne L66
L65:
    push 010119DF8h
    push 0000011C6h
    jmp L68
L66:
    cmp al, 105
    jne L69
    push 010119D98h
L67:
    push 0000011C7h
L68:
    push 0
    push esi
    call sub_1008B6B9
    add esp, 16
L69:
    mov ebx, 080004005h
    jmp L75
L70:
    test ch, 8
    jne L72
    mov ecx, dword ptr [esi + 120]
    jmp L54
L71:
    mov dword ptr [eax + 4], edi
L72:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L53
L73:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + edi*4]
    and dword ptr [eax + 16], 0
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + edi*4]
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [ecx + 8], eax
    cmp edi, dword ptr [esi + 124]
    jne L74
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [esi + 120]
    mov ecx, dword ptr [edx + ecx*4]
    and dword ptr [ecx + 16], 0
    mov ecx, dword ptr [esi + 120]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ecx + 8], eax
L74:
    xor ebx, ebx
L75:
    push dword ptr [ebp - 8]
    call sub_100F7ECB
    push dword ptr [ebp - 16]
    call sub_100F7ED3
    push dword ptr [ebp - 24]
    call sub_100F7EDB
    add esp, 12
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    leave
    ret 20
FUN_100ba1bc ENDP
END
