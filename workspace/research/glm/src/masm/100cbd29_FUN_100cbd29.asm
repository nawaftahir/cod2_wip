.686
.MODEL FLAT, C
EXTRN sub_100CBE62:PROC
EXTRN sub_100CBF12:PROC
EXTRN sub_100CBF1D:PROC
EXTRN sub_100CBF24:PROC
EXTRN sub_100CBF4F:PROC
EXTRN sub_100CC022:PROC
EXTRN sub_100CC094:PROC
.CODE
FUN_100cbd29 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 84
    mov eax, dword ptr [ebp + 8]
    and dword ptr [ebp - 64], 0
    push ebx
    mov ebx, ecx
    lea ecx, [eax + 1]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [ebx + 60]
    mov edx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 4]
    push esi
    mov esi, dword ptr [ecx + 24]
    mov dword ptr [ebp - 16], eax
    mov eax, edx
    push edi
    mov edi, dword ptr [ebx + 52]
    shl eax, 2
    cmp dword ptr [eax + edi], 0
    mov esi, dword ptr [eax + esi]
    mov dword ptr [ebp - 84], edx
    jne L51
    mov esi, dword ptr [esi + 16]
    mov esi, dword ptr [esi]
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + esi*4]
    mov esi, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + 24]
    mov edi, dword ptr [ebx + 20]
    mov dword ptr [ebp - 36], esi
    mov esi, dword ptr [ebx + 12]
    mov dword ptr [ebp - 52], ecx
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + ecx]
    mov eax, dword ptr [eax + esi]
    mov esi, dword ptr [ebx + 16]
    lea esi, [esi + eax*4]
    mov dword ptr [ebp - 20], ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
L0:
    and dword ptr [ebp - 4], 0
    inc dword ptr [ebx + 72]
    mov eax, dword ptr [ebp - 16]
    jmp L6
L1:
    mov ecx, dword ptr [ebx + 60]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + 24]
    mov eax, dword ptr [ecx + eax*4]
    xor ecx, ecx
    cmp dword ptr [eax + 20], ecx
    jbe L3
L2:
    mov esi, dword ptr [eax + 24]
    mov edi, dword ptr [ebx + 4]
    mov esi, dword ptr [esi + ecx*4]
    mov edi, dword ptr [edi + 24]
    mov esi, dword ptr [edi + esi*4]
    mov edi, dword ptr [ebx + 72]
    inc ecx
    mov dword ptr [esi + 36], edi
    cmp ecx, dword ptr [eax + 20]
    jb L2
L3:
    xor ecx, ecx
    cmp dword ptr [eax + 28], ecx
    jbe L5
L4:
    mov esi, dword ptr [eax + 32]
    mov edi, dword ptr [ebx + 4]
    mov esi, dword ptr [esi + ecx*4]
    mov edi, dword ptr [edi + 24]
    mov esi, dword ptr [edi + esi*4]
    mov edi, dword ptr [ebx + 72]
    inc ecx
    mov dword ptr [esi + 36], edi
    cmp ecx, dword ptr [eax + 28]
    jb L4
L5:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebx + 60]
    mov ecx, dword ptr [ecx + eax*4]
    mov esi, dword ptr [ebx + 40]
    mov ecx, dword ptr [esi + ecx*4]
    add dword ptr [ebp - 4], ecx
    inc eax
L6:
    cmp eax, dword ptr [ebp - 12]
    mov dword ptr [ebp + 8], eax
    jb L1
    xor esi, esi
    cmp dword ptr [ebp - 20], esi
    jbe L8
L7:
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [ebx + 72]
    mov dword ptr [eax + 48], ecx
    xor ecx, ecx
    cmp edx, dword ptr [eax + 116]
    sete cl
    inc esi
    cmp esi, dword ptr [ebp - 20]
    mov dword ptr [eax + 84], ecx
    jb L7
L8:
    cmp dword ptr [ebp - 4], 0
    jge L9
    mov esi, dword ptr [ebp - 16]
    or dword ptr [ebp - 40], 0FFFFFFFFh
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp + 8], esi
    jmp L10
L9:
    jle L50
    mov eax, dword ptr [ebp - 12]
    lea esi, [eax - 1]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp + 8], eax
    mov dword ptr [ebp - 40], 1
L10:
    xor edx, edx
    mov dword ptr [ebp - 32], edx
    mov dword ptr [ebp - 28], edx
    mov dword ptr [ebp - 24], edx
    jmp L23
L11:
    mov eax, dword ptr [ebx + 60]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [ebx + 52]
    mov dword ptr [ebp - 68], eax
    shl eax, 2
    cmp dword ptr [eax + ecx], 0
    jne L15
    mov ecx, dword ptr [ebx + 4]
    mov edx, dword ptr [ecx + 24]
    mov edx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [edx]
    mov edi, dword ptr [ecx + 20]
    mov edi, dword ptr [edi + edx*4]
    mov edx, dword ptr [edi + 20]
    mov dword ptr [ebp - 76], edi
    mov edi, dword ptr [edi + 24]
    jmp L13
