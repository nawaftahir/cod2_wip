.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1072DCB0:DWORD:DWORD
EXTRN EXTRN g_1072DCB4:DWORD:DWORD
EXTRN EXTRN g_1072DCB8:DWORD:DWORD
EXTRN EXTRN g_1072DCBC:DWORD:DWORD
EXTRN EXTRN g_1072DCE0:DWORD:DWORD
EXTRN EXTRN g_1072DCE4:DWORD:DWORD
EXTRN EXTRN g_1072DCE8:DWORD:DWORD
EXTRN EXTRN g_1072DCEC:DWORD:DWORD
EXTRN EXTRN g_1072DCF0:DWORD:DWORD
EXTRN EXTRN g_1072DCF4:DWORD:DWORD
EXTRN EXTRN g_1072DCF8:DWORD:DWORD
EXTRN EXTRN g_1072DCFC:DWORD:DWORD
EXTRN EXTRN g_1072DDE0:DWORD:DWORD
EXTRN EXTRN g_1072DDE4:DWORD:DWORD
EXTRN EXTRN g_1072DDE8:DWORD:DWORD
EXTRN EXTRN g_1072DDEC:DWORD:DWORD
EXTRN EXTRN g_1072DEBC:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
EXTRN EXTRN g_10766724:DWORD:DWORD
.CODE
FUN_1003e690 PROC
    sub sub esp, 52
    fild fild dword ptr [g_1076671C]
    mov mov edx, dword ptr [g_10766724]
    fld fld dword ptr [g_1019BC78]
    mov mov eax, 1
    xor xor ecx, ecx
    cmp cmp edx, eax
    fdiv fdiv st(1)
    mov mov byte ptr [g_1072DEBD], cl
    mov mov byte ptr [g_1072DEBC], al
    fstp fstp dword ptr [esp]
    fild fild dword ptr [g_10766720]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 8]
    fstp fstp dword ptr [esp + 4]
    jne L0
    mov mov eax, dword ptr [g_1076671C]
    mov mov dword ptr [esp + 36], ecx
    mov mov dword ptr [esp + 40], ecx
    mov mov ecx, dword ptr [g_10766720]
    mov mov dword ptr [esp + 44], eax
    mov mov dword ptr [esp + 48], ecx
    jmp L1
    mov mov edx, dword ptr [g_1072DDE0]
    mov mov eax, dword ptr [g_1072DDE4]
    mov mov ecx, dword ptr [g_1072DDE8]
    mov mov dword ptr [esp + 36], edx
    mov mov edx, dword ptr [g_1072DDEC]
    mov mov dword ptr [esp + 40], eax
    mov mov dword ptr [esp + 44], ecx
    mov mov dword ptr [esp + 48], edx
    fild fild dword ptr [esp + 44]
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, dword ptr [esp]
    mov mov edx, dword ptr [esp + 4]
    fmul fmul dword ptr [esp]
    mov mov dword ptr [g_1072DCB4], eax
    fild fild dword ptr [esp + 48]
    mov mov dword ptr [g_1072DCB8], ecx
L0:
    mov mov dword ptr [g_1072DCBC], edx
    mov mov dword ptr [g_1072DCE8], 0
    fmul fmul dword ptr [esp + 4]
    mov mov dword ptr [g_1072DCEC], 03F800000h
    mov mov dword ptr [g_1072DCF8], 0
    mov mov dword ptr [g_1072DCFC], 0
    fstp fstp dword ptr [esp + 24]
    fmul fmul dword ptr [g_1019BCB0]
    fst fst dword ptr [esp + 12]
    fld fld dword ptr [esp + 24]
L1:
    fmul fmul dword ptr [g_1019BCB0]
    fst fst dword ptr [esp + 32]
    fild fild dword ptr [esp + 36]
    fmul fmul dword ptr [esp]
    fild fild dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 12]
    fstp fstp st(0)
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [g_1019BCB0]
    fadd fadd dword ptr [esp + 12]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [g_1019BCB0]
    fadd fadd dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 16]
    fxch fxch st(2)
    mov mov dword ptr [g_1072DCF4], eax
    fstp fstp dword ptr [g_1072DCB0]
    fstp fstp dword ptr [g_1072DCE0]
    fld fld dword ptr [esp + 32]
    fchs fchs
    fstp fstp dword ptr [g_1072DCE4]
    fstp fstp dword ptr [g_1072DCF0]
    add add esp, 52
    ret ret
FUN_1003e690 ENDP
END
