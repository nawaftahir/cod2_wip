; FUN_1002f2a0 @ 0x1002f2a0 — auto-synthesized
    EXTRN g_1019bda8:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_1072da20:DWORD
    EXTRN g_1072da24:DWORD
    EXTRN g_1072da28:DWORD
    EXTRN g_1072da2c:DWORD
    EXTRN g_1072dedc:DWORD
    sub_100f6682 PROTO C
.CODE
FUN_1002f2a0 PROC
    sub esp, 0x18
    fld dword ptr [esp + 0x1c]
    sub esp, 8
    fstp qword ptr [esp]
    call sub_100f6682
    mov eax, dword ptr [g_101ce708]
    mov ecx, dword ptr [eax + 8]
    fsubr dword ptr [esp + 0x24]
    add esp, 8
    cmp ecx, 2
    fst dword ptr [esp + 0x14]
    jne L0
    fstp dword ptr [g_1072dedc]
    add esp, 0x18
    ret
    fmul dword ptr [g_1019bda8]
    lea ecx, [esp + 4]
    lea edx, [esp]
    mov dword ptr [esp + 0xc], ecx
    fstp dword ptr [esp + 0x10]
    mov dword ptr [esp + 8], edx
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
    mov eax, dword ptr [esp]
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [esp + 0x14]
    mov dword ptr [g_1072da20], eax
    mov eax, dword ptr [esp + 0x1c]
    mov dword ptr [g_1072da24], ecx
    mov dword ptr [g_1072da28], edx
    mov dword ptr [g_1072da2c], eax
    add esp, 0x18
    ret
FUN_1002f2a0 ENDP
END