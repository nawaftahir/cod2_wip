; FUN_10030920 @ 0x10030920 — auto-synthesized
    EXTRN g_1019bcb4:DWORD
    EXTRN g_101d1b54:DWORD
    EXTRN g_101d4884:DWORD
    EXTRN g_1073055c:DWORD
    EXTRN g_1076671c:DWORD
    EXTRN g_10766720:DWORD
    sub_1002e8bd PROTO C
    sub_1002eac6 PROTO C
    sub_1003a94a PROTO C
.CODE
FUN_10030920 PROC
    sub esp, 0xc
    fild dword ptr [g_1076671c]
    push ebx
    push esi
    mov esi, dword ptr [g_101d4884]
    fstp dword ptr [esp + 0x10]
    mov eax, esi
    fild dword ptr [g_10766720]
    fstp dword ptr [esp + 0xc]
    call sub_1002eac6
    mov eax, dword ptr [esp + 0x1c]
    fld dword ptr [esp + 0xc]
    fsub dword ptr [g_1019bcb4]
    push eax
    push eax
    mov eax, dword ptr [esp + 0x20]
    push eax
    push eax
    mov eax, dword ptr [g_101d1b54]
    sub esp, 8
    fstp dword ptr [esp + 4]
    or ebx, 0xffffffff
    fld dword ptr [esp + 0x28]
    mov dword ptr [g_1073055c], esi
    fsub dword ptr [g_1019bcb4]
    fstp dword ptr [esp]
    push 0x3f800000
    push 0x3f800000
    call sub_1002e8bd
    add esp, 0x20
    pop esi
    pop ebx
    add esp, 0xc
    jmp sub_1003a94a
FUN_10030920 ENDP
END