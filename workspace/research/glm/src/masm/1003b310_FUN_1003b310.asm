.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003b310 PROC
    mov ecx, dword ptr [g_1072DDC8]
    mov edx, dword ptr [g_101D1B9C]
    fld dword ptr [ecx + 0000000F4h]
    fmul dword ptr [edx + 0000001BCh]
    sub esp, 44
    fld dword ptr [ecx + 0000000E4h]
    push ebx
    fmul dword ptr [edx + 0000001B8h]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 64]
    faddp st(1)
    fld dword ptr [ecx + 0000000D4h]
    fmul dword ptr [edx + 0000001B4h]
    faddp st(1)
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L1
    fstp st(0)
L0:
    fld dword ptr [g_1019BC84]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 44
    ret
L1:
    fld dword ptr [ecx + 0000000E8h]
    mov ebx, dword ptr [g_101D4C6C]
    fmul dword ptr [edx + 0000001BCh]
    mov ebp, dword ptr [g_101D4C70]
    fld dword ptr [ecx + 0000000D8h]
    mov dword ptr [esp + 20], ebx
    fmul dword ptr [edx + 0000001B8h]
    mov dword ptr [esp + 28], ebp
    faddp st(1)
    fld dword ptr [edx + 0000001B4h]
    fmul dword ptr [ecx + 0000000C8h]
    faddp st(1)
    fld dword ptr [ecx + 0000000ECh]
    fmul dword ptr [edx + 0000001BCh]
    fld dword ptr [ecx + 0000000DCh]
    fmul dword ptr [edx + 0000001B8h]
    faddp st(1)
    fld dword ptr [ecx + 0000000CCh]
    fmul dword ptr [edx + 0000001B4h]
    faddp st(1)
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BC78]
    fdiv st(2)
    fst dword ptr [esp + 16]
    fmul st(1)
    fadd dword ptr [g_1019BC78]
    fimul dword ptr [esp + 20]
    fisub dword ptr [esp + 64]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 20]
    fstp st(0)
    fstp st(0)
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 32]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 32]
    fistp dword ptr [esp + 24]
    fld dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 24]
    fmul dword ptr [esp + 44]
    fadd dword ptr [g_1019BC78]
    fimul dword ptr [esp + 28]
    fisub dword ptr [esp + 68]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 28]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 32]
    fld dword ptr [esp + 28]
    fadd qword ptr [esp + 32]
    fistp dword ptr [esp + 24]
    mov esi, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 68]
    add eax, esi
    test ecx, ecx
    lea edx, [ecx + edi]
    jge L2
    xor ecx, ecx
L2:
    cmp edx, ebx
    jle L3
    mov edx, ebx
L3:
    test esi, esi
    jge L4
    xor esi, esi
L4:
    cmp eax, ebp
    jle L5
    mov eax, ebp
L5:
    cmp edx, ecx
    jle L0
    cmp eax, esi
    jle L0
    sub eax, esi
    sub edx, ecx
    imul eax, edx
    imul edi, dword ptr [esp + 68]
    mov dword ptr [esp + 28], eax
    fild dword ptr [esp + 28]
    mov dword ptr [esp + 28], edi
    pop edi
    pop esi
    fidiv dword ptr [esp + 20]
    pop ebp
    pop ebx
    add esp, 44
    ret
FUN_1003b310 ENDP
END
