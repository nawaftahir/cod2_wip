.686
.MODEL FLAT, C
EXTRN sub_1002E8F2:PROC
EXTRN sub_1003A97A:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D1BD8:DWORD
EXTRN g_101D1BDC:DWORD
EXTRN g_1072DC10:DWORD
EXTRN g_1072DC14:DWORD
EXTRN g_1072DC18:DWORD
EXTRN g_1072DC1C:DWORD
EXTRN g_1073055C:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_100304d0 PROC
    push ecx
    mov ecx, dword ptr [g_101D1B9C]
    mov edx, dword ptr [ecx + 32]
    test edx, edx
    push ebx
    je L0
    mov edx, dword ptr [eax*4 + 0101CE740h]
    fld dword ptr [edx + 8]
    jmp L1
L0:
    fld dword ptr [g_1019BC84]
L1:
    mov eax, dword ptr [eax*4 + 0101CE6E8h]
    fld dword ptr [eax + 8]
    fld dword ptr [g_1019BC84]
    fld st(2)
    fucompp
    fnstsw ax
    test ah, 68
    mov eax, dword ptr [g_101D1BDC]
    jnp L2
    mov eax, dword ptr [g_101D1BD8]
L2:
    mov ecx, dword ptr [esp + 12]
    fxch st(1)
    push 03F800000h
    fstp dword ptr [g_1072DC10]
    push 03F800000h
    fstp dword ptr [g_1072DC1C]
    push 0
    fild dword ptr [g_10766720]
    push 0
    sub esp, 8
    or ebx, 0FFFFFFFFh
    fstp dword ptr [esp + 4]
    mov dword ptr [g_1072DC14], 0
    fild dword ptr [g_1076671C]
    mov dword ptr [g_1072DC18], 0
    mov dword ptr [g_1073055C], ecx
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002E8F2
    add esp, 32
    call sub_1003A97A
    pop ebx
    pop ecx
    ret
FUN_100304d0 ENDP
END
