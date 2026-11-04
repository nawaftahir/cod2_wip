.686
.MODEL FLAT, C
EXTRN sub_1000E8D1:PROC
EXTRN sub_1000E8F2:PROC
EXTRN sub_1000E91D:PROC
EXTRN sub_1000E925:PROC
.CODE
FUN_1000e840 PROC
    cmp cmp ecx, 71
    jg L0
    je L1
    add add ecx, -21
    cmp cmp ecx, 30
    ja L3
    movzx movzx ecx, byte ptr [ecx + 01000E8DCh]
    jmp jmp dword ptr [ecx*4 + 01000E8C8h]
    imul imul eax, edx
    lea lea eax, [eax + eax*2]
    ret ret
    imul imul eax, edx
    ret ret
    cmp cmp ecx, 031545844h
    jg sub_1000E8D1
    je L3
    cmp cmp ecx, 75
    je L2
    cmp cmp ecx, 80
    je L4
    cmp cmp ecx, 114
    jne sub_1000E8F2
    imul imul eax, edx
    shl shl eax, 2
    ret ret
L1:
    imul imul eax, edx
    shl shl eax, 1
    ret ret
    add add eax, 3
    add add edx, 3
    sar sar eax, 2
    sar sar edx, 2
    imul imul eax, edx
    shl shl eax, 3
    ret ret
    cmp cmp ecx, 033545844h
    je sub_1000E91D
    cmp cmp ecx, 035545844h
    je sub_1000E925
    xor xor eax, eax
    ret ret
    add add eax, 3
    add add edx, 3
    sar sar eax, 2
    sar sar edx, 2
L3:
    imul imul eax, edx
    shl shl eax, 4
    ret ret
FUN_1000e840 ENDP
END
