.686
.MODEL FLAT, C
EXTRN sub_1002C44E:PROC
EXTRN sub_10059178:PROC
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_101D4928:DWORD
.CODE
FUN_100265e0 PROC
    sub esp, 12
    movzx ecx, word ptr [g_101D4928]
    mov dword ptr [esp], ecx
    lea eax, [eax + eax*8]
    fild dword ptr [esp]
    shl eax, 2
    push esi
    lea esi, [esp + 4]
    fmul dword ptr [g_1019BCB0]
    fld st(0)
    fld st(0)
    fmul dword ptr [eax + 0101903A8h]
    fld st(1)
    fmul dword ptr [eax + 0101903ACh]
    fstp dword ptr [esp + 8]
    fxch st(1)
    fmul dword ptr [eax + 0101903B0h]
    fstp dword ptr [esp + 12]
    fild dword ptr [esp + 20]
    fsub st(2)
    fadd dword ptr [g_1019BCB0]
    fst dword ptr [esp + 20]
    fmul dword ptr [eax + 0101903B4h]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0101903B8h]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0101903BCh]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fild dword ptr [esp + 24]
    fsub st(2)
    fadd dword ptr [g_1019BCB0]
    fst dword ptr [esp + 20]
    fmul dword ptr [eax + 0101903C0h]
    fadd st(1)
    fstp dword ptr [esp + 4]
    fstp st(0)
    fstp st(0)
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0101903C4h]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0101903C8h]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    call sub_10059178
    mov edx, dword ptr [esp + 12]
    fstp st(0)
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 28]
    push edx
    push eax
    push ecx
    call sub_1002C44E
    fmul dword ptr [g_1019BCAC]
    add esp, 12
    fstp dword ptr [esp + 20]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 4]
    fistp dword ptr [esp + 24]
    mov al, byte ptr [esp + 24]
    pop esi
    add esp, 12
    ret
FUN_100265e0 ENDP
END
