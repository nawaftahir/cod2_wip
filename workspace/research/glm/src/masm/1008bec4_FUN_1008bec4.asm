.686
.MODEL FLAT, C
EXTRN sub_1008A990:PROC
EXTRN sub_1008BF7A:PROC
EXTRN sub_1008BF9C:PROC
EXTRN sub_1008C001:PROC
EXTRN sub_1008C01E:PROC
.CODE
FUN_1008bec4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    push edi
    xor esi, esi
    mov edi, ecx
    mov dword ptr [ebp - 20], esi
    call sub_1008A990
    xor ecx, ecx
    cmp dword ptr [edi + 8], esi
    jbe L1
L0:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov ebx, dword ptr [eax + 4]
    mov edx, dword ptr [edx + ebx*4]
    mov edx, dword ptr [edx + 4]
    and edx, 000010020h
    neg edx
    sbb edx, edx
    and edx, 2
    inc ecx
    mov dword ptr [eax + 84], edx
    cmp ecx, dword ptr [edi + 8]
    jb L0
L1:
    mov edx, dword ptr [edi + 12]
    jmp L6
L2:
    mov eax, dword ptr [edi + 24]
    dec edx
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 020900000h
    jne L5
    cmp dword ptr [eax + 12], esi
    jbe L5
L3:
    mov ecx, dword ptr [eax + 16]
    mov ecx, dword ptr [ecx + esi*4]
    mov ebx, dword ptr [edi + 20]
    mov ecx, dword ptr [ebx + ecx*4]
    cmp dword ptr [ecx + 84], 2
    je L4
    mov dword ptr [ecx + 84], 1
L4:
    inc esi
    cmp esi, dword ptr [eax + 12]
    jb L3
L5:
    xor esi, esi
L6:
    cmp edx, esi
    ja L2
L7:
    mov eax, dword ptr [edi + 12]
    and dword ptr [ebp - 16], 0
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jbe L30
L8:
    dec dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [edi + 24]
    mov esi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi]
    test ecx, 0FFF00000h
    je L20
    mov eax, ecx
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L13
    cmp eax, 040000000h
    ja L13
    mov eax, dword ptr [esi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 12], 0
    mov dword ptr [ebp - 24], eax
    jbe L20
L9:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ebx, dword ptr [ecx + 84]
    xor ecx, ecx
    inc ecx
    cmp ebx, ecx
    jne L10
    mov dword ptr [ebp - 16], ecx
L10:
    push ebx
    push eax
    mov ecx, edi
    call sub_1008BF7A
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 24], 0
    jbe L12
L11:
    mov eax, dword ptr [esi + 12]
    imul eax, dword ptr [ebp - 8]
    add eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 8]
    push ebx
    push dword ptr [ecx + eax*4]
    mov ecx, edi
    call sub_1008BF9C
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 24]
    jb L11
L12:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L9
    jmp L20
L13:
    mov edx, dword ptr [esi + 12]
    and dword ptr [ebp - 4], 0
    test edx, edx
    jbe L16
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp - 24], edx
L14:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ebx, dword ptr [ebx + 84]
    cmp dword ptr [ebp - 4], ebx
    jae L15
    mov dword ptr [ebp - 4], ebx
L15:
    add eax, 4
    dec dword ptr [ebp - 24]
    jne L14
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 4], eax
    jne L16
    mov dword ptr [ebp - 16], eax
L16:
    xor ebx, ebx
    test edx, edx
    jbe L18
L17:
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 16]
    push dword ptr [eax + ebx*4]
    mov ecx, edi
    call sub_1008C001
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L17
L18:
    xor ebx, ebx
    cmp dword ptr [esi + 4], ebx
    jbe L20
L19:
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 8]
    push dword ptr [eax + ebx*4]
    mov ecx, edi
    call sub_1008C01E
    inc ebx
    cmp ebx, dword ptr [esi + 4]
    jb L19
L20:
    cmp dword ptr [ebp - 12], 0
    ja L8
    cmp dword ptr [ebp - 16], 0
    je L30
    xor eax, eax
    cmp dword ptr [edi + 12], eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 8], eax
    jbe L30
L21:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edx]
    and eax, 0FFF00000h
    cmp eax, 020900000h
    jne L29
    mov ecx, dword ptr [edx + 12]
    and dword ptr [ebp - 4], 0
    test ecx, ecx
    jbe L29
L22:
    mov esi, dword ptr [edx + 16]
    mov ebx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 20]
    mov esi, dword ptr [esi + ebx*4]
    mov esi, dword ptr [eax + esi*4]
    cmp dword ptr [esi + 84], 1
    mov dword ptr [ebp - 32], esi
    jne L28
    mov esi, ebx
    add ecx, esi
    mov esi, dword ptr [edx + 8]
    mov ecx, dword ptr [esi + ecx*4]
    cmp ecx, -1
    je L23
    mov esi, dword ptr [eax + ecx*4]
    mov esi, dword ptr [esi + 56]
    cmp esi, -1
    je L23
    mov ecx, esi
L23:
    mov esi, dword ptr [edi + 24]
    and dword ptr [ebp - 12], 0
    mov dword ptr [ebp - 24], ecx
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 72]
    mov ecx, dword ptr [esi + ecx*4]
    cmp dword ptr [ecx + 12], 0
    jbe L26
    mov esi, dword ptr [ecx + 16]
    jmp L25
L24:
    mov esi, dword ptr [ebp - 28]
