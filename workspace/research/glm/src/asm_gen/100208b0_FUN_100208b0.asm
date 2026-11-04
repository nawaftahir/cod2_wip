; FUN_100208b0 @ 0x100208b0 — auto-synthesized
    EXTRN g_1019bd68:DWORD
.CODE
FUN_100208b0 PROC
    sub esp, 0xc
    fld dword ptr [esp + 0x10]
    fmul dword ptr [eax*4 + 0x101da998]
    fadd dword ptr [eax*4 + 0x101da9b0]
    fstp dword ptr [esp + 0x10]
    fld qword ptr [g_1019bd68]
    fstp qword ptr [esp + 4]
    fld dword ptr [esp + 0x10]
    fsub qword ptr [esp + 4]
    fistp dword ptr [esp]
    mov eax, dword ptr [eax*4 + 0x10190398]
    mov ecx, dword ptr [esp]
    dec eax
    test ecx, ecx
    jge L0
    xor eax, eax
    add esp, 0xc
    ret
    cmp ecx, eax
    jg L1
    mov eax, ecx
    add esp, 0xc
    ret
FUN_100208b0 ENDP
END