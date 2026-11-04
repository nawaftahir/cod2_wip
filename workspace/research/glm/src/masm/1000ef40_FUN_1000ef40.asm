.686
.MODEL FLAT, C
.CODE
FUN_1000ef40 PROC
    cmp ecx, 75
    push esi
    mov esi, dword ptr [esp + 8]
    jg L0
    je L1
    add ecx, -21
    cmp ecx, 50
    ja L5
    movzx ecx, byte ptr [ecx + 01000EFE8h]
    jmp dword ptr [ecx*4 + 0x1000efd8]
    imul eax, esi
    imul eax, edx
    pop esi
    ret
L0:
    cmp ecx, 031545844h
    jg L4
    je L3
    cmp ecx, 80
    je L2
    cmp ecx, 114
    jne L5
L1:
    imul eax, esi
    imul eax, edx
    shl eax, 2
    pop esi
    ret
L2:
    imul eax, esi
    imul eax, edx
    shl eax, 1
    pop esi
    ret
L3:
    add eax, 3
    add esi, 3
    sar eax, 2
    sar esi, 2
    imul eax, esi
    imul eax, edx
    shl eax, 3
    pop esi
    ret
L4:
    cmp ecx, 033545844h
    je L6
    cmp ecx, 035545844h
    je L6
L5:
    xor eax, eax
    pop esi
    ret
L6:
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
