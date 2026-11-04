.686
.MODEL FLAT, C
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_1005f5c0 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    xor ecx, ecx
    test edx, edx
    push esi
    mov esi, dword ptr [edi]
    mov byte ptr [eax], cl
    jne L5
    mov dl, byte ptr [esi]
    cmp dl, 13
    je L4
    cmp dl, 10
    je L4
L0:
    mov edx, dword ptr [g_101AAC74]
    mov dword ptr [g_101AAC78], edx
    mov dword ptr [g_101AAC74], esi
    mov dl, byte ptr [esi]
    test dl, dl
    push ebx
    je L3
    mov bl, 34
L1:
    cmp dl, 44
    je L11
    cmp dl, 10
    je L11
    cmp dl, 13
    je L2
    cmp dl, bl
    je L7
    cmp ecx, 0000003FFh
    jae L2
    mov byte ptr [ecx + eax], dl
    inc ecx
L2:
    mov dl, byte ptr [esi + 1]
    inc esi
    test dl, dl
    jne L1
L3:
    mov dword ptr [edi], 0
    mov byte ptr [ecx + eax], 0
    pop ebx
L4:
    pop esi
    ret
L5:
    mov dl, byte ptr [esi]
    cmp dl, 13
    je L6
    cmp dl, 10
    jne L0
L6:
    inc esi
    jmp L5
L7:
    inc esi
L8:
    mov dl, byte ptr [esi]
    cmp dl, bl
    jne L10
    cmp byte ptr [esi + 1], bl
    jne L2
    cmp ecx, 0000003FFh
    jae L9
    mov byte ptr [ecx + eax], bl
    inc ecx
L9:
    add esi, 2
    jmp L8
L10:
    cmp ecx, 0000003FFh
    jae L7
    mov byte ptr [ecx + eax], dl
    inc ecx
    jmp L7
L11:
    mov dl, byte ptr [esi]
    test dl, dl
    je L3
    cmp dl, 10
    je L12
    inc esi
L12:
    mov dword ptr [edi], esi
    pop ebx
    mov byte ptr [ecx + eax], 0
    pop esi
    ret
FUN_1005f5c0 ENDP
END
