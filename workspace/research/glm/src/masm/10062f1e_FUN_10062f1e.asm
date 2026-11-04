.686
.MODEL FLAT, C
.CODE
FUN_10062f1e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    push ebx
    push edi
    jne L0
    mov eax, 08876086Ch
    jmp L39
L0:
    mov eax, dword ptr [ebp + 16]
    and dword ptr [ebp + 8], 0
    test eax, eax
    je L1
    and dword ptr [eax], 0
L1:
    push esi
    mov esi, dword ptr [ecx]
    mov eax, esi
    mov edx, 0FFFF0000h
    and eax, edx
    cmp eax, 046580000h
    mov dword ptr [ebp - 16], esi
    je L37
    cmp eax, 0FFFE0000h
    je L40
    cmp eax, edx
    je L2
    mov eax, 088760B59h
    jmp L38
L2:
    mov al, byte ptr [ecx + 1]
    cmp al, 3
    jne L8
    mov esi, dword ptr [ebp + 12]
    lea eax, [ecx + 4]
    mov ecx, 00000FFFFh
    mov ebx, 000007FFFh
L3:
    mov edx, dword ptr [eax]
    and edx, ecx
    cmp edx, 31
    jne L5
    mov edx, dword ptr [eax + 8]
    mov edi, edx
    shr edi, 20
    and edi, 000000700h
    and edx, 000001800h
    or edi, edx
    cmp edi, 000000100h
    jne L5
    test esi, esi
    je L4
    mov edi, dword ptr [eax + 4]
    mov edx, dword ptr [ebp + 8]
    and edi, ecx
    shl edx, 3
    mov dword ptr [edx + esi], edi
    xor edi, edi
    mov di, word ptr [eax + 6]
    and edi, ebx
    mov dword ptr [edx + esi + 4], edi
L4:
    inc dword ptr [ebp + 8]
L5:
    mov edx, dword ptr [eax]
    mov edi, edx
    and edi, ecx
    cmp edi, ecx
    je L36
    cmp edi, 00000FFFEh
    jne L6
    shr edx, 16
    and edx, ebx
    jmp L7
L6:
    shr edx, 24
    and edx, 15
L7:
    lea eax, [eax + edx*4]
    add eax, 4
    jmp L3
L8:
    cmp al, 2
    jne L18
    mov edi, dword ptr [ebp + 12]
    push 10
    lea esi, [ecx + 4]
    mov ecx, 00000FFFFh
    pop ebx
L9:
    mov eax, dword ptr [esi]
    and eax, ecx
    cmp eax, 31
    jne L14
    mov eax, dword ptr [esi + 8]
    mov edx, eax
    and edx, 0000007FFh
    and eax, 0F0001800h
    test edi, edi
    je L12
    cmp eax, 0B0000000h
    jne L10
    mov eax, dword ptr [ebp + 8]
    shl eax, 3
    mov dword ptr [eax + edi], 5
    mov dword ptr [eax + edi + 4], edx
    jmp L13
L10:
    cmp eax, 090000000h
    jne L11
    cmp edx, 2
    jae L17
    mov eax, dword ptr [ebp + 8]
    shl eax, 3
    and dword ptr [eax + edi + 4], 0
    mov dword ptr [eax + edi], ebx
    jmp L13
L11:
    cmp eax, 0A0000800h
    jne L17
L12:
    cmp eax, 0A0000800h
    je L14
L13:
    inc dword ptr [ebp + 8]
L14:
    mov eax, dword ptr [esi]
    mov edx, eax
    and edx, ecx
    cmp edx, ecx
    je L36
    cmp edx, 00000FFFEh
    jne L15
    shr eax, 16
    and eax, 000007FFFh
    jmp L16
L15:
    shr eax, 24
    and eax, 15
L16:
    lea esi, [esi + eax*4]
    add esi, 4
    jmp L9
L17:
    mov eax, 080004005h
    jmp L38
L18:
    cmp al, 1
    jne L17
    xor eax, eax
    lea edi, [ebp - 24]
    stosd dword ptr es:[edi], eax
    stosw word ptr es:[edi], ax
    mov eax, esi
    xor edx, edx
    sub al, 4
    neg al
    lea esi, [ecx + 4]
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 12], edx
    mov ecx, 00000FFFFh
    sbb eax, eax
    inc eax
    mov dword ptr [ebp - 4], eax
L19:
    mov eax, dword ptr [esi]
    test eax, eax
    mov edi, eax
    jns L22
    and edi, 0F0001800h
    cmp edi, 090000000h
    jne L21
    mov edx, eax
    and edx, 0000007FFh
    jne L20
    mov dword ptr [ebp - 8], 1
    jmp L21
