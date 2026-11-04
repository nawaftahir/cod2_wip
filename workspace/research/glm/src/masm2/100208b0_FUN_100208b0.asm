.686
.MODEL FLAT, C
EXTRN sub_10020930:PROC
EXTRN sub_10020940:PROC
EXTRN EXTRN g_1019BD68:DWORD:DWORD
.CODE
FUN_100208b0 PROC
    sub sub esp, 12
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax*4 + 0101DA998h]
    fadd fadd dword ptr [eax*4 + 0101DA9B0h]
    fstp fstp dword ptr [esp + 16]
    fld fld qword ptr [g_1019BD68]
    fstp fstp qword ptr [esp + 4]
    fld fld dword ptr [esp + 16]
    fsub fsub qword ptr [esp + 4]
    fistp fistp dword ptr [esp]
    mov mov eax, dword ptr [eax*4 + 010190398h]
    mov mov ecx, dword ptr [esp]
    dec dec eax
    test test ecx, ecx
    jge sub_10020930
    xor xor eax, eax
    add add esp, 12
    ret ret
    cmp cmp ecx, eax
    jg sub_10020940
    mov mov eax, ecx
    add add esp, 12
    ret ret
FUN_100208b0 ENDP
END
