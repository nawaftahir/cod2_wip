.686
.MODEL FLAT, C
EXTRN sub_1002E90E:PROC
EXTRN sub_100355D4:PROC
EXTRN sub_1003A99A:PROC
EXTRN sub_1003EAAE:PROC
EXTRN EXTRN fp_101D4C0C:DWORD:DWORD
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_101D1BAC:DWORD:DWORD
EXTRN EXTRN g_101D48C0:DWORD:DWORD
EXTRN EXTRN g_1073055C:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_10030710 PROC
    sub sub esp, 28
    push push ebx
    push push 040400000h
    call dword ptr [fp_101D4C0C]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 40]
    add add esp, 4
    fcomp fcomp dword ptr [esp + 8]
    mov mov dword ptr [esp + 12], -1
    fnstsw fnstsw ax
    test test ah, 5
    jp L0
    fld fld dword ptr [esp + 36]
    fdiv fdiv dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BCAC]
    fstp fstp dword ptr [esp + 16]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    fadd fadd qword ptr [esp + 24]
    fistp fistp dword ptr [esp + 20]
    mov mov al, byte ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 8]
    mov mov byte ptr [esp + 15], al
    mov mov dword ptr [esp + 36], ecx
    mov mov edx, dword ptr [esp + 36]
    push push edx
    mov mov ecx, 8
    call sub_100355D4
    add add esp, 4
    xor xor eax, eax
    call sub_1003EAAE
    fild fild dword ptr [g_10766720]
    mov mov eax, dword ptr [g_101D48C0]
    mov mov ebx, dword ptr [esp + 12]
    push push 03F800000h
L0:
    push push 03F800000h
    push push 0
    push push 0
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    mov mov dword ptr [g_1073055C], eax
    fild fild dword ptr [g_1076671C]
    mov mov eax, dword ptr [g_101D1BAC]
    fstp fstp dword ptr [esp]
    push push 0
    push push 0
    call sub_1002E90E
    add add esp, 32
    pop pop ebx
    add add esp, 28
    jmp sub_1003A99A
FUN_10030710 ENDP
END
