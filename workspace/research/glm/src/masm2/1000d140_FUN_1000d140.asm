.686
.MODEL FLAT, C
EXTRN sub_1000D1F6:PROC
EXTRN sub_1000D1FA:PROC
EXTRN sub_1000D20D:PROC
EXTRN sub_1000D22C:PROC
EXTRN sub_1000D26C:PROC
EXTRN sub_1000D274:PROC
.CODE
FUN_1000d140 PROC
    mov mov cl, byte ptr [ebx]
    xor xor edx, edx
    test test cl, cl
    mov mov eax, 119
    je L0
    lea lea ecx, [ecx]
    movsx movsx ecx, cl
    imul imul ecx, eax
    add add edx, ecx
    mov mov cl, byte ptr [ebx + eax - 118]
    inc inc eax
    test test cl, cl
    jne L1
    and and edx, 07FFh
    push push ebp
    mov mov ebp, edx
    push push edi
    mov mov edi, dword ptr [ebp*4 + 0101CEA68h]
    test test edi, edi
    je sub_1000D1F6
    push push esi
    mov mov esi, dword ptr [edi + 32]
    mov mov eax, ebx
    lea lea esp, [esp]
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne L3
    test test cl, cl
    je L3
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne sub_1000D1FA
    add add eax, 2
    add add esi, 2
    test test cl, cl
    jne L2
    xor xor eax, eax
    jmp sub_1000D20D
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_1000D22C
    inc inc ebp
    and and ebp, 07FFh
    mov mov edi, dword ptr [ebp*4 + 0101CEA68h]
    test test edi, edi
    jne sub_1000D1F6
    pop pop esi
    cmp cmp edi, 0101CE890h
    jb sub_1000D26C
    cmp cmp edi, 0101CEA64h
    jae sub_1000D274
    xor xor ecx, ecx
    mov mov eax, 1
    test test al, al
    setne setne cl
    dec dec ecx
    and and ecx, edi
    pop pop edi
L2:
    mov mov eax, ecx
    pop pop ebp
    ret ret
    xor xor eax, eax
    xor xor ecx, ecx
    test test al, al
    setne setne cl
    dec dec ecx
    and and ecx, edi
    pop pop edi
    mov mov eax, ecx
    pop pop ebp
    ret ret
FUN_1000d140 ENDP
END
