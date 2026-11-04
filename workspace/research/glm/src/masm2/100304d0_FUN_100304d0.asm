.686
.MODEL FLAT, C
EXTRN sub_1002E8F2:PROC
EXTRN sub_1003A97A:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D1BD8:DWORD:DWORD
EXTRN EXTRN g_101D1BDC:DWORD:DWORD
EXTRN EXTRN g_1072DC10:DWORD:DWORD
EXTRN EXTRN g_1072DC14:DWORD:DWORD
EXTRN EXTRN g_1072DC18:DWORD:DWORD
EXTRN EXTRN g_1072DC1C:DWORD:DWORD
EXTRN EXTRN g_1073055C:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_100304d0 PROC
    push push ecx
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov edx, dword ptr [ecx + 32]
    test test edx, edx
    push push ebx
    je L0
    mov mov edx, dword ptr [eax*4 + 0101CE740h]
    fld fld dword ptr [edx + 8]
    jmp L1
    fld fld dword ptr [g_1019BC84]
    mov mov eax, dword ptr [eax*4 + 0101CE6E8h]
    fld fld dword ptr [eax + 8]
    fld fld dword ptr [g_1019BC84]
    fld fld st(2)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    mov mov eax, dword ptr [g_101D1BDC]
    jnp L2
    mov mov eax, dword ptr [g_101D1BD8]
    mov mov ecx, dword ptr [esp + 12]
    fxch fxch st(1)
    push push 03F800000h
    fstp fstp dword ptr [g_1072DC10]
    push push 03F800000h
    fstp fstp dword ptr [g_1072DC1C]
    push push 0
    fild fild dword ptr [g_10766720]
    push push 0
    sub sub esp, 8
    or or ebx, -1
    fstp fstp dword ptr [esp + 4]
    mov mov dword ptr [g_1072DC14], 0
    fild fild dword ptr [g_1076671C]
    mov mov dword ptr [g_1072DC18], 0
    mov mov dword ptr [g_1073055C], ecx
    fstp fstp dword ptr [esp]
    push push 0
    push push 0
    call sub_1002E8F2
    add add esp, 32
    call sub_1003A97A
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100304d0 ENDP
END
