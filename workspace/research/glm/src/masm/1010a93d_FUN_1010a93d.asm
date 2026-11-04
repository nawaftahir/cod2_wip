.686
.MODEL FLAT, C
EXTRN sub_10102F5D:PROC
EXTRN sub_10102F82:PROC
EXTRN sub_10102FB6:PROC
EXTRN sub_10102FFC:PROC
EXTRN sub_10103019:PROC
EXTRN sub_10103059:PROC
EXTRN g_101A5230:DWORD
EXTRN g_101AB080:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_1010a93d PROC
    push edx
    wait
    fnstcw word ptr [esp]
    mov eax, dword ptr [esp + 12]
    je L4
    cmp word ptr [esp], 00000027Fh
    je L0
    call sub_10102F5D
L0:
    test eax, 080000000h
    jne L2
    fsqrt
L1:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10102FFC
    mov edx, 5
    lea ecx, [g_101AB080]
    jmp sub_10103019
L2:
    test eax, 07FF00000h
    jne L5
    test eax, 0000FFFFFh
    jne L5
    cmp dword ptr [esp + 8], 0
    jne L5
    jmp L1
L3:
    call sub_10102FB6
    jmp L6
L4:
    test eax, 0000FFFFFh
    jne L3
    cmp dword ptr [esp + 8], 0
    jne L3
    and eax, 080000000h
    je L1
L5:
    fstp st(0)
    fld xword ptr [g_101A5230]
    mov eax, 1
L6:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103059
    mov edx, 5
    lea ecx, [g_101AB080]
    call sub_10102F82
    pop edx
    ret
FUN_1010a93d ENDP
END
