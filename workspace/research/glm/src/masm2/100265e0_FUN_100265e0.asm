.686
.MODEL FLAT, C
EXTRN sub_1002C44E:PROC
EXTRN sub_10059178:PROC
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_101D4928:DWORD:DWORD
.CODE
FUN_100265e0 PROC
    sub sub esp, 12
    movzx movzx ecx, word ptr [g_101D4928]
    mov mov dword ptr [esp], ecx
    lea lea eax, [eax + eax*8]
    fild fild dword ptr [esp]
    shl shl eax, 2
    push push esi
    lea lea esi, [esp + 4]
    fmul fmul dword ptr [g_1019BCB0]
    fld fld st(0)
    fld fld st(0)
    fmul fmul dword ptr [eax + 0101903A8h]
    fld fld st(1)
    fmul fmul dword ptr [eax + 0101903ACh]
    fstp fstp dword ptr [esp + 8]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 0101903B0h]
    fstp fstp dword ptr [esp + 12]
    fild fild dword ptr [esp + 20]
    fsub fsub st(2)
    fadd fadd dword ptr [g_1019BCB0]
    fst fst dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0101903B4h]
    faddp faddp st(1)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0101903B8h]
    fadd fadd dword ptr [esp + 8]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0101903BCh]
    fadd fadd dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 12]
    fild fild dword ptr [esp + 24]
    fsub fsub st(2)
    fadd fadd dword ptr [g_1019BCB0]
    fst fst dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0101903C0h]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 4]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0101903C4h]
    fadd fadd dword ptr [esp + 8]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0101903C8h]
    fadd fadd dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 12]
    call sub_10059178
    mov mov edx, dword ptr [esp + 12]
    fstp fstp st(0)
    mov mov eax, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 28]
    push push edx
    push push eax
    push push ecx
    call sub_1002C44E
    fmul fmul dword ptr [g_1019BCAC]
    add add esp, 12
    fstp fstp dword ptr [esp + 20]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 4]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 4]
    fistp fistp dword ptr [esp + 24]
    mov mov al, byte ptr [esp + 24]
    pop pop esi
    add add esp, 12
    ret ret
FUN_100265e0 ENDP
END
