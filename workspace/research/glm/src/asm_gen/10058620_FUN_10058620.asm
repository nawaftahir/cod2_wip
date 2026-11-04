; FUN_10058620 @ 0x10058620 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bcb0:DWORD
    EXTRN g_1019be5c:DWORD
    EXTRN g_1019be60:DWORD
    EXTRN g_1019be64:DWORD
    sub_1010a96c PROTO C
.CODE
FUN_10058620 PROC
    sub esp, 0x14
    fild dword ptr [esp + 0x18]
    push esi
    push edi
    mov edi, dword ptr [esp + 0x20]
    test edi, edi
    fstp dword ptr [esp + 0x20]
    fld dword ptr [g_1019bc78]
    mov esi, eax
    fdiv dword ptr [esp + 0x20]
    mov dword ptr [esp + 0x20], 0
    mov dword ptr [esp + 8], 0x3f800000
    fstp dword ptr [esp + 0x14]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [g_1019bcb0]
    fstp dword ptr [esp + 0xc]
    jle L0
    fld dword ptr [esp + 0xc]
    call sub_1010a96c
    fstp dword ptr [esp + 0x10]
    fld dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x20]
    fstp dword ptr [esp + 0x10]
    fld dword ptr [esp + 0x10]
    mov dword ptr [esp + 0x18], eax
    fmul dword ptr [esp + 8]
    fstp dword ptr [esi]
    fld dword ptr [esp + 0x10]
    fmul dword ptr [esp + 0x20]
    fstp dword ptr [esi + 4]
    add esi, ebx
    dec edi
    fld dword ptr [esp + 0xc]
    fadd dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0x20]
    fmul dword ptr [g_1019be64]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019be60]
    fsubp st(1)
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019be64]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [g_1019be5c]
    fsubp st(1)
    fstp dword ptr [esp + 8]
    jne L1
    pop edi
    pop esi
    add esp, 0x14
    ret
FUN_10058620 ENDP
END