L20:
    xor ebx, ebx
    inc ebx
    cmp edx, ebx
    jne L21
    mov dword ptr [ebp - 12], ebx
L21:
    cmp dword ptr [ebp - 4], 0
    je L28
    cmp edi, 0B0000000h
    jne L28
    and eax, 0000007FFh
    mov byte ptr [ebp + eax - 24], 1
    jmp L28
L22:
    and edi, ecx
    cmp edi, ecx
    je L29
    cmp edi, 00000FFFEh
    jne L23
    shr eax, 16
    and eax, 000007FFFh
    jmp L26
L23:
    cmp dword ptr [ebp - 4], edx
    jne L25
    cmp edi, 64
    jb L25
    cmp edi, 74
    jbe L24
    cmp edi, 75
    jbe L25
    cmp edi, 77
    jbe L24
    cmp edi, 81
    jbe L25
    cmp edi, 87
    ja L25
L24:
    mov edx, dword ptr [esi + 4]
    mov ebx, edx
    and ebx, 0F0001800h
    cmp ebx, 0B0000000h
    jne L25
    and edx, 0000007FFh
    mov byte ptr [ebp + edx - 24], 1
L25:
    mov edx, dword ptr [ebp - 16]
    and edx, ecx
    cmp edx, 000000200h
    jb L27
    shr eax, 24
    and eax, 15
L26:
    lea esi, [esi + eax*4]
    jmp L28
L27:
    cmp edi, 81
    jne L28
    add esi, 20
L28:
    add esi, 4
    xor edx, edx
    jmp L19
L29:
    mov eax, dword ptr [ebp + 12]
    xor ecx, ecx
L30:
    cmp byte ptr [ebp + ecx - 24], 0
    je L32
    cmp eax, edx
    je L31
    mov esi, dword ptr [ebp + 8]
    shl esi, 3
    mov dword ptr [esi + eax], 5
    mov dword ptr [esi + eax + 4], ecx
L31:
    inc dword ptr [ebp + 8]
L32:
    inc ecx
    cmp ecx, 6
    jb L30
    cmp dword ptr [ebp - 8], edx
    push 10
    pop ebx
    je L34
    cmp eax, edx
    je L33
    mov ecx, dword ptr [ebp + 8]
    lea ecx, [eax + ecx*8]
    mov dword ptr [ecx], ebx
    mov dword ptr [ecx + 4], edx
L33:
    inc dword ptr [ebp + 8]
L34:
    cmp dword ptr [ebp - 12], edx
    je L36
    test eax, eax
    je L35
    mov ecx, dword ptr [ebp + 8]
    lea eax, [eax + ecx*8]
    mov dword ptr [eax], ebx
    mov dword ptr [eax + 4], 1
L35:
    inc dword ptr [ebp + 8]
L36:
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L37
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax], ecx
L37:
    xor eax, eax
L38:
    pop esi
L39:
    pop edi
    pop ebx
    leave
    ret 12
L40:
    cmp byte ptr [ecx + 1], 2
    mov edi, dword ptr [ebp + 12]
    sbb ebx, ebx
    lea eax, [ecx + 4]
    neg ebx
    mov ecx, 00000FFFFh
L41:
    mov edx, dword ptr [eax]
    test edx, edx
    js L47
    and edx, ecx
    cmp edx, 31
    jne L43
    mov edx, dword ptr [eax + 8]
    mov esi, edx
    shr esi, 20
    and esi, 000000700h
    and edx, 000001800h
    or esi, edx
    cmp esi, 000000100h
    jne L43
    test edi, edi
    je L42
    mov esi, dword ptr [eax + 4]
    mov edx, dword ptr [ebp + 8]
    and esi, ecx
    shl edx, 3
    mov dword ptr [edx + edi], esi
    xor esi, esi
    mov si, word ptr [eax + 6]
    and esi, 000007FFFh
    mov dword ptr [edx + edi + 4], esi
L42:
    inc dword ptr [ebp + 8]
L43:
    mov edx, dword ptr [eax]
    mov esi, edx
    and esi, ecx
    cmp esi, ecx
    je L36
    cmp esi, 00000FFFEh
    jne L44
    shr edx, 16
    and edx, 000007FFFh
    jmp L45
L44:
    test ebx, ebx
    jne L46
    shr edx, 24
    and edx, 15
L45:
    lea eax, [eax + edx*4]
    jmp L47
L46:
    cmp esi, 81
    jne L47
    add eax, 20
L47:
    add eax, 4
    jmp L41
FUN_10062f1e ENDP
END
