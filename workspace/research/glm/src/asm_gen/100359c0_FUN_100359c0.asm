; FUN_100359c0 @ 0x100359c0 — auto-synthesized
    EXTRN g_1019be98:DWORD
    EXTRN g_1019be9c:DWORD
    EXTRN g_106d3194:DWORD
    sub_10005616 PROTO C
.CODE
FUN_100359c0 PROC
    sub esp, 0x28
    add eax, 0xfffff000
    shl eax, 5
    mov dword ptr [esp], eax
    fild dword ptr [esp]
    add ecx, 0xfffff000
    shl ecx, 5
    add edx, 0xfffff800
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    shl edx, 6
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    push esi
    mov esi, dword ptr [g_106d3194]
    push 0x10191488
    fst dword ptr [esp + 0x2c]
    add esi, 0x249d18
    fld st(2)
    lea edx, [esp + 0xc]
    fstp dword ptr [esp + 0x18]
    lea eax, [esp + 0x18]
    fld st(1)
    fstp dword ptr [esp + 0x1c]
    fstp dword ptr [esp + 0x20]
    fxch st(1)
    fadd dword ptr [g_1019be9c]
    fstp dword ptr [esp + 0xc]
    fadd dword ptr [g_1019be9c]
    fstp dword ptr [esp + 0x10]
    fld dword ptr [esp + 0x2c]
    fadd dword ptr [g_1019be98]
    fstp dword ptr [esp + 0x14]
    call sub_10005616
    add esp, 4
    pop esi
    add esp, 0x28
    ret
FUN_100359c0 ENDP
END