; FUN_10058310 @ 0x10058310 — auto-synthesized
    sub_1001d66d PROTO C
.CODE
FUN_10058310 PROC
    sub esp, 0x24
    lea ecx, [esp]
    mov eax, edi
    call sub_1001d66d
    fld dword ptr [esp]
    fmul dword ptr [esi]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fadd dword ptr [edi + 0x10]
    fstp dword ptr [ebx]
    fld dword ptr [esp + 4]
    fmul dword ptr [esi]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esp + 0x10]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fadd dword ptr [edi + 0x14]
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 8]
    fmul dword ptr [esi]
    fld dword ptr [esp + 0x20]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esp + 0x14]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fadd dword ptr [edi + 0x18]
    fstp dword ptr [ebx + 8]
    add esp, 0x24
    ret
FUN_10058310 ENDP
END