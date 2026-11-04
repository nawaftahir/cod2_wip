; FUN_10020900 @ 0x10020900 — auto-synthesized
    EXTRN g_1019bd68:DWORD
    EXTRN g_101da9a0:DWORD
    EXTRN g_101da9b8:DWORD
.CODE
FUN_10020900 PROC
    sub esp, 0xc
    fld dword ptr [g_101da9a0]
    fmul dword ptr [esp + 0x10]
    fadd dword ptr [g_101da9b8]
    fstp dword ptr [esp + 0x10]
    fld qword ptr [g_1019bd68]
    fstp qword ptr [esp + 4]
    fld dword ptr [esp + 0x10]
    fsub qword ptr [esp + 4]
    fistp dword ptr [esp]
    mov ecx, dword ptr [esp]
    test ecx, ecx
    jge L0
    xor ecx, ecx
    mov byte ptr [eax], cl
    add esp, 0xc
    ret
    cmp ecx, 0xff
    jle L1
    mov ecx, 0xff
    mov byte ptr [eax], cl
    add esp, 0xc
    ret
FUN_10020900 ENDP
END