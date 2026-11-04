.686
.MODEL FLAT, C
EXTRN sub_1003E14C:PROC
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003e250 PROC
    mov mov eax, dword ptr [g_10730550]
    fld fld dword ptr [esp + 4]
    imul imul eax, eax, 0CD0h
    fchs fchs
    fstp fstp dword ptr [eax + 01072E258h]
    jmp sub_1003E14C
FUN_1003e250 ENDP
END
