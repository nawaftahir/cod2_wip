; FUN_1005e5e0 @ 0x1005e5e0 — auto-synthesized
    EXTRN g_1019bd80:DWORD
.CODE
FUN_1005e5e0 PROC
    sub esp, 0x10
    mov ecx, dword ptr [esp + 0x14]
    mov eax, ecx
    and eax, 0xfff
    cmp eax, 4
    mov dword ptr [esp + 0x14], ecx
    jg L0
    sub ecx, eax
    jmp L1
    mov edx, 0x1000
    sub edx, eax
    cmp edx, 4
    jg L2
    mov edx, 0x1000
    sub edx, eax
    add ecx, edx
    mov dword ptr [esp + 0x14], ecx
    fld dword ptr [esp + 0x14]
    fmul dword ptr [esp + 0x18]
    fstp dword ptr [esp]
    fld qword ptr [g_1019bd80]
    fstp qword ptr [esp + 8]
    fld dword ptr [esp]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp + 4]
    fild dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fdiv dword ptr [esp + 0x18]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x18]
    fsub dword ptr [esp + 0x14]
    fabs
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fcomp dword ptr [esp + 0x1c]
    fnstsw ax
    test ah, 0x41
    jp L3
    fld dword ptr [esp + 0x18]
    add esp, 0x10
    ret
    fld dword ptr [esp + 0x14]
    add esp, 0x10
    ret
FUN_1005e5e0 ENDP
END