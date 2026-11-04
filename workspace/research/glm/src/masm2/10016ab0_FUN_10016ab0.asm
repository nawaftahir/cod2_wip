.686
.MODEL FLAT, C
EXTRN sub_10016B50:PROC
EXTRN sub_10016B5C:PROC
EXTRN sub_10016B62:PROC
EXTRN sub_10016B6A:PROC
EXTRN sub_10016B7D:PROC
EXTRN sub_10016BA1:PROC
.CODE
FUN_10016ab0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    mov mov cl, byte ptr [ebp]
    push push esi
    xor xor edx, edx
    test test cl, cl
    push push edi
    mov mov eax, 119
    je L0
    movsx movsx ecx, cl
    imul imul ecx, eax
    add add edx, ecx
    mov mov cl, byte ptr [eax + ebp - 118]
    inc inc eax
    test test cl, cl
    jne L0
    and and edx, 31
    mov mov edi, edx
    mov mov eax, dword ptr [edi*4 + 0101DA3DCh]
    test test eax, eax
    je sub_10016B62
    mov mov eax, dword ptr [eax]
    mov mov esi, ebp
    lea lea ebx, [ebx]
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne sub_10016B5C
    test test cl, cl
    je sub_10016B5C
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne sub_10016B6A
    add add eax, 2
    add add esi, 2
    test test cl, cl
    jne sub_10016B50
    xor xor eax, eax
    jmp sub_10016B7D
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_10016BA1
    inc inc edi
    and and edi, 31
    mov mov eax, dword ptr [edi*4 + 0101DA3DCh]
    test test eax, eax
    jne sub_10016B62
    mov mov dword ptr [ebx], edi
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
    mov mov dword ptr [ebx], edi
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
FUN_10016ab0 ENDP
END
