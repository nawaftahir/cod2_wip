.686
.MODEL FLAT, C
.CODE
parse_cmdline PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 12]
    xor edx, edx
    cmp dword ptr [ebp + 8], edx
    push edi
    mov dword ptr [esi], edx
    mov edi, ecx
    mov dword ptr [ebx], 1
    je L0
    mov ecx, dword ptr [ebp + 8]
    add dword ptr [ebp + 8], 4
    mov dword ptr [ecx], edi
L0:
    cmp byte ptr [eax], 34
    jne L1
    xor ecx, ecx
    test edx, edx
    sete cl
    inc eax
    mov edx, ecx
    mov cl, 34
    jmp L5
L1:
    inc dword ptr [esi]
    test edi, edi
    je L2
    mov cl, byte ptr [eax]
    mov byte ptr [edi], cl
    inc edi
L2:
    mov cl, byte ptr [eax]
    movzx ebx, cl
    inc eax
    test byte ptr [ebx + 01076AA41h], 4
    je L4
    inc dword ptr [esi]
    test edi, edi
    je L3
    mov bl, byte ptr [eax]
    mov byte ptr [edi], bl
    inc edi
L3:
    inc eax
L4:
    test cl, cl
    mov ebx, dword ptr [ebp + 12]
    je L11
L5:
    test edx, edx
    jne L0
    cmp cl, 32
    je L6
    cmp cl, 9
    jne L0
L6:
    test edi, edi
    je L7
    mov byte ptr [edi - 1], 0
L7:
    and dword ptr [ebp - 4], 0
L8:
    cmp byte ptr [eax], 0
    je L31
L9:
    mov cl, byte ptr [eax]
    cmp cl, 32
    je L10
    cmp cl, 9
    jne L12
L10:
    inc eax
    jmp L9
L11:
    dec eax
    jmp L7
L12:
    cmp byte ptr [eax], 0
    je L31
    cmp dword ptr [ebp + 8], 0
    je L13
    mov ecx, dword ptr [ebp + 8]
    add dword ptr [ebp + 8], 4
    mov dword ptr [ecx], edi
L13:
    inc dword ptr [ebx]
L14:
    xor ebx, ebx
    inc ebx
    xor edx, edx
    jmp L16
L15:
    inc eax
    inc edx
L16:
    cmp byte ptr [eax], 92
    je L15
    cmp byte ptr [eax], 34
    jne L20
    test dl, 1
    jne L19
    cmp dword ptr [ebp - 4], 0
    je L17
    lea ecx, [eax + 1]
    cmp byte ptr [ecx], 34
    jne L17
    mov eax, ecx
    jmp L18
L17:
    xor ebx, ebx
L18:
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    sete cl
    mov dword ptr [ebp - 4], ecx
L19:
    shr edx, 1
L20:
    test edx, edx
    je L23
L21:
    test edi, edi
    je L22
    mov byte ptr [edi], 92
    inc edi
L22:
    inc dword ptr [esi]
    dec edx
    jne L21
L23:
    mov cl, byte ptr [eax]
    test cl, cl
    je L29
    cmp dword ptr [ebp - 4], 0
    jne L24
    cmp cl, 32
    je L29
    cmp cl, 9
    je L29
L24:
    test ebx, ebx
    je L28
    test edi, edi
    je L26
    movzx edx, cl
    test byte ptr [edx + 01076AA41h], 4
    je L25
    mov byte ptr [edi], cl
    inc edi
    inc eax
    inc dword ptr [esi]
L25:
    mov cl, byte ptr [eax]
    mov byte ptr [edi], cl
    inc edi
    jmp L27
L26:
    movzx ecx, cl
    test byte ptr [ecx + 01076AA41h], 4
    je L27
    inc eax
    inc dword ptr [esi]
L27:
    inc dword ptr [esi]
L28:
    inc eax
    jmp L14
L29:
    test edi, edi
    je L30
    mov byte ptr [edi], 0
    inc edi
L30:
    inc dword ptr [esi]
    mov ebx, dword ptr [ebp + 12]
    jmp L8
L31:
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L32
    and dword ptr [eax], 0
L32:
    inc dword ptr [ebx]
    pop edi
    pop ebx
    leave
    ret
parse_cmdline ENDP
END