L12:
    cmp dword ptr [ebp - 36], edx
    je L14
    mov edi, dword ptr [ecx + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [edx + 24]
    mov edx, dword ptr [edx + 20]
L13:
    cmp edx, -1
    jne L12
    cmp dword ptr [ebp - 36], edx
    jne L50
L14:
    cmp dword ptr [ebp - 52], edi
    jne L50
    mov edx, dword ptr [ebp - 32]
L15:
    cmp dword ptr [ebp - 8], esi
    jbe L16
    mov dword ptr [ebp - 8], esi
L16:
    cmp dword ptr [ebp + 8], esi
    ja L17
    inc esi
    mov dword ptr [ebp + 8], esi
L17:
    mov ecx, dword ptr [ebx + 12]
    mov ecx, dword ptr [eax + ecx]
    mov esi, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + 24]
    lea esi, [esi + ecx*4]
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + ecx]
    mov dword ptr [ebp - 48], ecx
    mov dword ptr [ebp - 72], esi
    lea edi, [edi + edx*4]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [ebx + 8]
    add edx, dword ptr [eax + ecx]
    mov ecx, dword ptr [ebx + 40]
    mov ecx, dword ptr [ecx + eax]
    add dword ptr [ebp - 28], ecx
    mov ecx, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + eax]
    mov esi, dword ptr [ebx + 72]
    sub esi, dword ptr [ecx + 36]
    mov dword ptr [ebp - 32], edx
    neg esi
    sbb esi, esi
    inc esi
    or dword ptr [ebp - 24], esi
    xor ecx, ecx
    cmp dword ptr [ebp - 48], ecx
    mov dword ptr [ebp - 44], ecx
    jbe L21
    mov edi, dword ptr [ebp - 68]
L18:
    mov esi, dword ptr [ebp - 72]
    mov ecx, dword ptr [esi + ecx*4]
    mov esi, dword ptr [ebx + 4]
    mov esi, dword ptr [esi + 20]
    mov esi, dword ptr [esi + ecx*4]
    mov ecx, dword ptr [ebx + 72]
    cmp dword ptr [esi + 48], ecx
    jne L19
    cmp edi, dword ptr [esi + 116]
    jne L20
L19:
    mov dword ptr [esi + 48], ecx
    xor ecx, ecx
    cmp edi, dword ptr [esi + 116]
    setne cl
    dec ecx
    mov dword ptr [esi + 84], ecx
L20:
    mov ecx, dword ptr [ebp - 44]
    inc ecx
    cmp ecx, dword ptr [ebp - 48]
    mov dword ptr [ebp - 44], ecx
    jb L18
L21:
    mov ecx, dword ptr [ebx + 52]
    cmp dword ptr [eax + ecx], 0
    jne L22
    mov eax, dword ptr [ebp - 76]
    mov ecx, dword ptr [ebp - 36]
    cmp ecx, dword ptr [eax + 20]
    jne L22
    mov ecx, dword ptr [ebp - 52]
    cmp ecx, dword ptr [eax + 24]
    je L24
L22:
    mov esi, dword ptr [ebp - 56]
L23:
    add esi, dword ptr [ebp - 40]
    cmp esi, dword ptr [ebx + 56]
    mov dword ptr [ebp - 56], esi
    jb L11
L24:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 8]
    jae L50
    inc eax
    cmp eax, dword ptr [ebp + 8]
    jae L25
    lea eax, [ebp - 32]
    push eax
    push dword ptr [ebx + 24]
    mov ecx, ebx
    call sub_100CBE62
    mov edx, dword ptr [ebp - 32]
L25:
    cmp dword ptr [ebp - 24], 0
    jne L34
    cmp dword ptr [ebp - 4], 0
    jge L29
    test edx, edx
    mov eax, dword ptr [ebp - 28]
    mov dword ptr [ebp - 40], eax
    jbe L28
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [ebx + 24]
    mov esi, edx
L26:
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    cmp dword ptr [edi + 84], 1
    jne L27
    dec dword ptr [ebp - 40]
L27:
    add eax, 4
    dec esi
    jne L26
L28:
    mov eax, dword ptr [ebp - 40]
    cmp dword ptr [ebp - 4], eax
    jle L34
    jmp L33
L29:
    mov esi, dword ptr [ebp - 20]
    test esi, esi
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 40], eax
    jbe L32
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [ebx + 20]
L30:
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    cmp dword ptr [edi + 84], -1
    jne L31
    dec dword ptr [ebp - 40]
