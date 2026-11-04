.686
.MODEL FLAT, C
EXTRN sub_1002EAB3:PROC
EXTRN sub_100305DC:PROC
EXTRN sub_10030700:PROC
EXTRN sub_100307BA:PROC
EXTRN sub_10030BBB:PROC
EXTRN sub_10030BC2:PROC
EXTRN sub_10030BE9:PROC
EXTRN sub_1003EA87:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE6D0:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE71C:DWORD:DWORD
EXTRN EXTRN g_101CE7A4:DWORD:DWORD
EXTRN EXTRN g_101D4848:DWORD:DWORD
EXTRN EXTRN g_101D496D:DWORD:DWORD
EXTRN EXTRN g_10730558:DWORD:DWORD
.CODE
FUN_10030ab0 PROC
    cmp cmp dword ptr [g_10730558], 14
    jne L0
    mov mov eax, dword ptr [g_101D4848]
    call sub_1002EAB3
    mov mov dword ptr [g_10730558], 2
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
L0:
    je L1
    mov mov al, byte ptr [g_101D496D]
    test test al, al
    je L2
    mov mov ecx, dword ptr [g_101CE71C]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je L3
    mov mov edx, dword ptr [g_101CE6D0]
    mov mov al, byte ptr [edx + 8]
    test test al, al
    jne L4
    call sub_10030700
    xor xor eax, eax
    call sub_1003EA87
    call sub_100305DC
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    je sub_10030BC2
    mov mov ecx, dword ptr [g_101CE7A4]
    fld fld dword ptr [ecx + 8]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10030BBB
    fld fld dword ptr [esp + 4]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10030BE9
    fld fld dword ptr [ecx + 8]
    push push ecx
    fld fld st(0)
    fmulp fmulp st(1)
    fld fld dword ptr [esp + 8]
L3:
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fsqrt fsqrt
    fstp fstp dword ptr [esp]
    call sub_100307BA
    pop pop ecx
    ret ret
FUN_10030ab0 ENDP
END
