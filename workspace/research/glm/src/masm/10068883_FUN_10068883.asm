.686
.MODEL FLAT, C
EXTRN sub_100F73B3:PROC
EXTRN sub_100F7462:PROC
EXTRN sub_100F855E:PROC
EXTRN sub_100F85E8:PROC
EXTRN sub_100F8670:PROC
.CODE
FUN_10068883 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    cmp byte ptr [edi], 0
    mov esi, edi
    je L1
L0:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F855E
    test eax, eax
    pop ecx
    je L1
    inc esi
    cmp byte ptr [esi], 0
    jne L0
L1:
    cmp byte ptr [esi], 0
    je L2
    push esi
    call sub_100F7462
    pop ecx
    mov byte ptr [ebp - 1], al
    jmp L3
L2:
    mov byte ptr [ebp - 1], 0
L3:
    cmp byte ptr [ebp - 1], 15
    jbe L4
    mov eax, dword ptr [ebp + 12]
    mov byte ptr [eax], 0
    mov eax, dword ptr [ebp + 16]
    mov byte ptr [eax], 0000000FFh
    mov eax, 080004005h
    jmp L26
L4:
    push ebx
    mov ebx, esi
    sub ebx, edi
    je L24
    cmp ebx, 20
    ja L24
    mov al, byte ptr [esi]
    test al, al
    je L7
L5:
    movsx eax, al
    push eax
    call sub_100F8670
    test eax, eax
    pop ecx
    je L6
    inc esi
    mov al, byte ptr [esi]
    test al, al
    jne L5
L6:
    cmp byte ptr [esi], 0
    jne L24
L7:
    cmp byte ptr [edi], 0
    mov esi, edi
    je L9
    lea edi, [ebp - 28]
    sub edi, dword ptr [ebp + 8]
L8:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F85E8
    test eax, eax
    pop ecx
    je L9
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F73B3
    mov byte ptr [edi + esi], al
    inc esi
    cmp byte ptr [esi], 0
    pop ecx
    jne L8
L9:
    push 9
    pop edx
    mov edi, 01010EBE8h
    lea esi, [ebp - 28]
    mov ecx, edx
    xor eax, eax
    mov byte ptr [ebp + ebx - 28], 0
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L10
    xor al, al
    jmp L23
L10:
    push 12
    mov edi, 01010EBDCh
    lea esi, [ebp - 28]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L11
    mov al, 1
    jmp L23
L11:
    push 13
    mov edi, 01010EBCCh
    lea esi, [ebp - 28]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L12
    mov al, 2
    jmp L23
L12:
    push 7
    mov edi, 01010EBC4h
    lea esi, [ebp - 28]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L13
    mov al, 3
    jmp L23
L13:
    push 6
    pop eax
    mov edi, 01010EBBCh
    lea esi, [ebp - 28]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov al, 4
    jmp L23
L14:
    mov edi, 01010EBB0h
    lea esi, [ebp - 28]
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L15
    mov al, 5
    jmp L23
L15:
    push 8
    mov edi, 01010EBA8h
    lea esi, [ebp - 28]
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L23
    mov edi, 01010EB9Ch
    lea esi, [ebp - 28]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L16
    mov al, 7
    jmp L23
L16:
    push 11
    pop eax
    mov edi, 01010EB90h
    lea esi, [ebp - 28]
    mov ecx, eax
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L17
    mov al, 8
    jmp L23
L17:
    push 10
    mov edi, 01010EB84h
    lea esi, [ebp - 28]
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L18
    mov al, dl
    jmp L23
L18:
    push 6
    mov edi, 01010EB7Ch
    lea esi, [ebp - 28]
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L22
    push 4
    mov edi, 01010EB78h
    lea esi, [ebp - 28]
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L23
    push 6
    mov edi, 01010EB70h
    lea esi, [ebp - 28]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L19
    mov al, 12
    jmp L23
L19:
    push 7
    mov edi, 01010EB68h
    lea esi, [ebp - 28]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L20
    mov al, 13
    jmp L23
L20:
    push 8
    mov edi, 01010EB60h
    lea esi, [ebp - 28]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L21
    mov byte ptr [ebp - 1], al
    jmp L22
L21:
    mov edi, 01010EB54h
    lea esi, [ebp - 28]
    mov ecx, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L24
    mov byte ptr [ebp - 1], 1
L22:
    mov al, 10
L23:
    mov ecx, dword ptr [ebp + 12]
    mov byte ptr [ecx], al
    mov eax, dword ptr [ebp + 16]
    mov cl, byte ptr [ebp - 1]
    mov byte ptr [eax], cl
    xor eax, eax
    jmp L25
L24:
    mov eax, 080004005h
L25:
    pop ebx
L26:
    pop edi
    pop esi
    leave
    ret 12
FUN_10068883 ENDP
END
