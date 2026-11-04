.686
.MODEL FLAT, C
EXTRN fp_101D4B2C:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_101DA988:DWORD
EXTRN g_101DA994:DWORD
.CODE
FUN_10020590 PROC
    sub esp, 68
    mov eax, dword ptr [esp + 72]
    fld dword ptr [g_101DA994]
    mov ecx, dword ptr [esp + 76]
    fadd dword ptr [g_1019BC78]
    mov dword ptr [esp + 24], ecx
    mov edx, eax
    mov dword ptr [esp + 20], eax
    fst dword ptr [esp]
    fld dword ptr [g_101DA988]
    mov eax, ecx
    fsub dword ptr [g_1019BC78]
    xor ecx, ecx
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 40], ecx
    fst dword ptr [esp + 4]
    mov dword ptr [esp + 44], ecx
    fxch st(1)
    mov dword ptr [esp + 48], ecx
    fstp dword ptr [esp + 28]
    mov dword ptr [esp + 52], ecx
    push 000002001h
    fstp dword ptr [esp + 20]
    mov dword ptr [esp + 60], ecx
    mov dword ptr [esp + 64], ecx
    push ecx
    push 010191348h
    mov dword ptr [esp + 20], edx
    push 010191348h
    lea edx, [esp + 24]
    mov dword ptr [esp + 28], eax
    push edx
    lea eax, [esp + 40]
    mov dword ptr [esp + 84], ecx
    push eax
    lea ecx, [esp + 56]
    push ecx
    mov dword ptr [esp + 60], 03F800000h
    call dword ptr [fp_101D4B2C]
    fld dword ptr [esp + 32]
    fsub dword ptr [esp + 28]
    fmul dword ptr [esp + 60]
    fadd dword ptr [esp + 28]
    add esp, 96
    ret
FUN_10020590 ENDP
END
