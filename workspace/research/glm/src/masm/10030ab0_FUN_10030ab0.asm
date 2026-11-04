.686
.MODEL FLAT, C
EXTRN sub_1002EAB3:PROC
EXTRN sub_100305DC:PROC
EXTRN sub_10030700:PROC
EXTRN sub_100307BA:PROC
EXTRN sub_1003EA87:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE6D0:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE71C:DWORD
EXTRN g_101CE7A4:DWORD
EXTRN g_101D4848:DWORD
EXTRN g_101D496D:DWORD
EXTRN g_10730558:DWORD
.CODE
FUN_10030ab0 PROC
    cmp dword ptr [g_10730558], 14
    jne L0
    mov eax, dword ptr [g_101D4848]
    call sub_1002EAB3
    mov dword ptr [g_10730558], 2
L0:
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    je L1
    mov al, byte ptr [g_101D496D]
    test al, al
    je L1
    mov ecx, dword ptr [g_101CE71C]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L1
    mov edx, dword ptr [g_101CE6D0]
    mov al, byte ptr [edx + 8]
    test al, al
    jne L1
    call sub_10030700
    xor eax, eax
    call sub_1003EA87
    call sub_100305DC
L1:
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    je L3
    mov ecx, dword ptr [g_101CE7A4]
    fld dword ptr [ecx + 8]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L2
    fld dword ptr [esp + 4]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L3
L2:
    fld dword ptr [ecx + 8]
    push ecx
    fld st(0)
    fmulp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fsqrt
    fstp dword ptr [esp]
    call sub_100307BA
    pop ecx
L3:
    ret
FUN_10030ab0 ENDP
END
