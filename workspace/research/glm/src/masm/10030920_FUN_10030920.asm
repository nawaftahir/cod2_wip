.686
.MODEL FLAT, C
EXTRN sub_1002E8BD:PROC
EXTRN sub_1002EAC6:PROC
EXTRN sub_1003A94A:PROC
EXTRN g_1019BCB4:DWORD
EXTRN g_101D1B54:DWORD
EXTRN g_101D4884:DWORD
EXTRN g_1073055C:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_10030920 PROC
    sub esp, 12
    fild dword ptr [g_1076671C]
    push ebx
    push esi
    mov esi, dword ptr [g_101D4884]
    fstp dword ptr [esp + 16]
    mov eax, esi
    fild dword ptr [g_10766720]
    fstp dword ptr [esp + 12]
    call sub_1002EAC6
    mov eax, dword ptr [esp + 28]
    fld dword ptr [esp + 12]
    fsub dword ptr [g_1019BCB4]
    push eax
    push eax
    mov eax, dword ptr [esp + 32]
    push eax
    push eax
    mov eax, dword ptr [g_101D1B54]
    sub esp, 8
    fstp dword ptr [esp + 4]
    or ebx, 0FFFFFFFFh
    fld dword ptr [esp + 40]
    mov dword ptr [g_1073055C], esi
    fsub dword ptr [g_1019BCB4]
    fstp dword ptr [esp]
    push 03F800000h
    push 03F800000h
    call sub_1002E8BD
    add esp, 32
    pop esi
    pop ebx
    add esp, 12
    jmp sub_1003A94A
FUN_10030920 ENDP
END
