.686
.MODEL FLAT, C
.CODE
FUN_100632d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [ebp - 8], 0
    test ecx, ecx
    push edi
    jne L0
    mov eax, 08876086Ch
    jmp L8
L0:
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L1
    and dword ptr [eax], 0
L1:
    push ebx
    mov bl, byte ptr [ecx + 1]
    cmp bl, 2
    sbb eax, eax
    neg eax
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ecx]
    mov edx, 0FFFF0000h
    and eax, edx
    cmp eax, 046580000h
    je L6
    cmp eax, 0FFFE0000h
    je L25
    cmp eax, edx
    je L2
    mov eax, 088760B59h
    jmp L7
L2:
    cmp bl, 2
    jae L9
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L3
    and dword ptr [eax + 4], 0
    mov dword ptr [eax], 10
L3:
    mov dword ptr [ebp - 8], 1
L4:
    mov edx, dword ptr [ebp - 8]
L5:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], edx
L6:
    xor eax, eax
L7:
    pop ebx
L8:
    pop edi
    leave
    ret 12
L9:
    xor eax, eax
    lea edi, [ebp - 28]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [ebp - 44]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    lea edi, [ecx + 4]
    mov edx, 00000FFFFh
L10:
    mov eax, dword ptr [edi]
    test eax, eax
    mov ecx, eax
    jns L12
    and ecx, 0F0001800h
    and eax, 0000007FFh
    cmp ecx, 080000800h
    jne L11
    mov byte ptr [ebp + eax - 28], 1
    jmp L17
L11:
    cmp ecx, 090000800h
    jne L17
    mov byte ptr [ebp + eax - 44], 1
    jmp L17
L12:
    and ecx, edx
    cmp ecx, edx
    je L18
    cmp ecx, 00000FFFEh
    jne L13
    shr eax, 16
    and eax, 000007FFFh
    jmp L16
L13:
    cmp ecx, 81
    je L14
    cmp ecx, 48
    je L14
    cmp ecx, 47
    je L14
    cmp ecx, 31
    jne L17
    add edi, 4
    jmp L17
L14:
    cmp dword ptr [ebp - 12], 0
    je L15
    add edi, 20
    jmp L17
L15:
    shr eax, 24
    and eax, 15
L16:
    lea edi, [edi + eax*4]
L17:
    add edi, 4
    jmp L10
L18:
    mov eax, dword ptr [ebp + 12]
    xor ecx, ecx
L19:
    cmp byte ptr [ebp + ecx - 28], 0
    je L21
    test eax, eax
    je L20
    mov edx, dword ptr [ebp - 8]
    shl edx, 3
    mov dword ptr [edx + eax], 10
    mov dword ptr [edx + eax + 4], ecx
L20:
    inc dword ptr [ebp - 8]
L21:
    inc ecx
    cmp ecx, 16
    jb L19
    xor ecx, ecx
L22:
    cmp byte ptr [ebp + ecx - 44], 0
    je L24
    test eax, eax
    je L23
    mov edx, dword ptr [ebp - 8]
    shl edx, 3
    mov dword ptr [edx + eax], 12
    mov dword ptr [edx + eax + 4], ecx
L23:
    inc dword ptr [ebp - 8]
L24:
    inc ecx
    cmp ecx, 16
    jb L22
    jmp L4
L25:
    cmp bl, 3
    mov edx, 00000FFFFh
    jne L31
    mov edi, dword ptr [ebp + 12]
    lea eax, [ecx + 4]
L26:
    mov ecx, dword ptr [eax]
    and ecx, edx
    cmp ecx, 31
    jne L28
    mov ecx, dword ptr [eax + 8]
    mov ebx, ecx
    shr ebx, 20
    and ebx, 000000700h
    and ecx, 000001800h
    or ebx, ecx
    cmp ebx, 000000600h
    jne L28
    test edi, edi
    je L27
    mov ebx, dword ptr [eax + 4]
    mov ecx, dword ptr [ebp - 8]
    and ebx, edx
    shl ecx, 3
    mov dword ptr [ecx + edi], ebx
    xor ebx, ebx
    mov bx, word ptr [eax + 6]
    and ebx, 000007FFFh
    mov dword ptr [ecx + edi + 4], ebx
