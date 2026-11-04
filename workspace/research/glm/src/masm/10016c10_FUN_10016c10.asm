.686
.MODEL FLAT, C
.CODE
FUN_10016c10 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov cl, byte ptr [ebp]
    push esi
    xor edx, edx
    test cl, cl
    push edi
    mov eax, 119
    je L1
L0:
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [eax + ebp - 118]
    inc eax
    test cl, cl
    jne L0
L1:
    mov edi, dword ptr [esp + 20]
    imul edi, edi, 97
    add edi, edx
    add edi, ebx
    and edi, 0000000FFh
    mov eax, dword ptr [edi*4 + 0101DA564h]
    test eax, eax
    je L8
L2:
    movzx edx, byte ptr [eax + 10]
    cmp edx, dword ptr [esp + 20]
    jne L7
    movzx ecx, byte ptr [eax + 11]
    cmp ecx, ebx
    jne L7
    mov eax, dword ptr [eax]
    mov esi, ebp
L3:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L5
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L5
    add eax, 2
    add esi, 2
    test cl, cl
    jne L3
L4:
    xor eax, eax
    jmp L6
L5:
    sbb eax, eax
    sbb eax, -1
L6:
    test eax, eax
    je L9
L7:
    inc edi
    and edi, 0000000FFh
    mov eax, dword ptr [edi*4 + 0101DA564h]
    test eax, eax
    jne L2
L8:
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [ecx], edi
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
L9:
    mov eax, dword ptr [esp + 24]
    mov dword ptr [eax], edi
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
FUN_10016c10 ENDP
END
