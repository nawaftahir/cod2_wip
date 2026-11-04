.686
.MODEL FLAT, C
.CODE
FUN_1000e840 PROC
    cmp ecx, 71
    jg L0
    je L1
    add ecx, -21
    cmp ecx, 30
    ja L5
    movzx ecx, byte ptr [ecx + 01000E8DCh]
    jmp dword ptr [ecx*4 + 0x1000e8c8]
    imul eax, edx
    lea eax, [eax + eax*2]
    ret
    imul eax, edx
    ret
L0:
    cmp ecx, 031545844h
    jg L4
    je L3
    cmp ecx, 75
    je L1
    cmp ecx, 80
    je L2
    cmp ecx, 114
    jne L5
L1:
    imul eax, edx
    shl eax, 2
    ret
L2:
    imul eax, edx
    shl eax, 1
    ret
L3:
    add eax, 3
    add edx, 3
    sar eax, 2
    sar edx, 2
    imul eax, edx
    shl eax, 3
    ret
L4:
    cmp ecx, 033545844h
    je L6
    cmp ecx, 035545844h
    je L6
L5:
    xor eax, eax
    ret
L6:
    add eax, 3
    add edx, 3
    sar eax, 2
    sar edx, 2
    imul eax, edx
    shl eax, 4
    ret
FUN_1000e840 ENDP
END
