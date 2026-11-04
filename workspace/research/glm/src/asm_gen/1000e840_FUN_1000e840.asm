; FUN_1000e840 @ 0x1000e840 — auto-synthesized
.CODE
FUN_1000e840 PROC
    cmp ecx, 0x47
    jg L0
    je L1
    add ecx, -0x15
    cmp ecx, 0x1e
    ja L2
    movzx ecx, byte ptr [ecx + 0x1000e8dc]
    jmp dword ptr [ecx*4 + 0x1000e8c8]
    imul eax, edx
    lea eax, [eax + eax*2]
    ret
    imul eax, edx
    ret
    cmp ecx, 0x31545844
    jg L3
    je L4
    cmp ecx, 0x4b
    je L1
    cmp ecx, 0x50
    je L5
    cmp ecx, 0x72
    jne L2
    imul eax, edx
    shl eax, 2
    ret
    imul eax, edx
    shl eax, 1
    ret
    add eax, 3
    add edx, 3
    sar eax, 2
    sar edx, 2
    imul eax, edx
    shl eax, 3
    ret
    cmp ecx, 0x33545844
    je L6
    cmp ecx, 0x35545844
    je L6
    xor eax, eax
    ret
    add eax, 3
    add edx, 3
    sar eax, 2
    sar edx, 2
    imul eax, edx
    shl eax, 4
    ret
FUN_1000e840 ENDP
END