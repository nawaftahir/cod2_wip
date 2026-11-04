; FUN_1005e180 @ 0x1005e180 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_1019bd8c:DWORD
    sub_100599fc PROTO C
.CODE
FUN_1005e180 PROC
    sub esp, 0x1c
    fld dword ptr [esp + 0x20]
    lea eax, [esp + 0x20]
    fmul dword ptr [g_1019bd8c]
    lea ecx, [esp]
    push esi
    mov dword ptr [esp + 0xc], eax
    fstp dword ptr [esp + 0x10]
    mov dword ptr [esp + 8], ecx
    push eax
    push ecx
    fld dword ptr [esp + 0x18]
    fsincos
    mov ecx, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x10]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019bc84]
    lea esi, [esp + 0x14]
    fld dword ptr [esp + 0x24]
    fmul dword ptr [edx]
    fsubp st(1)
    fld dword ptr [esp + 4]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [edx]
    fadd dword ptr [esp + 0x24]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [esp + 8]
    fmul dword ptr [edx + 4]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 8]
    fmul dword ptr [edx + 8]
    fadd dword ptr [g_1019bc84]
    fstp dword ptr [esp + 0x1c]
    call sub_100599fc
    pop esi
    add esp, 0x1c
    ret
FUN_1005e180 ENDP
END