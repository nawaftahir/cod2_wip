.686
.MODEL FLAT, C
EXTRN sub_1003E14C:PROC
EXTRN g_10730550:DWORD
.CODE
FUN_1003e250 PROC
    mov eax, dword ptr [g_10730550]
    fld dword ptr [esp + 4]
    imul eax, eax, 000000CD0h
    fchs
    fstp dword ptr [eax + 01072E258h]
    jmp sub_1003E14C
FUN_1003e250 ENDP
END
