.686
.MODEL FLAT, C
EXTRN sub_10102F9D:PROC
EXTRN sub_10102FD8:PROC
EXTRN sub_10103008:PROC
EXTRN sub_10103025:PROC
EXTRN sub_10103074:PROC
EXTRN sub_1010ACC1:PROC
EXTRN sub_1010ACD7:PROC
EXTRN sub_1010ACD9:PROC
EXTRN sub_1010ACDE:PROC
EXTRN sub_1010ACE0:PROC
EXTRN sub_1010AD18:PROC
EXTRN sub_1010AD1F:PROC
EXTRN EXTRN g_1017E308:DWORD:DWORD
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101A526A:DWORD:DWORD
EXTRN EXTRN g_101AB0B0:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_1010ac08 PROC
    push push edx
    wait wait
    fnstcw fnstcw word ptr [esp]
    je L1
    mov mov eax, dword ptr [esp + 12]
    cmp cmp word ptr [esp], 027Fh
    je L0
    fldcw fldcw word ptr [g_1017E308]
    test test eax, 07FF00000h
    je L5
    test test eax, 080000000h
    jne L3
    fldln2 fldln2
    fxch fxch st(1)
    fyl2x fyl2x
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103008
    lea lea ecx, [g_101AB0B0]
    mov mov edx, 26
    jmp sub_10103025
    test test eax, 080000000h
    jne sub_1010ACC1
    jmp L2
    test test eax, 0FFFFFh
    jne sub_1010ACD9
L1:
    cmp cmp dword ptr [esp + 8], 0
    jne sub_1010ACE0
    and and eax, 080000000h
    je L4
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
    mov mov eax, 1
    jmp sub_1010AD18
    call sub_10102FD8
    jmp sub_1010AD1F
    test test eax, 0FFFFFh
    jne sub_1010ACD7
    cmp cmp dword ptr [esp + 8], 0
    jne sub_1010ACDE
    fstp fstp st(0)
    fld fld xword ptr [g_101A526A]
    mov mov eax, 2
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103074
    lea lea ecx, [g_101AB0B0]
    mov mov edx, 26
    call sub_10102F9D
    pop pop edx
    ret ret
FUN_1010ac08 ENDP
END
