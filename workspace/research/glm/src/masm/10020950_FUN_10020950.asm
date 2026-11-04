.686
.MODEL FLAT, C
EXTRN sub_100205F9:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD68:DWORD
EXTRN g_101DA9A0:DWORD
EXTRN g_101DA9A4:DWORD
EXTRN g_101DA9A8:DWORD
EXTRN g_101DA9B0:DWORD
EXTRN g_101DA9B4:DWORD
EXTRN g_101DA9B8:DWORD
EXTRN g_101DA9BC:DWORD
.CODE
FUN_10020950 PROC
    sub esp, 20
    fld qword ptr [g_1019BD68]
    push ebx
    push ebp
    fstp qword ptr [esp + 20]
    push esi
    xor ebp, ebp
    push edi
    mov edi, dword ptr [g_101DA9BC]
    mov dword ptr [esp + 16], ebp
    lea ecx, [ecx]
L0:
    fild dword ptr [esp + 16]
    xor esi, esi
    mov dword ptr [esp + 16], esi
    fadd dword ptr [g_1019BCB0]
    fsub dword ptr [g_101DA9B4]
    fmul dword ptr [g_101DA9A8]
    fstp dword ptr [esp + 20]
    mov ebx, dword ptr [esp + 20]
L1:
    fild dword ptr [esp + 16]
    push ebx
    fadd dword ptr [g_1019BCB0]
    fsub dword ptr [g_101DA9B0]
    fmul dword ptr [g_101DA9A4]
    fstp dword ptr [esp + 24]
    mov eax, dword ptr [esp + 24]
    push eax
    call sub_100205F9
    fld dword ptr [g_101DA9A0]
    fmul st(1)
    add esp, 8
    fadd dword ptr [g_101DA9B8]
    fstp dword ptr [esp + 20]
    fstp st(0)
    fld dword ptr [esp + 20]
    fsub qword ptr [esp + 28]
    fistp dword ptr [esp + 24]
    mov eax, dword ptr [esp + 24]
    test eax, eax
    jge L2
    xor eax, eax
    jmp L3
L2:
    cmp eax, 0000000FFh
    jle L3
    mov eax, 0000000FFh
L3:
    mov byte ptr [edi], al
    inc edi
    inc esi
    cmp esi, 000000200h
    mov dword ptr [esp + 16], esi
    jne L1
    inc ebp
    cmp ebp, esi
    mov dword ptr [esp + 16], ebp
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 20
    ret
FUN_10020950 ENDP
END
