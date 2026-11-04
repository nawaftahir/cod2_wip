.686
.MODEL FLAT, C
EXTRN sub_100205F9:PROC
EXTRN sub_10020A31:PROC
EXTRN sub_10020A48:PROC
EXTRN sub_10020A7C:PROC
EXTRN sub_10020A8C:PROC
EXTRN sub_10020A93:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD68:DWORD:DWORD
EXTRN EXTRN g_101DA9A0:DWORD:DWORD
EXTRN EXTRN g_101DA9A4:DWORD:DWORD
EXTRN EXTRN g_101DA9A8:DWORD:DWORD
EXTRN EXTRN g_101DA9B0:DWORD:DWORD
EXTRN EXTRN g_101DA9B4:DWORD:DWORD
EXTRN EXTRN g_101DA9B8:DWORD:DWORD
EXTRN EXTRN g_101DA9BC:DWORD:DWORD
.CODE
FUN_10020950 PROC
    sub sub esp, 20
    fld fld qword ptr [g_1019BD68]
    push push ebx
    push push ebp
    fstp fstp qword ptr [esp + 20]
    push push esi
    xor xor ebp, ebp
    push push edi
    mov mov edi, dword ptr [g_101DA9BC]
    mov mov dword ptr [esp + 16], ebp
    lea lea ecx, [ecx]
    fild fild dword ptr [esp + 16]
    xor xor esi, esi
    mov mov dword ptr [esp + 16], esi
    fadd fadd dword ptr [g_1019BCB0]
    fsub fsub dword ptr [g_101DA9B4]
    fmul fmul dword ptr [g_101DA9A8]
    fstp fstp dword ptr [esp + 20]
    mov mov ebx, dword ptr [esp + 20]
    fild fild dword ptr [esp + 16]
    push push ebx
    fadd fadd dword ptr [g_1019BCB0]
    fsub fsub dword ptr [g_101DA9B0]
    fmul fmul dword ptr [g_101DA9A4]
    fstp fstp dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 24]
    push push eax
    call sub_100205F9
    fld fld dword ptr [g_101DA9A0]
    fmul fmul st(1)
    add add esp, 8
    fadd fadd dword ptr [g_101DA9B8]
    fstp fstp dword ptr [esp + 20]
    fstp fstp st(0)
    fld fld dword ptr [esp + 20]
    fsub fsub qword ptr [esp + 28]
    fistp fistp dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 24]
    test test eax, eax
    jge sub_10020A7C
    xor xor eax, eax
    jmp sub_10020A8C
    cmp cmp eax, 0FFh
    jle sub_10020A93
    mov mov eax, 0FFh
    mov mov byte ptr [edi], al
    inc inc edi
    inc inc esi
    cmp cmp esi, 0200h
    mov mov dword ptr [esp + 16], esi
    jne sub_10020A48
    inc inc ebp
    cmp cmp ebp, esi
    mov mov dword ptr [esp + 16], ebp
    jne sub_10020A31
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 20
    ret ret
FUN_10020950 ENDP
END
