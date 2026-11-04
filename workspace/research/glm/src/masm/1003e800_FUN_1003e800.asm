.686
.MODEL FLAT, C
EXTRN sub_100F6CB3:PROC
EXTRN sub_100F6D70:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766740:DWORD
EXTRN g_10766744:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003e800 PROC
    fld dword ptr [esp + 4]
    fld dword ptr [g_10766740]
    fucompp
    fnstsw ax
    test ah, 68
    jp L0
    fld dword ptr [esp + 8]
    fld dword ptr [g_10766744]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L3
L0:
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [g_10766740], eax
    mov dword ptr [g_10766744], ecx
    lea esp, [esp]
L1:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 010199178h
    push 010193358h
    push eax
    call sub_100F6D70
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CB3
    add esp, 16
L2:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 010766730h
    push eax
    call dword ptr [ecx + 0xbc]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L1
L3:
    ret
FUN_1003e800 ENDP
END
