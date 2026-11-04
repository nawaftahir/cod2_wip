.686
.MODEL FLAT, C
EXTRN sub_1000EFDC:PROC
EXTRN sub_1000EFF8:PROC
EXTRN sub_1000F030:PROC
EXTRN sub_1000F038:PROC
.CODE
FUN_1000ef40 PROC
    cmp cmp ecx, 75
    push push esi
    mov mov esi, dword ptr [esp + 8]
    jg L0
    je L1
    add add ecx, -21
    cmp cmp ecx, 50
    ja L4
    movzx movzx ecx, byte ptr [ecx + 01000EFE8h]
    jmp jmp dword ptr [ecx*4 + 01000EFD8h]
    imul imul eax, esi
    imul imul eax, edx
    pop pop esi
    ret ret
    cmp cmp ecx, 031545844h
    jg sub_1000EFDC
    je L3
L0:
    cmp cmp ecx, 80
    je L2
    cmp cmp ecx, 114
    jne sub_1000EFF8
    imul imul eax, esi
    imul imul eax, edx
    shl shl eax, 2
    pop pop esi
    ret ret
    imul imul eax, esi
    imul imul eax, edx
    shl shl eax, 1
    pop pop esi
    ret ret
    add add eax, 3
    add add esi, 3
    sar sar eax, 2
    sar sar esi, 2
    imul imul eax, esi
    imul imul eax, edx
    shl shl eax, 3
    pop pop esi
    ret ret
    cmp cmp ecx, 033545844h
    je sub_1000F030
    cmp cmp ecx, 035545844h
    je sub_1000F038
    xor xor eax, eax
    pop pop esi
    ret ret
    add add eax, 3
    add add esi, 3
    sar sar eax, 2
L3:
    sar sar esi, 2
    imul imul eax, esi
    imul imul eax, edx
    shl shl eax, 4
    pop pop esi
    ret ret
FUN_1000ef40 ENDP
END
