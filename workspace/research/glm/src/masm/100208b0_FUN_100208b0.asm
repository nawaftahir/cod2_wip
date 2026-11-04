.686
.MODEL FLAT, C
EXTRN g_1019BD68:DWORD
.CODE
FUN_100208b0 PROC
    sub esp, 12
    fld dword ptr [esp + 16]
    fmul dword ptr [eax*4 + 0101DA998h]
    fadd dword ptr [eax*4 + 0101DA9B0h]
    fstp dword ptr [esp + 16]
    fld qword ptr [g_1019BD68]
    fstp qword ptr [esp + 4]
    fld dword ptr [esp + 16]
    fsub qword ptr [esp + 4]
    fistp dword ptr [esp]
    mov eax, dword ptr [eax*4 + 010190398h]
    mov ecx, dword ptr [esp]
    dec eax
    test ecx, ecx
    jge L0
    xor eax, eax
    add esp, 12
    ret
L0:
    cmp ecx, eax
    jg L1
    mov eax, ecx
L1:
    add esp, 12
    ret
FUN_100208b0 ENDP
END
