.686
.MODEL FLAT, C
.CODE
FUN_100566a0 PROC
    sub esp, 28
    mov eax, dword ptr [esp + 32]
    mov edx, dword ptr [ecx + 0000001B0h]
    mov ecx, dword ptr [edx + 24]
    mov edx, dword ptr [eax]
    push ebx
    mov ebx, dword ptr [eax + 20]
    push ebp
    mov ebp, dword ptr [eax + 12]
    push esi
    mov esi, dword ptr [eax + 4]
    cmp edx, esi
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [eax + 8]
    push edi
    mov edi, dword ptr [eax + 16]
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 20], esi
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 40], ebp
    mov dword ptr [esp + 24], ebx
    jge L14
    mov eax, edx
    mov dword ptr [esp + 32], eax
    jmp L0
    lea ecx, [ecx]
L0:
    cmp ecx, ebp
    mov esi, ecx
    jg L4
    mov edx, dword ptr [esp + 36]
    mov eax, dword ptr [edx + eax*4]
    shl ecx, 5
    add ecx, edi
    lea edx, [eax + ecx*2]
L1:
    cmp edi, ebx
    mov ecx, edx
    mov eax, edi
    jg L3
    lea ecx, [ecx]
L2:
    mov bx, word ptr [ecx]
    add ecx, 2
    test bx, bx
    mov ebx, dword ptr [esp + 24]
    jne L5
    inc eax
    cmp eax, ebx
    jle L2
L3:
    inc esi
    add edx, 64
    cmp esi, ebp
    jle L1
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 32]
L4:
    mov edx, dword ptr [esp + 20]
    inc eax
    cmp eax, edx
    mov dword ptr [esp + 32], eax
    jle L0
    jmp L6
L5:
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [esp + 28], eax
L6:
    mov edx, dword ptr [esp + 28]
    mov esi, dword ptr [esp + 20]
    cmp esi, edx
    jle L14
    mov eax, esi
    mov dword ptr [esp + 32], eax
L7:
    cmp ecx, ebp
    mov esi, ecx
    jg L11
    mov edx, dword ptr [esp + 36]
    mov eax, dword ptr [edx + eax*4]
    shl ecx, 5
    add ecx, edi
    lea edx, [eax + ecx*2]
    lea esp, [esp]
L8:
    cmp edi, ebx
    mov ecx, edx
    mov eax, edi
    jg L10
    jmp L9
    lea ebx, [ebx]
L9:
    mov bx, word ptr [ecx]
    add ecx, 2
    test bx, bx
    mov ebx, dword ptr [esp + 24]
    jne L12
    inc eax
    cmp eax, ebx
    jle L9
L10:
    inc esi
    add edx, 64
    cmp esi, ebp
    jle L8
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 32]
L11:
    mov edx, dword ptr [esp + 28]
    dec eax
    cmp eax, edx
    mov dword ptr [esp + 32], eax
    jge L7
    jmp L13
L12:
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [ecx + 4], eax
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [esp + 20], eax
L13:
    mov edx, dword ptr [esp + 28]
L14:
    cmp ecx, ebp
    jge L28
    mov esi, ecx
    shl esi, 5
    add esi, edi
    mov dword ptr [esp + 32], ecx
    shl esi, 1
    nop
L15:
    cmp edx, dword ptr [esp + 20]
    mov ebx, dword ptr [esp + 24]
    jg L19
    lea ebx, [ebx]
L16:
    mov eax, dword ptr [esp + 36]
    mov eax, dword ptr [eax + edx*4]
    add eax, esi
    cmp edi, ebx
    mov ecx, edi
    jg L18
    nop
L17:
    mov bx, word ptr [eax]
    add eax, 2
    test bx, bx
    mov ebx, dword ptr [esp + 24]
    jne L20
    inc ecx
    cmp ecx, ebx
    jle L17
L18:
    mov eax, dword ptr [esp + 20]
    inc edx
    cmp edx, eax
    jle L16
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 28]
L19:
    mov eax, dword ptr [esp + 32]
    inc eax
    add esi, 64
    cmp eax, ebp
    mov dword ptr [esp + 32], eax
    jle L15
    jmp L21
L20:
    mov ecx, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 48]
    mov dword ptr [edx + 8], ecx
    mov edx, dword ptr [esp + 28]
    mov dword ptr [esp + 16], ecx
L21:
    cmp ebp, ecx
    jle L28
    mov esi, ebp
    shl esi, 5
    add esi, edi
    mov dword ptr [esp + 32], ebp
    shl esi, 1
    nop
L22:
    cmp edx, dword ptr [esp + 20]
    mov ebx, dword ptr [esp + 24]
    jg L26
    lea ebx, [ebx]
L23:
    mov eax, dword ptr [esp + 36]
    mov eax, dword ptr [eax + edx*4]
    add eax, esi
    cmp edi, ebx
    mov ecx, edi
    jg L25
    nop
