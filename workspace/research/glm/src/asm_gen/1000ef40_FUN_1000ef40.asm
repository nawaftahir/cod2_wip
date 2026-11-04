; FUN_1000ef40 @ 0x1000ef40 — auto-synthesized
.CODE
FUN_1000ef40 PROC
    cmp ecx, 0x4b
    push esi
    mov esi, dword ptr [esp + 8]
    jg L0
    je L1
    add ecx, -0x15
    cmp ecx, 0x32
    ja L2
    movzx ecx, byte ptr [ecx + 0x1000efe8]
    jmp dword ptr [ecx*4 + 0x1000efd8]
    imul eax, esi
    imul eax, edx
    pop esi
    ret
    cmp ecx, 0x31545844
    jg L3
    je L4
    cmp ecx, 0x50
    je L5
    cmp ecx, 0x72
    jne L2
    imul eax, esi
    imul eax, edx
    shl eax, 2
    pop esi
    ret
    imul eax, esi
    imul eax, edx
    shl eax, 1
    pop esi
    ret
    add eax, 3
    add esi, 3
    sar eax, 2
    sar esi, 2
    imul eax, esi
    imul eax, edx
    shl eax, 3
    pop esi
    ret
    cmp ecx, 0x33545844
    je L6
    cmp ecx, 0x35545844
    je L6
    xor eax, eax
    pop esi
    ret
    add eax, 3
    add esi, 3
    sar eax, 2
    sar esi, 2
    imul eax, esi
    imul eax, edx
    shl eax, 4
    pop esi
    ret
FUN_1000ef40 ENDP
END