; FUN_1005f5c0 @ 0x1005f5c0 — auto-synthesized
    EXTRN g_101aac70:DWORD
    EXTRN g_101aac74:DWORD
    EXTRN g_101aac78:DWORD
.CODE
FUN_1005f5c0 PROC
    mov eax, dword ptr [g_101aac70]
    imul eax, eax, 0x45c
    add eax, 0x101a66b0
    xor ecx, ecx
    test edx, edx
    push esi
    mov esi, dword ptr [edi]
    mov byte ptr [eax], cl
    jne L0
    mov dl, byte ptr [esi]
    cmp dl, 0xd
    je L1
    cmp dl, 0xa
    je L1
    mov edx, dword ptr [g_101aac74]
    mov dword ptr [g_101aac78], edx
    mov dword ptr [g_101aac74], esi
    mov dl, byte ptr [esi]
    test dl, dl
    push ebx
    je L2
    mov bl, 0x22
    cmp dl, 0x2c
    je L3
    cmp dl, 0xa
    je L3
    cmp dl, 0xd
    je L4
    cmp dl, bl
    je L5
    cmp ecx, 0x3ff
    jae L4
    mov byte ptr [ecx + eax], dl
    inc ecx
    mov dl, byte ptr [esi + 1]
    inc esi
    test dl, dl
    jne L6
    mov dword ptr [edi], 0
    mov byte ptr [ecx + eax], 0
    pop ebx
    pop esi
    ret
    mov dl, byte ptr [esi]
    cmp dl, 0xd
    je L7
    cmp dl, 0xa
    jne L8
    inc esi
    jmp L0
    inc esi
    mov dl, byte ptr [esi]
    cmp dl, bl
    jne L9
    cmp byte ptr [esi + 1], bl
    jne L4
    cmp ecx, 0x3ff
    jae L10
    mov byte ptr [ecx + eax], bl
    inc ecx
    add esi, 2
    jmp L11
    cmp ecx, 0x3ff
    jae L5
    mov byte ptr [ecx + eax], dl
    inc ecx
    jmp L5
    mov dl, byte ptr [esi]
    test dl, dl
    je L2
    cmp dl, 0xa
    je L12
    inc esi
    mov dword ptr [edi], esi
    pop ebx
    mov byte ptr [ecx + eax], 0
    pop esi
    ret
FUN_1005f5c0 ENDP
END