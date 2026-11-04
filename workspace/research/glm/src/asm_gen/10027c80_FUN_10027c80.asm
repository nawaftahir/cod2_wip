; FUN_10027c80 @ 0x10027c80 — auto-synthesized
    EXTRN g_1019bdc8:DWORD
    EXTRN g_101d1b50:DWORD
    EXTRN g_101d4c6c:DWORD
    sub_1002116b PROTO C
    sub_10021b1c PROTO C
.CODE
FUN_10027c80 PROC
    sub esp, 0x44
    fild dword ptr [g_101d4c6c]
    push esi
    push edi
    lea eax, [esp + 0xc]
    fstp dword ptr [esp + 8]
    push 0x3f800000
    fld dword ptr [esp + 0xc]
    mov ecx, 0x10
    fmul dword ptr [g_1019bdc8]
    mov esi, 0x10191368
    lea edi, [esp + 0x10]
    push eax
    fstp dword ptr [esp + 0x10]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10021b1c
    mov ecx, dword ptr [g_101d1b50]
    mov eax, dword ptr [esp + 0x10]
    push ecx
    push 0x10191488
    push 0x3f800000
    push 0x3f800000
    push 0
    push 0
    push eax
    push eax
    push 0x40800000
    push 0x40800000
    call sub_1002116b
    add esp, 0x30
    pop edi
    pop esi
    add esp, 0x44
    ret
FUN_10027c80 ENDP
END