.686
.MODEL FLAT, C
EXTRN sub_10016CE0:PROC
EXTRN sub_10016CE1:PROC
EXTRN sub_10016CE9:PROC
EXTRN sub_10016CEC:PROC
EXTRN sub_10016CFA:PROC
EXTRN sub_10016D0D:PROC
EXTRN sub_10016D38:PROC
.CODE
FUN_10016c10 PROC
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
    mov mov edi, dword ptr [esp + 20]
    imul imul edi, edi, 97
    add add edi, edx
    add add edi, ebx
    and and edi, 0FFh
    mov mov eax, dword ptr [edi*4 + 0101DA564h]
    test test eax, eax
    je sub_10016CE9
    movzx movzx edx, byte ptr [eax + 10]
    cmp cmp edx, dword ptr [esp + 20]
    jne sub_10016CE1
    movzx movzx ecx, byte ptr [eax + 11]
    cmp cmp ecx, ebx
    jne sub_10016CE9
    mov mov eax, dword ptr [eax]
    mov mov esi, ebp
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne sub_10016CEC
    test test cl, cl
    je sub_10016CEC
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne sub_10016CFA
    add add eax, 2
    add add esi, 2
    test test cl, cl
    jne sub_10016CE0
    xor xor eax, eax
    jmp sub_10016D0D
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_10016D38
    inc inc edi
    and and edi, 0FFh
    mov mov eax, dword ptr [edi*4 + 0101DA564h]
    test test eax, eax
    jne sub_10016CE9
    mov mov ecx, dword ptr [esp + 24]
    mov mov dword ptr [ecx], edi
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [esp + 24]
    mov mov dword ptr [eax], edi
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
FUN_10016c10 ENDP
END
