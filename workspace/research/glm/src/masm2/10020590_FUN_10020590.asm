.686
.MODEL FLAT, C
EXTRN EXTRN fp_101D4B2C:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101DA988:DWORD:DWORD
EXTRN EXTRN g_101DA994:DWORD:DWORD
.CODE
FUN_10020590 PROC
    sub sub esp, 68
    mov mov eax, dword ptr [esp + 72]
    fld fld dword ptr [g_101DA994]
    mov mov ecx, dword ptr [esp + 76]
    fadd fadd dword ptr [g_1019BC78]
    mov mov dword ptr [esp + 24], ecx
    mov mov edx, eax
    mov mov dword ptr [esp + 20], eax
    fst fst dword ptr [esp]
    fld fld dword ptr [g_101DA988]
    mov mov eax, ecx
    fsub fsub dword ptr [g_1019BC78]
    xor xor ecx, ecx
    mov mov dword ptr [esp + 32], ecx
    mov mov dword ptr [esp + 36], ecx
    mov mov dword ptr [esp + 40], ecx
    fst fst dword ptr [esp + 4]
    mov mov dword ptr [esp + 44], ecx
    fxch fxch st(1)
    mov mov dword ptr [esp + 48], ecx
    fstp fstp dword ptr [esp + 28]
    mov mov dword ptr [esp + 52], ecx
    push push 02001h
    fstp fstp dword ptr [esp + 20]
    mov mov dword ptr [esp + 60], ecx
    mov mov dword ptr [esp + 64], ecx
    push push ecx
    push push 010191348h
    mov mov dword ptr [esp + 20], edx
    push push 010191348h
    lea lea edx, [esp + 24]
    mov mov dword ptr [esp + 28], eax
    push push edx
    lea lea eax, [esp + 40]
    mov mov dword ptr [esp + 84], ecx
    push push eax
    lea lea ecx, [esp + 56]
    push push ecx
    mov mov dword ptr [esp + 60], 03F800000h
    call dword ptr [fp_101D4B2C]
    fld fld dword ptr [esp + 32]
    fsub fsub dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 60]
    fadd fadd dword ptr [esp + 28]
    add add esp, 96
    ret ret
FUN_10020590 ENDP
END