L27:
    inc dword ptr [ebp - 8]
L28:
    mov ecx, dword ptr [eax]
    mov ebx, ecx
    and ebx, edx
    cmp ebx, edx
    je L4
    cmp ebx, 00000FFFEh
    jne L29
    shr ecx, 16
    and ecx, 000007FFFh
    jmp L30
L29:
    shr ecx, 24
    and ecx, 15
L30:
    lea eax, [eax + ecx*4]
    add eax, 4
    jmp L26
L31:
    xor eax, eax
    lea edi, [ebp - 4]
    stosw word ptr es:[edi], ax
    stosb byte ptr es:[edi], al
    xor eax, eax
    lea edi, [ebp - 20]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [ebp + 10]
    stosw word ptr es:[edi], ax
    lea edi, [ecx + 4]
    xor ebx, ebx
L32:
    mov eax, dword ptr [edi]
    test eax, eax
    mov ecx, eax
    jns L35
    and ecx, 0F0001800h
    and eax, 0000007FFh
    cmp ecx, 0C0000000h
    jne L33
    mov byte ptr [ebp + eax - 4], 1
    jmp L40
L33:
    cmp ecx, 0D0000000h
    jne L34
    mov byte ptr [ebp + eax + 10], 1
    jmp L40
L34:
    cmp ecx, 0E0000000h
    jne L40
    mov byte ptr [ebp + eax - 20], 1
    jmp L40
L35:
    and ecx, edx
    cmp ecx, edx
    je L41
    cmp ecx, 00000FFFEh
    jne L36
    shr eax, 16
    and eax, 000007FFFh
    jmp L39
L36:
    cmp ecx, 81
    je L37
    cmp ecx, 48
    je L37
    cmp ecx, 47
    je L37
    cmp ecx, 31
    jne L40
    add edi, 4
    jmp L40
L37:
    cmp dword ptr [ebp - 12], ebx
    je L38
    add edi, 20
    jmp L40
L38:
    shr eax, 24
    and eax, 15
L39:
    lea edi, [edi + eax*4]
L40:
    add edi, 4
    jmp L32
L41:
    mov eax, dword ptr [ebp + 12]
    mov edx, dword ptr [ebp - 8]
    xor ecx, ecx
L42:
    cmp byte ptr [ebp + ecx - 20], 0
    je L44
    cmp eax, ebx
    je L43
    mov dword ptr [eax + edx*8], 5
    mov dword ptr [eax + edx*8 + 4], ecx
L43:
    inc edx
L44:
    inc ecx
    cmp ecx, 8
    jb L42
    xor ecx, ecx
L45:
    cmp byte ptr [ebp + ecx + 10], 0
    je L47
    cmp eax, ebx
    je L46
    mov dword ptr [eax + edx*8], 10
    mov dword ptr [eax + edx*8 + 4], ecx
L46:
    inc edx
L47:
    inc ecx
    cmp ecx, 2
    jb L45
    xor ecx, ecx
L48:
    cmp byte ptr [ebp + ecx - 4], 0
    je L53
    cmp eax, ebx
    je L52
    cmp ecx, ebx
    jne L49
    mov dword ptr [eax + edx*8], ebx
    jmp L51
L49:
    cmp ecx, 2
    jne L50
    mov dword ptr [eax + edx*8], 4
    jmp L51
L50:
    mov dword ptr [eax + edx*8], 11
L51:
    mov dword ptr [eax + edx*8 + 4], ebx
L52:
    inc edx
L53:
    inc ecx
    cmp ecx, 3
    jb L48
    jmp L5
FUN_100632d8 ENDP
END
