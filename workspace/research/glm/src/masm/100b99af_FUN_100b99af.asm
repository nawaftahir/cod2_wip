.686
.MODEL FLAT, C
EXTRN sub_100B9903:PROC
.CODE
FUN_100b99af PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000001C4h
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx]
    mov edx, ecx
    xor eax, eax
    and edx, 0000FFFFFh
    cmp edx, dword ptr [ebp + 32]
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 28], edx
    jbe L1
    cmp dword ptr [ebp + 36], eax
    jne L1
    inc eax
    jmp L59
L1:
    push ebx
    mov ebx, dword ptr [ebp + 12]
    and ecx, 0FFF00000h
    cmp ecx, dword ptr [ebx + 4]
    je L2
    xor eax, eax
    inc eax
    jmp L58
L2:
    cmp dword ptr [ebx], eax
    mov dword ptr [ebp - 44], 1
    jne L3
    cmp dword ptr [ebp + 36], eax
    je L3
    mov dword ptr [ebp - 44], 2
L3:
    cmp dword ptr [ebp - 44], eax
    push esi
    push edi
    mov dword ptr [ebp - 40], eax
    jbe L52
L4:
    mov ecx, dword ptr [ebx + 28]
    inc ecx
    mov dword ptr [ebp - 32], eax
    je L50
L5:
    mov eax, dword ptr [ebp + 20]
    mov edx, dword ptr [eax]
    mov esi, dword ptr [ebp + 16]
    push 40
    mov ecx, edx
    lea edi, [ebp - 116]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop ecx
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 000000124h]
    rep stosd dword ptr es:[edi], eax
    push 40
    pop ecx
    lea edi, [ebp - 0000001C4h]
    rep stosd dword ptr es:[edi], eax
    xor eax, eax
    cmp dword ptr [ebx + 8], eax
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 8], eax
    jbe L15
    and dword ptr [ebp - 4], eax
L6:
    cmp dword ptr [ebp - 32], 0
    je L7
    xor ecx, ecx
    inc ecx
    sub ecx, dword ptr [ebp - 8]
    jmp L8
L7:
    mov ecx, dword ptr [ebp - 8]
L8:
    mov eax, dword ptr [ebp + 28]
    mov esi, dword ptr [eax]
    cmp esi, 4
    jae L51
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 20]
    mov edi, dword ptr [edi + 20]
    add esi, eax
    mov esi, dword ptr [edx + esi*4]
    mov ebx, dword ptr [edi + esi*4]
    mov esi, dword ptr [ebp + 12]
    mov ecx, dword ptr [esi + ecx*4 + 12]
    cmp ecx, 16
    jae L9
    mov eax, dword ptr [ebx + 72]
    cmp eax, -1
    je L14
    sub ecx, dword ptr [esi]
    push dword ptr [ebp + 36]
    shl ecx, 5
    lea edi, [ecx + esi]
    push dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 20]
    mov esi, dword ptr [ecx + 24]
    lea ecx, [ebp - 000000084h]
    push ecx
    push dword ptr [ebp + 28]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [ebp - 28]
    lea ecx, [edx + ecx*4]
    push ecx
    push dword ptr [esi + eax*4]
    mov ecx, dword ptr [ebp - 20]
    call sub_100B9903
    test eax, eax
    jne L14
    push dword ptr [ebp + 36]
    mov ecx, dword ptr [ebp - 20]
    push dword ptr [ebp + 32]
    lea eax, [ebp - 000000084h]
    push eax
    lea eax, [ebp - 0000001C4h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 116]
    push eax
    mov eax, dword ptr [ebx + 72]
    push edi
    push dword ptr [esi + eax*4]
    call L0
    mov dword ptr [ebp - 12], eax
    jmp L13
L9:
    sub ecx, 16
    xor edi, edi
    shl ecx, 4
    lea ecx, [ebp + ecx - 000000124h]
L10:
    mov esi, dword ptr [ebp + 28]
    mov esi, dword ptr [esi + edi*4]
    cmp esi, dword ptr [ebp - 28]
    jae L11
    add esi, eax
    mov esi, dword ptr [edx + esi*4]
    mov dword ptr [ecx], esi
    jmp L12
L11:
    or dword ptr [ecx], 0FFFFFFFFh
L12:
    inc edi
    add ecx, 4
    cmp edi, 4
    jb L10
L13:
    cmp dword ptr [ebp - 12], 1
    je L15
    mov eax, dword ptr [ebp - 28]
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [eax + 8]
    jb L6
    jmp L15
L14:
    mov dword ptr [ebp - 12], 1
L15:
    mov edx, dword ptr [ebp + 12]
    xor esi, esi
    cmp dword ptr [edx + 8], esi
    mov dword ptr [ebp - 8], esi
    jbe L26
    mov dword ptr [ebp - 24], esi
L16:
    cmp dword ptr [ebp - 32], esi
    je L17
    xor ecx, ecx
    inc ecx
    sub ecx, dword ptr [ebp - 8]
    jmp L18
L17:
    mov ecx, dword ptr [ebp - 8]
L18:
    cmp dword ptr [edx + ecx*4 + 12], 16
    jb L25
    xor eax, eax
    cmp dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 36], eax
    jbe L25
L19:
    xor edi, edi
    cmp dword ptr [ebp - 28], esi
    jbe L24
    mov edx, dword ptr [ebp + eax*4 - 116]
    mov ebx, dword ptr [edx + 12]
