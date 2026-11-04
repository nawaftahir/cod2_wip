.686
.MODEL FLAT, C
EXTRN sub_10102F9D:PROC
EXTRN sub_10102FD8:PROC
EXTRN sub_10103008:PROC
EXTRN sub_10103025:PROC
EXTRN sub_10103074:PROC
EXTRN g_1017E308:DWORD
EXTRN g_101A5230:DWORD
EXTRN g_101A526A:DWORD
EXTRN g_101AB0B0:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_1010ac08 PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L4
    mov eax, dword ptr [esp + 12]
    cmp word ptr [esp], 00000027Fh
    je L0
    fldcw word ptr [g_1017E308]
L0:
    test eax, 07FF00000h
    je L7
    test eax, 080000000h
    jne L5
L1:
    fldln2
    fxch st(1)
    fyl2x
L2:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103008
    lea ecx, [g_101AB0B0]
    mov edx, 26
    jmp sub_10103025
L3:
    test eax, 080000000h
    jne L5
    jmp L1
L4:
    test eax, 0000FFFFFh
    jne L6
    cmp dword ptr [esp + 8], 0
    jne L6
    and eax, 080000000h
    je L2
L5:
    fstp st(0)
    fld xword ptr [g_101A5230]
    mov eax, 1
    jmp L8
L6:
    call sub_10102FD8
    jmp L8
L7:
    test eax, 0000FFFFFh
    jne L3
    cmp dword ptr [esp + 8], 0
    jne L3
    fstp st(0)
    fld xword ptr [g_101A526A]
    mov eax, 2
L8:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103074
    lea ecx, [g_101AB0B0]
    mov edx, 26
    call sub_10102F9D
    pop edx
    ret
FUN_1010ac08 ENDP
END