L25:
    mov ebx, dword ptr [ebp - 24]
    cmp dword ptr [esi], ebx
    je L26
    inc dword ptr [ebp - 12]
    add esi, 4
    mov dword ptr [ebp - 28], esi
    mov esi, dword ptr [ebp - 12]
    cmp esi, dword ptr [ecx + 12]
    jb L24
L26:
    mov ecx, dword ptr [ecx + 8]
    mov esi, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + esi*4]
    cmp ecx, -1
    je L27
    mov esi, dword ptr [eax + ecx*4]
    mov esi, dword ptr [esi + 56]
    cmp esi, -1
    je L27
    mov ecx, esi
L27:
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 84]
    xor ecx, ecx
    inc ecx
    cmp eax, ecx
    je L28
    mov esi, dword ptr [ebp - 32]
    mov dword ptr [esi + 84], eax
    mov dword ptr [ebp - 16], ecx
L28:
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [edx + 12]
    cmp dword ptr [ebp - 4], ecx
    jb L22
L29:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L21
    cmp dword ptr [ebp - 16], 0
    jne L7
L30:
    and dword ptr [ebp - 16], 0
    cmp dword ptr [edi + 12], 0
    jbe L49
L31:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov esi, dword ptr [ecx]
    test esi, 0FFF00000h
    je L48
    mov eax, esi
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L43
    cmp eax, 040000000h
    ja L43
    mov eax, dword ptr [ecx + 4]
    and esi, 0000FFFFFh
    xor edx, edx
    div esi
    xor esi, esi
    cmp esi, dword ptr [ecx + 12]
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 8], eax
    jae L36
L32:
    mov eax, dword ptr [ecx + 16]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [edi + 20]
    mov ebx, dword ptr [ebx + edx*4]
    cmp dword ptr [ebx + 84], 2
    jne L35
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ebp - 8], 0
    mov dword ptr [eax + esi*4], edx
    jbe L34
L33:
    mov edx, dword ptr [ecx + 12]
    imul edx, dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + 8]
    mov ebx, dword ptr [ebp - 4]
    add ebx, edx
    mov ebx, dword ptr [eax + ebx*4]
    add edx, esi
    inc dword ptr [ebp - 12]
    mov dword ptr [eax + edx*4], ebx
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 8]
    jb L33
L34:
    inc esi
L35:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ecx + 12]
    jb L32
    cmp esi, dword ptr [ecx + 12]
L36:
    je L48
    test esi, esi
    je L37
    mov eax, dword ptr [ecx]
    xor eax, esi
    and eax, 0000FFFFFh
    xor eax, dword ptr [ecx]
    jmp L38
L37:
    xor eax, eax
L38:
    mov dword ptr [ecx], eax
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 4], eax
    jbe L42
    mov eax, esi
    shl eax, 2
    mov dword ptr [ebp - 20], eax
L39:
    and dword ptr [ebp - 12], 0
    test esi, esi
    jbe L41
    mov edx, dword ptr [ebp - 20]
L40:
    mov ebx, dword ptr [ecx + 12]
    imul ebx, dword ptr [ebp - 4]
    add ebx, dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + 8]
    mov ebx, dword ptr [eax + ebx*4]
    inc dword ptr [ebp - 12]
    mov dword ptr [edx + eax], ebx
    add edx, 4
    cmp dword ptr [ebp - 12], esi
    jb L40
L41:
    inc dword ptr [ebp - 4]
    mov eax, esi
    shl eax, 2
    add dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    jb L39
L42:
    mov eax, esi
    imul eax, dword ptr [ebp - 8]
    mov dword ptr [ecx + 12], esi
    jmp L47
L43:
    xor esi, esi
    cmp esi, dword ptr [ecx + 12]
    jae L46
    mov edx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + 16]
L44:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    cmp dword ptr [ebx + 84], 2
    je L45
    inc esi
    add eax, 4
    cmp esi, dword ptr [ecx + 12]
    jb L44
L45:
    cmp esi, dword ptr [ecx + 12]
L46:
    jne L48
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 12], eax
L47:
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ebp - 20], 1
L48:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [edi + 12]
    jb L31
L49:
    xor esi, esi
    cmp dword ptr [edi + 8], esi
    jbe L56
L50:
    cmp esi, -1
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + esi*4]
    je L51
    mov edx, dword ptr [eax + 56]
    cmp edx, -1
    jne L52
L51:
    mov edx, esi
L52:
    mov ecx, dword ptr [ecx + edx*4]
    cmp dword ptr [ecx + 84], 2
    je L55
    mov edx, dword ptr [edi + 116]
    mov ecx, dword ptr [eax + 4]
    cmp edx, ecx
    je L55
    cmp dword ptr [eax + 8], -1
    jne L53
    mov ebx, dword ptr [edi + 16]
    mov ebx, dword ptr [ebx + ecx*4]
    test byte ptr [ebx + 5], 4
    jne L55
L53:
    mov ebx, dword ptr [edi + 16]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 1
    je L54
    test ch, 8
    jne L55
L54:
    mov dword ptr [eax + 4], edx
    mov dword ptr [ebp - 20], 1
L55:
    inc esi
    cmp esi, dword ptr [edi + 8]
    jb L50
L56:
    xor eax, eax
    cmp dword ptr [ebp - 20], eax
    pop edi
    pop esi
    sete al
    pop ebx
    leave
    ret
FUN_1008bec4 ENDP
END
