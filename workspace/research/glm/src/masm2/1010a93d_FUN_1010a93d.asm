.686
.MODEL FLAT, C
EXTRN sub_10102F5D:PROC
EXTRN sub_10102F82:PROC
EXTRN sub_10102FB6:PROC
EXTRN sub_10102FFC:PROC
EXTRN sub_10103019:PROC
EXTRN sub_10103059:PROC
EXTRN sub_1010A9F3:PROC
EXTRN sub_1010A9F5:PROC
EXTRN sub_1010A9FA:PROC
EXTRN sub_1010A9FC:PROC
EXTRN sub_1010AA01:PROC
EXTRN sub_1010AA17:PROC
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101AB080:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_1010a93d PROC
    push push edx
    wait wait
    fnstcw fnstcw word ptr [esp]
    mov mov eax, dword ptr [esp + 12]
    je L2
    cmp cmp word ptr [esp], 027Fh
    je L0
    call sub_10102F5D
    test test eax, 080000000h
    jne L1
    fsqrt fsqrt
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10102FFC
    mov mov edx, 5
    lea lea ecx, [g_101AB080]
    jmp sub_10103019
    test test eax, 07FF00000h
    jne sub_1010A9F3
    test test eax, 0FFFFFh
    jne sub_1010A9FA
    cmp cmp dword ptr [esp + 8], 0
    jne sub_1010AA01
    jmp L3
    call sub_10102FB6
    jmp sub_1010AA17
    test test eax, 0FFFFFh
    jne sub_1010A9F5
    cmp cmp dword ptr [esp + 8], 0
    jne sub_1010A9FC
    and and eax, 080000000h
    je L4
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
    mov mov eax, 1
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103059
    mov mov edx, 5
    lea lea ecx, [g_101AB080]
    call sub_10102F82
    pop pop edx
    ret ret
FUN_1010a93d ENDP
END
