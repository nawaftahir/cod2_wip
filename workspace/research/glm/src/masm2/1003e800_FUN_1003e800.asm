.686
.MODEL FLAT, C
EXTRN sub_1003E8BB:PROC
EXTRN sub_1003E8C6:PROC
EXTRN sub_1003E8D4:PROC
EXTRN sub_1003E8D5:PROC
EXTRN sub_100F6CB3:PROC
EXTRN sub_100F6D70:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766740:DWORD:DWORD
EXTRN EXTRN g_10766744:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003e800 PROC
    fld fld dword ptr [esp + 4]
    fld fld dword ptr [g_10766740]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L0
    fld fld dword ptr [esp + 8]
    fld fld dword ptr [g_10766744]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1003E8BB
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [g_10766740], eax
    mov mov dword ptr [g_10766744], ecx
L0:
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003E8C6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003E8D4
    push push 010199178h
    push push 010193358h
    push push eax
    call sub_100F6D70
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CB3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 010766730h
    push push eax
    call call dword ptr [ecx + 0BCh]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003E8D5
    ret ret
FUN_1003e800 ENDP
END