L31:
    add eax, 4
    dec esi
    jne L30
    mov eax, dword ptr [ebp - 40]
L32:
    cmp eax, dword ptr [ebp - 28]
    jge L34
L33:
    mov dword ptr [ebp - 24], 1
L34:
    mov edi, dword ptr [ebp - 16]
    cmp edi, dword ptr [ebp - 8]
    jb L35
    mov edi, dword ptr [ebp - 8]
L35:
    mov esi, dword ptr [ebp - 12]
    cmp esi, dword ptr [ebp + 8]
    ja L36
    mov esi, dword ptr [ebp + 8]
L36:
    cmp dword ptr [ebp - 24], 0
    je L44
    mov dword ptr [ebp - 12], esi
    xor esi, esi
    test edx, edx
    mov dword ptr [ebp - 16], edi
    jbe L38
L37:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + esi*4]
    mov eax, dword ptr [ecx + eax*4]
    xor ecx, ecx
    cmp dword ptr [eax + 84], ecx
    setne cl
    inc esi
    cmp esi, edx
    mov dword ptr [eax + 84], ecx
    jb L37
L38:
    mov eax, dword ptr [ebx + 20]
    mov edi, dword ptr [ebp - 20]
    mov esi, dword ptr [ebx + 24]
    add dword ptr [ebp - 20], edx
    lea edi, [eax + edi*4]
    mov eax, dword ptr [ebp - 28]
    add dword ptr [ebp - 4], eax
    lea eax, [ebp - 20]
    mov ecx, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    push eax
    push dword ptr [ebx + 20]
    mov ecx, ebx
    call sub_100CBF4F
    mov edx, dword ptr [ebp - 8]
L39:
    mov eax, dword ptr [ebx + 60]
    mov ecx, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + 24]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    xor ecx, ecx
    cmp dword ptr [eax + 20], ecx
    jbe L41
L40:
    mov esi, dword ptr [eax + 24]
    mov edi, dword ptr [ebx + 4]
    mov esi, dword ptr [esi + ecx*4]
    mov edi, dword ptr [edi + 24]
    mov esi, dword ptr [edi + esi*4]
    mov edi, dword ptr [ebx + 72]
    inc ecx
    mov dword ptr [esi + 36], edi
    cmp ecx, dword ptr [eax + 20]
    jb L40
L41:
    xor ecx, ecx
    cmp dword ptr [eax + 28], ecx
    jbe L43
L42:
    mov esi, dword ptr [eax + 32]
    mov edi, dword ptr [ebx + 4]
    mov esi, dword ptr [esi + ecx*4]
    mov edi, dword ptr [edi + 24]
    mov esi, dword ptr [edi + esi*4]
    mov edi, dword ptr [ebx + 72]
    inc ecx
    mov dword ptr [esi + 36], edi
    cmp ecx, dword ptr [eax + 28]
    jb L42
L43:
    inc edx
    cmp edx, dword ptr [ebp + 8]
    jb L39
    jmp L8
L44:
    push dword ptr [ebp - 12]
    mov ecx, ebx
    push dword ptr [ebp - 16]
    call sub_100CBF12
    push dword ptr [ebp + 8]
    push dword ptr [ebp - 8]
    call sub_100CBF1D
    push esi
    push edi
    call sub_100CBF24
    lea eax, [ebp - 80]
    push eax
    lea eax, [ebp - 60]
    push eax
    call sub_100CC022
    mov eax, dword ptr [ebx + 80]
    cmp dword ptr [ebp - 60], eax
    mov ecx, dword ptr [ebp - 80]
    jae L45
    cmp ecx, dword ptr [ebx + 76]
    jbe L49
    cmp dword ptr [ebp - 60], eax
L45:
    ja L46
    cmp ecx, dword ptr [ebx + 76]
    jb L49
L46:
    cmp dword ptr [ebp - 4], 0
    jge L47
    mov eax, dword ptr [ebp - 8]
    sub eax, dword ptr [ebp + 8]
    jmp L48
L47:
    mov eax, dword ptr [ebp + 8]
    sub eax, dword ptr [ebp - 8]
L48:
    add dword ptr [ebp - 16], eax
    add dword ptr [ebp - 12], eax
    mov edx, dword ptr [ebp - 84]
    mov dword ptr [ebp - 64], 1
    jmp L0
L49:
    xor eax, eax
    jmp L52
L50:
    cmp dword ptr [ebp - 64], 0
    je L51
    mov ecx, dword ptr [ebx + 56]
    mov esi, dword ptr [ebx + 64]
    mov edi, dword ptr [ebx + 60]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    push 0
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push 0
    mov ecx, ebx
    call sub_100CC094
L51:
    xor eax, eax
    inc eax
L52:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100cbd29 ENDP
END
