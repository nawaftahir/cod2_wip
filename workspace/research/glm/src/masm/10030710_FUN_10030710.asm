.686
.MODEL FLAT, C
EXTRN sub_1002E90E:PROC
EXTRN sub_100355D4:PROC
EXTRN sub_1003A99A:PROC
EXTRN sub_1003EAAE:PROC
EXTRN fp_101D4C0C:DWORD
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_101D1BAC:DWORD
EXTRN g_101D48C0:DWORD
EXTRN g_1073055C:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_10030710 PROC
    sub esp, 28
    push ebx
    push 040400000h
    call dword ptr [fp_101D4C0C]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 40]
    add esp, 4
    fcomp dword ptr [esp + 8]
    mov dword ptr [esp + 12], 0FFFFFFFFh
    fnstsw ax
    test ah, 5
    jp L0
    fld dword ptr [esp + 36]
    fdiv dword ptr [esp + 8]
    fmul dword ptr [g_1019BCAC]
    fstp dword ptr [esp + 16]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 24]
    fld dword ptr [esp + 16]
    fadd qword ptr [esp + 24]
    fistp dword ptr [esp + 20]
    mov al, byte ptr [esp + 20]
    mov ecx, dword ptr [esp + 8]
    mov byte ptr [esp + 15], al
    mov dword ptr [esp + 36], ecx
L0:
    mov edx, dword ptr [esp + 36]
    push edx
    mov ecx, 8
    call sub_100355D4
    add esp, 4
    xor eax, eax
    call sub_1003EAAE
    fild dword ptr [g_10766720]
    mov eax, dword ptr [g_101D48C0]
    mov ebx, dword ptr [esp + 12]
    push 03F800000h
    push 03F800000h
    push 0
    push 0
    sub esp, 8
    fstp dword ptr [esp + 4]
    mov dword ptr [g_1073055C], eax
    fild dword ptr [g_1076671C]
    mov eax, dword ptr [g_101D1BAC]
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002E90E
    add esp, 32
    pop ebx
    add esp, 28
    jmp sub_1003A99A
FUN_10030710 ENDP
END
