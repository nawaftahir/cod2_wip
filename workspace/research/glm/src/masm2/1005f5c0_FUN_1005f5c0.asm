.686
.MODEL FLAT, C
EXTRN sub_1005F69A:PROC
EXTRN sub_1005F6B2:PROC
EXTRN sub_1005F6B7:PROC
EXTRN sub_1005F6BB:PROC
EXTRN sub_1005F6BC:PROC
EXTRN sub_1005F6BF:PROC
EXTRN sub_1005F6DF:PROC
EXTRN sub_1005F6E8:PROC
EXTRN sub_1005F6EE:PROC
EXTRN sub_1005F6EF:PROC
EXTRN sub_1005F6F5:PROC
EXTRN sub_1005F6F6:PROC
EXTRN sub_1005F737:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_1005f5c0 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    xor xor ecx, ecx
    test test edx, edx
    push push esi
    mov mov esi, dword ptr [edi]
    mov mov byte ptr [eax], cl
    jne L0
    mov mov dl, byte ptr [esi]
    cmp cmp dl, 13
    je L1
    cmp cmp dl, 10
    je L2
    mov mov edx, dword ptr [g_101AAC74]
    mov mov dword ptr [g_101AAC78], edx
    mov mov dword ptr [g_101AAC74], esi
    mov mov dl, byte ptr [esi]
    test test dl, dl
    push push ebx
    je L3
    mov mov bl, 34
    cmp cmp dl, 44
    je sub_1005F6B7
    cmp cmp dl, 10
    je sub_1005F6BC
    cmp cmp dl, 13
    je L5
    cmp cmp dl, bl
    je sub_1005F69A
    cmp cmp ecx, 03FFh
    jae L6
    mov mov byte ptr [ecx + eax], dl
    inc inc ecx
    mov mov dl, byte ptr [esi + 1]
    inc inc esi
    test test dl, dl
    jne L4
    mov mov dword ptr [edi], 0
    mov mov byte ptr [ecx + eax], 0
    pop pop ebx
    pop pop esi
    ret ret
    mov mov dl, byte ptr [esi]
    cmp cmp dl, 13
    je sub_1005F6BF
    cmp cmp dl, 10
    jne L3
    inc inc esi
    jmp sub_1005F6BB
    inc inc esi
    mov mov dl, byte ptr [esi]
    cmp cmp dl, bl
    jne sub_1005F6EE
    cmp cmp byte ptr [esi + 1], bl
    jne sub_1005F6B2
L0:
    cmp cmp ecx, 03FFh
    jae sub_1005F6F6
    mov mov byte ptr [ecx + eax], bl
    inc inc ecx
    add add esi, 2
    jmp sub_1005F6E8
    cmp cmp ecx, 03FFh
    jae sub_1005F6EF
    mov mov byte ptr [ecx + eax], dl
    inc inc ecx
    jmp sub_1005F6F5
    mov mov dl, byte ptr [esi]
L5:
    test test dl, dl
    je sub_1005F6DF
    cmp cmp dl, 10
    je sub_1005F737
    inc inc esi
    mov mov dword ptr [edi], esi
L6:
    pop pop ebx
    mov mov byte ptr [ecx + eax], 0
    pop pop esi
    ret ret
FUN_1005f5c0 ENDP
END
