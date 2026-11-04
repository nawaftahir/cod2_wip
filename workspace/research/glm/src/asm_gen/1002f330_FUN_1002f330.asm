; FUN_1002f330 @ 0x1002f330 — auto-synthesized
    EXTRN g_101ce748:DWORD
    EXTRN g_101ce828:DWORD
    EXTRN g_106d3194:DWORD
    EXTRN g_1072ddc4:DWORD
.CODE
FUN_1002f330 PROC
    cmp eax, 6
    push esi
    jne L0
    cmp edx, 0x1f
    jne L0
    cmp ecx, 0x7fe
    jne L1
    mov eax, 9
    jmp L2
    cmp ecx, 0x7ff
    jne L3
    mov eax, 0xf
    jmp L2
    mov edx, dword ptr [g_1072ddc4]
    imul ecx, ecx, 0x74
    mov esi, dword ptr [ecx + edx]
    xor eax, eax
    cmp esi, 2
    setne al
    dec eax
    and eax, 3
    add eax, 9
    jmp L2
    mov edx, dword ptr [g_101ce748]
    push ebx
    mov bl, byte ptr [edx + 8]
    test bl, bl
    pop ebx
    jne L4
    test eax, eax
    je L5
    cmp eax, 2
    jne L4
    cmp ecx, 0x7ff
    je L6
    cmp ecx, 0x7fe
    jge L4
    mov esi, dword ptr [g_1072ddc4]
    imul ecx, ecx, 0x74
    mov edx, dword ptr [ecx + esi]
    add ecx, esi
    cmp edx, 2
    jg L4
    mov edx, dword ptr [ecx + 4]
    test dh, 1
    jne L4
    or eax, 0xffffffff
    pop esi
    ret
    cmp eax, 3
    jl L7
    cmp eax, 0x1a
    jg L7
    mov ecx, dword ptr [g_101ce828]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    jne L8
    xor ecx, ecx
    add eax, ecx
    pop esi
    ret
    mov edx, dword ptr [g_106d3194]
    mov ecx, dword ptr [edx + 0x219cec]
    add eax, ecx
    pop esi
    ret
FUN_1002f330 ENDP
END