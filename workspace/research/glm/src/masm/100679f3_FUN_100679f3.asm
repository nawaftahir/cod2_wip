.686
.MODEL FLAT, C
.CODE
FUN_100679f3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 12]
    and dword ptr [eax], 0
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dl, byte ptr [esi]
    mov byte ptr [eax], dl
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [ecx + 4]
    lea edx, [esi + 1]
    cmp edx, ecx
    push edi
    mov dword ptr [ebp + 12], ecx
    jae L7
    mov bl, byte ptr [esi]
    cmp bl, 35
    jne L1
    mov cl, byte ptr [edx]
    cmp cl, bl
    je L0
    cmp cl, 64
    jne L1
L0:
    mov byte ptr [eax + 1], cl
    jmp L12
L1:
    mov dl, byte ptr [edx]
    cmp bl, dl
    jne L6
    movsx edi, bl
    cmp edi, 58
    jg L2
    je L3
    sub edi, 38
    je L3
    sub edi, 5
    je L3
    dec edi
    dec edi
    je L3
    dec edi
    jne L7
    lea ecx, [esi + 2]
    cmp ecx, dword ptr [ebp + 12]
    jae L7
    cmp byte ptr [ecx], 46
    jne L7
    mov byte ptr [eax + 1], dl
    mov cl, byte ptr [ecx]
    mov byte ptr [eax + 2], cl
    jmp L5
L2:
    sub edi, 60
    je L4
    dec edi
    je L3
    dec edi
    je L4
    sub edi, 62
    jne L7
L3:
    mov byte ptr [eax + 1], dl
    jmp L12
L4:
    mov ecx, dword ptr [ebp - 4]
    mov byte ptr [eax + 1], dl
    lea edx, [esi + 2]
    cmp edx, dword ptr [ecx + 4]
    jae L12
    cmp byte ptr [edx], 61
    jne L12
    mov byte ptr [eax + 2], 61
L5:
    push 3
    jmp L13
L6:
    cmp dl, 61
    jne L11
    movsx ecx, bl
    cmp ecx, 47
    jg L9
    je L10
    cmp ecx, 33
    je L10
    cmp ecx, 36
    jle L7
    cmp ecx, 38
    jle L10
    cmp ecx, 41
    jle L7
    cmp ecx, 43
    jle L10
    cmp ecx, 45
    je L10
L7:
    xor eax, eax
    inc eax
L8:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L9:
    sub ecx, 60
    je L10
    dec ecx
    dec ecx
    je L10
    sub ecx, 32
    je L10
    sub ecx, 30
    jne L7
L10:
    mov byte ptr [eax + 1], 61
    jmp L12
L11:
    cmp bl, 45
    jne L7
    cmp dl, 62
    jne L7
    mov byte ptr [eax + 1], dl
L12:
    push 2
L13:
    pop eax
    jmp L8
FUN_100679f3 ENDP
END
