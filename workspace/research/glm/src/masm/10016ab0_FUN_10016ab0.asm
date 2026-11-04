.686
.MODEL FLAT, C
.CODE
FUN_10016ab0 PROC
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
    and edx, 31
    mov edi, edx
    mov eax, dword ptr [edi*4 + 0101DA3DCh]
    test eax, eax
    je L7
L2:
    mov eax, dword ptr [eax]
    mov esi, ebp
    lea ebx, [ebx]
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
    je L8
    inc edi
    and edi, 31
    mov eax, dword ptr [edi*4 + 0101DA3DCh]
    test eax, eax
    jne L2
L7:
    mov dword ptr [ebx], edi
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
L8:
    mov dword ptr [ebx], edi
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
FUN_10016ab0 ENDP
END
