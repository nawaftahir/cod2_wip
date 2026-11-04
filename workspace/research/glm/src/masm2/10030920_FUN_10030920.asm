.686
.MODEL FLAT, C
EXTRN sub_1002E8BD:PROC
EXTRN sub_1002EAC6:PROC
EXTRN sub_1003A94A:PROC
EXTRN EXTRN g_1019BCB4:DWORD:DWORD
EXTRN EXTRN g_101D1B54:DWORD:DWORD
EXTRN EXTRN g_101D4884:DWORD:DWORD
EXTRN EXTRN g_1073055C:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_10030920 PROC
    sub sub esp, 12
    fild fild dword ptr [g_1076671C]
    push push ebx
    push push esi
    mov mov esi, dword ptr [g_101D4884]
    fstp fstp dword ptr [esp + 16]
    mov mov eax, esi
    fild fild dword ptr [g_10766720]
    fstp fstp dword ptr [esp + 12]
    call sub_1002EAC6
    mov mov eax, dword ptr [esp + 28]
    fld fld dword ptr [esp + 12]
    fsub fsub dword ptr [g_1019BCB4]
    push push eax
    push push eax
    mov mov eax, dword ptr [esp + 32]
    push push eax
    push push eax
    mov mov eax, dword ptr [g_101D1B54]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    or or ebx, -1
    fld fld dword ptr [esp + 40]
    mov mov dword ptr [g_1073055C], esi
    fsub fsub dword ptr [g_1019BCB4]
    fstp fstp dword ptr [esp]
    push push 03F800000h
    push push 03F800000h
    call sub_1002E8BD
    add add esp, 32
    pop pop esi
    pop pop ebx
    add add esp, 12
    jmp sub_1003A94A
FUN_10030920 ENDP
END
