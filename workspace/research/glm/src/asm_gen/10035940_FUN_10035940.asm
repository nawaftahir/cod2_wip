; FUN_10035940 @ 0x10035940 — auto-synthesized
    EXTRN g_1019bcb0:DWORD
    EXTRN g_106d3194:DWORD
    sub_100055fe PROTO C
.CODE
FUN_10035940 PROC
    sub esp, 0x18
    fld dword ptr [eax]
    push esi
    fsub dword ptr [g_1019bcb0]
    mov esi, dword ptr [g_106d3194]
    push 0x101913e8
    add esi, 0x249d18
    fstp dword ptr [esp + 0x14]
    lea edx, [esp + 8]
    fld dword ptr [eax + 4]
    fsub dword ptr [g_1019bcb0]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [eax + 8]
    fsub dword ptr [g_1019bcb0]
    fstp dword ptr [esp + 0x1c]
    fld dword ptr [eax]
    fadd dword ptr [g_1019bcb0]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 4]
    fadd dword ptr [g_1019bcb0]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [eax + 8]
    lea eax, [esp + 0x14]
    fadd dword ptr [g_1019bcb0]
    fstp dword ptr [esp + 0x10]
    call sub_100055fe
    add esp, 4
    pop esi
    add esp, 0x18
    ret
FUN_10035940 ENDP
END