L24:
    mov bx, word ptr [eax]
    add eax, 2
    test bx, bx
    mov ebx, dword ptr [esp + 24]
    jne L27
    inc ecx
    cmp ecx, ebx
    jle L24
L25:
    mov eax, dword ptr [esp + 20]
    inc edx
    cmp edx, eax
    jle L23
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 28]
L26:
    mov eax, dword ptr [esp + 32]
    dec eax
    sub esi, 64
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    jge L22
    jmp L28
L27:
    mov ebp, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [ecx + 12], ebp
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [esp + 40], ebp
L28:
    cmp edi, ebx
    jge L42
    mov dword ptr [esp + 32], edi
L29:
    mov esi, dword ptr [esp + 28]
    cmp esi, dword ptr [esp + 20]
    jg L33
    mov eax, dword ptr [esp + 32]
    mov edx, ecx
    shl edx, 5
    add edx, eax
    shl edx, 1
    lea ecx, [ecx]
L30:
    mov eax, dword ptr [esp + 36]
    mov eax, dword ptr [eax + esi*4]
    add eax, edx
    cmp dword ptr [esp + 16], ebp
    jg L32
    nop
L31:
    cmp word ptr [eax], 0
    jne L34
    inc ecx
    add eax, 64
    cmp ecx, ebp
    jle L31
L32:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 16]
    inc esi
    cmp esi, eax
    jle L30
L33:
    mov eax, dword ptr [esp + 32]
    inc eax
    cmp eax, ebx
    mov dword ptr [esp + 32], eax
    jle L29
    jmp L35
L34:
    mov ecx, dword ptr [esp + 48]
    mov edi, dword ptr [esp + 32]
    mov dword ptr [ecx + 16], edi
    mov ecx, dword ptr [esp + 16]
L35:
    cmp ebx, edi
    jle L42
    mov dword ptr [esp + 32], ebx
L36:
    mov esi, dword ptr [esp + 28]
    cmp esi, dword ptr [esp + 20]
    jg L40
    mov eax, dword ptr [esp + 32]
    mov edx, ecx
    shl edx, 5
    add edx, eax
    shl edx, 1
    lea esp, [esp]
L37:
    mov eax, dword ptr [esp + 36]
    mov eax, dword ptr [eax + esi*4]
    add eax, edx
    cmp dword ptr [esp + 16], ebp
    jg L39
    nop
L38:
    cmp word ptr [eax], 0
    jne L41
    inc ecx
    add eax, 64
    cmp ecx, ebp
    jle L38
L39:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 16]
    inc esi
    cmp esi, eax
    jle L37
L40:
    mov eax, dword ptr [esp + 32]
    dec eax
    cmp eax, edi
    mov dword ptr [esp + 32], eax
    jge L36
    jmp L42
L41:
    mov ebx, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [ecx + 20], ebx
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [esp + 24], ebx
L42:
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 20]
    sub eax, edx
    mov esi, ebp
    sub esi, ecx
    sub ebx, edi
    mov edx, ebx
    shl edx, 4
    mov ebp, edx
    imul ebp, edx
    lea ecx, [esi + esi*2]
    shl ecx, 2
    mov edx, ecx
    imul edx, ecx
    shl eax, 3
    mov ecx, eax
    imul ecx, eax
    mov eax, dword ptr [esp + 28]
    add ebp, edx
    mov edx, dword ptr [esp + 48]
    add ebp, ecx
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [edx + 24], ebp
    xor ebp, ebp
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    jg L49
    jmp L43
    lea ecx, [ecx]
L43:
    mov eax, dword ptr [esp + 16]
    cmp eax, dword ptr [esp + 40]
    jg L48
    mov edx, dword ptr [esp + 36]
    mov ecx, eax
    mov eax, dword ptr [esp + 32]
    mov edx, dword ptr [edx + eax*4]
    shl ecx, 5
    add ecx, edi
    lea eax, [esi + 1]
    lea edx, [edx + ecx*2]
    mov dword ptr [esp + 28], eax
L44:
    cmp edi, dword ptr [esp + 24]
    mov eax, edx
    jg L47
    lea ecx, [ebx + 1]
L45:
    cmp word ptr [eax], 0
    je L46
    inc ebp
L46:
    add eax, 2
    dec ecx
    jne L45
L47:
    mov eax, dword ptr [esp + 28]
    add edx, 64
    dec eax
    mov dword ptr [esp + 28], eax
    jne L44
L48:
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 20]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    jle L43
    mov ecx, dword ptr [esp + 48]
    pop edi
    pop esi
    mov dword ptr [ecx + 28], ebp
    pop ebp
    pop ebx
    add esp, 28
    ret
FUN_100566a0 ENDP
END
