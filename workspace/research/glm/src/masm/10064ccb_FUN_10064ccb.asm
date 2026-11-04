.686
.MODEL FLAT, C
.CODE
FUN_10064ccb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 12]
    mov esi, dword ptr [edi]
L0:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L2
    test cl, cl
    je L1
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L2
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L0
L1:
    xor eax, eax
    jmp L3
L2:
    sbb eax, eax
    sbb eax, -1
L3:
    test eax, eax
    jne L40
    mov eax, dword ptr [edx + 4]
    test eax, eax
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 12], ecx
    je L6
L4:
    test ecx, ecx
    je L5
    mov eax, dword ptr [eax + 12]
    test eax, eax
    mov ecx, dword ptr [ecx + 12]
    jne L4
L5:
    test eax, eax
    jne L40
L6:
    test ecx, ecx
    jne L40
    mov edx, dword ptr [edx + 8]
    mov ecx, dword ptr [edi + 8]
    jmp L39
L7:
    test ecx, ecx
    je L10
    mov eax, dword ptr [edx + 16]
    cmp eax, dword ptr [ecx + 16]
    jne L10
    cmp eax, 8
    jg L13
    cmp eax, 5
    jge L12
    test eax, eax
    je L8
    cmp eax, 1
    je L9
    jle L38
    cmp eax, 4
    jg L38
L8:
    mov eax, dword ptr [edx + 24]
    sub eax, dword ptr [ecx + 24]
    neg eax
    sbb eax, eax
    inc eax
    jmp L37
L9:
    mov al, byte ptr [edx + 24]
    cmp al, byte ptr [ecx + 24]
    jne L10
    mov al, byte ptr [edx + 25]
    cmp al, byte ptr [ecx + 25]
    jne L10
    mov al, byte ptr [edx + 26]
    cmp al, byte ptr [ecx + 26]
    jne L10
    mov al, byte ptr [edx + 27]
    cmp al, byte ptr [ecx + 27]
    je L38
L10:
    test edx, edx
    jne L40
L11:
    test ecx, ecx
    jne L40
    xor eax, eax
    inc eax
    jmp L41
L12:
    fld qword ptr [ecx + 24]
    fld qword ptr [edx + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jp L10
    jmp L38
L13:
    cmp eax, 9
    je L16
    jle L38
    cmp eax, 11
    jg L38
    mov esi, dword ptr [ecx + 24]
    mov eax, dword ptr [edx + 24]
L14:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L35
    test cl, cl
    je L15
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L35
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L14
L15:
    xor eax, eax
    jmp L36
L16:
    mov edi, dword ptr [ebp - 8]
    and dword ptr [ebp - 4], 0
    test edi, edi
    mov dword ptr [ebp + 8], 1
    je L24
L17:
    mov eax, dword ptr [edi + 24]
    mov esi, dword ptr [edx + 24]
L18:
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [eax]
    jne L20
    test cl, cl
    je L19
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [eax + 1]
    jne L20
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L18
L19:
    xor eax, eax
    jmp L21
L20:
    sbb eax, eax
    sbb eax, -1
L21:
    test eax, eax
    je L22
    mov edi, dword ptr [edi + 12]
    inc dword ptr [ebp + 8]
    test edi, edi
    jne L17
    jmp L23
L22:
    mov dword ptr [ebp - 4], 1
L23:
    mov ecx, dword ptr [ebp + 12]
L24:
    mov edi, dword ptr [ebp - 12]
    jmp L30
L25:
    mov eax, dword ptr [edi + 24]
    mov esi, dword ptr [ecx + 24]
L26:
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [eax]
    jne L28
    test cl, cl
    je L27
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [eax + 1]
    jne L28
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L26
L27:
    xor eax, eax
    jmp L29
L28:
    sbb eax, eax
    sbb eax, -1
L29:
    test eax, eax
    mov ecx, dword ptr [ebp + 12]
    je L31
    mov edi, dword ptr [edi + 12]
L30:
    dec dword ptr [ebp + 8]
    test edi, edi
    jne L25
    jmp L32
L31:
    mov dword ptr [ebp - 4], 1
L32:
    cmp dword ptr [ebp - 4], 0
    je L33
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    sete al
    jmp L37
L33:
    mov esi, dword ptr [ecx + 24]
    mov eax, dword ptr [edx + 24]
L34:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L35
    test cl, cl
    je L15
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L35
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L34
    jmp L15
L35:
    sbb eax, eax
    sbb eax, -1
L36:
    xor ecx, ecx
    test eax, eax
    sete cl
    mov eax, ecx
    mov ecx, dword ptr [ebp + 12]
L37:
    test eax, eax
    je L10
L38:
    mov edx, dword ptr [edx + 12]
    mov ecx, dword ptr [ecx + 12]
L39:
    test edx, edx
    mov dword ptr [ebp + 12], ecx
    jne L7
    jmp L11
L40:
    xor eax, eax
L41:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_10064ccb ENDP
END