L20:
    cmp ebx, esi
    mov dword ptr [ebp - 4], esi
    jbe L22
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 8]
    add eax, edi
    mov esi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edx + 16]
L21:
    cmp esi, dword ptr [ecx]
    je L23
    inc dword ptr [ebp - 4]
    add ecx, 4
    cmp dword ptr [ebp - 4], ebx
    jb L21
    xor esi, esi
L22:
    inc edi
    cmp edi, dword ptr [ebp - 28]
    jb L20
    jmp L24
L23:
    mov dword ptr [ebp - 12], 1
    xor esi, esi
L24:
    mov eax, dword ptr [ebp - 36]
    inc eax
    cmp eax, dword ptr [ebp - 16]
    mov dword ptr [ebp - 36], eax
    jb L19
    mov edx, dword ptr [ebp + 12]
L25:
    mov eax, dword ptr [ebp - 28]
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edx + 8]
    jb L16
L26:
    cmp dword ptr [ebp - 12], esi
    jne L49
    cmp dword ptr [ebp - 40], esi
    jne L52
    mov eax, dword ptr [ebp + 12]
    cmp dword ptr [eax], 0
    jne L52
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 16], 0
    jbe L41
L27:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp + eax*4 - 116]
    mov eax, dword ptr [eax + 12]
    and dword ptr [ebp - 4], 0
    test eax, eax
    mov dword ptr [ebp - 52], eax
    jbe L40
L28:
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 12]
    test eax, eax
    jbe L39
    mov ecx, dword ptr [ebp - 20]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [ebp - 48], eax
L29:
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [eax]
    test ecx, ecx
    je L38
    cmp dword ptr [ecx], 0
    je L38
    mov edi, dword ptr [ecx + 4]
    and dword ptr [ebp - 36], 0
    test edi, edi
    jbe L33
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp + eax*4 - 116]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    mov esi, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx + 8]
L30:
    mov ebx, dword ptr [edx]
    cmp ebx, esi
    je L31
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + ebx*4]
    cmp dword ptr [eax + 56], esi
    jne L32
L31:
    mov dword ptr [ebp - 36], 1
L32:
    add edx, 4
    dec edi
    jne L30
L33:
    cmp ecx, dword ptr [ebp + 8]
    jne L34
    xor eax, eax
    jmp L35
L34:
    mov eax, dword ptr [ebp - 36]
L35:
    test eax, eax
    je L38
    xor edx, edx
L36:
    cmp ecx, dword ptr [ebp + edx*4 - 116]
    jne L37
    xor eax, eax
L37:
    inc edx
    cmp edx, dword ptr [ebp - 16]
    jb L36
    test eax, eax
    je L38
    mov dword ptr [ebp - 12], 1
L38:
    add dword ptr [ebp - 24], 4
    dec dword ptr [ebp - 48]
    jne L29
L39:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 52]
    jb L28
L40:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 16]
    jb L27
L41:
    and dword ptr [ebp - 4], 0
L42:
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp + eax*4 - 000000124h]
    cmp edi, -1
    je L48
    xor ebx, ebx
    cmp dword ptr [ebp - 16], ebx
    jbe L48
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + edi*4]
L43:
    mov ecx, dword ptr [ebp + ebx*4 - 116]
    mov edx, dword ptr [ecx + 12]
    test edx, edx
    jbe L47
    mov ecx, dword ptr [ecx + 16]
L44:
    mov esi, dword ptr [ecx]
    cmp edi, esi
    je L45
    cmp dword ptr [eax + 56], esi
    jne L46
L45:
    mov dword ptr [ebp - 12], 1
L46:
    add ecx, 4
    dec edx
    jne L44
L47:
    inc ebx
    cmp ebx, dword ptr [ebp - 16]
    jb L43
L48:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 40
    jb L42
    cmp dword ptr [ebp - 12], 0
    je L52
L49:
    mov eax, dword ptr [ebp + 12]
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [eax + 28]
    mov ebx, dword ptr [ebp + 12]
    inc eax
    cmp dword ptr [ebp - 32], eax
    jb L5
    xor eax, eax
L50:
    cmp dword ptr [ebp - 12], eax
    je L52
    inc dword ptr [ebp - 40]
    mov ecx, dword ptr [ebp - 40]
    cmp ecx, dword ptr [ebp - 44]
    jb L4
    jmp L56
L51:
    xor eax, eax
    inc eax
    jmp L57
L52:
    mov eax, dword ptr [ebp - 16]
    mov edx, dword ptr [ebp + 16]
    shl eax, 2
    mov ecx, eax
    mov ebx, ecx
    shr ecx, 2
    mov edi, edx
    lea esi, [ebp - 116]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax + edx], ecx
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp + 20]
    mov edx, dword ptr [ebp + 24]
    inc eax
    mov dword ptr [ecx], eax
    xor eax, eax
L53:
    mov ecx, dword ptr [ebp + eax - 000000124h]
    cmp ecx, -1
    jne L54
    mov ecx, dword ptr [ebp + eax - 0000001C4h]
    cmp ecx, -1
    je L55
L54:
    mov dword ptr [eax + edx], ecx
L55:
    add eax, 4
    cmp eax, 0000000A0h
    jb L53
    and dword ptr [ebp - 12], 0
L56:
    mov eax, dword ptr [ebp - 12]
L57:
    pop edi
    pop esi
L58:
    pop ebx
L59:
    leave
    ret 32
FUN_100b99af ENDP
END
