; FUN_1005a000 @ 0x1005a000 — auto-synthesized
    sub_100590de PROTO C
    sub_10059106 PROTO C
    sub_1005914d PROTO C
.CODE
FUN_1005a000 PROC
    sub esp, 0x18
    fld dword ptr [edi]
    push ebp
    fsub dword ptr [eax]
    mov ebp, dword ptr [esp + 0x20]
    push esi
    lea esi, [esp + 0x14]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [edi + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [edi + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 0x1c]
    call sub_100590de
    fstp st(0)
    lea esi, [esp + 8]
    fld dword ptr [edi]
    fsub dword ptr [ebp]
    fstp dword ptr [esp + 8]
    fld dword ptr [edi + 4]
    fsub dword ptr [ebp + 4]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [edi + 8]
    fsub dword ptr [ebp + 8]
    fstp dword ptr [esp + 0x10]
    call sub_10059106
    fstp st(0)
    mov esi, ebx
    fld dword ptr [esp + 0x10]
    fmul dword ptr [esp + 0x18]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0x1c]
    fsubp st(1)
    fstp dword ptr [ebx]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 0x10]
    fmul dword ptr [esp + 0x14]
    fsubp st(1)
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0x14]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 0x18]
    fsubp st(1)
    fstp dword ptr [ebx + 8]
    call sub_1005914d
    pop esi
    fstp st(0)
    pop ebp
    add esp, 0x18
    ret
FUN_1005a000 ENDP
END