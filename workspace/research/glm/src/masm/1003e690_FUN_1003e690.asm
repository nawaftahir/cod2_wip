.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1072DCB0:DWORD
EXTRN g_1072DCB4:DWORD
EXTRN g_1072DCB8:DWORD
EXTRN g_1072DCBC:DWORD
EXTRN g_1072DCE0:DWORD
EXTRN g_1072DCE4:DWORD
EXTRN g_1072DCE8:DWORD
EXTRN g_1072DCEC:DWORD
EXTRN g_1072DCF0:DWORD
EXTRN g_1072DCF4:DWORD
EXTRN g_1072DCF8:DWORD
EXTRN g_1072DCFC:DWORD
EXTRN g_1072DDE0:DWORD
EXTRN g_1072DDE4:DWORD
EXTRN g_1072DDE8:DWORD
EXTRN g_1072DDEC:DWORD
EXTRN g_1072DEBC:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
EXTRN g_10766724:DWORD
.CODE
FUN_1003e690 PROC
    sub esp, 52
    fild dword ptr [g_1076671C]
    mov edx, dword ptr [g_10766724]
    fld dword ptr [g_1019BC78]
    mov eax, 1
    xor ecx, ecx
    cmp edx, eax
    fdiv st(1)
    mov byte ptr [g_1072DEBD], cl
    mov byte ptr [g_1072DEBC], al
    fstp dword ptr [esp]
    fild dword ptr [g_10766720]
    fstp dword ptr [esp + 8]
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 8]
    fstp dword ptr [esp + 4]
    jne L0
    mov eax, dword ptr [g_1076671C]
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 40], ecx
    mov ecx, dword ptr [g_10766720]
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 48], ecx
    jmp L1
L0:
    mov edx, dword ptr [g_1072DDE0]
    mov eax, dword ptr [g_1072DDE4]
    mov ecx, dword ptr [g_1072DDE8]
    mov dword ptr [esp + 36], edx
    mov edx, dword ptr [g_1072DDEC]
    mov dword ptr [esp + 40], eax
    mov dword ptr [esp + 44], ecx
    mov dword ptr [esp + 48], edx
L1:
    fild dword ptr [esp + 44]
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [esp]
    mov edx, dword ptr [esp + 4]
    fmul dword ptr [esp]
    mov dword ptr [g_1072DCB4], eax
    fild dword ptr [esp + 48]
    mov dword ptr [g_1072DCB8], ecx
    mov dword ptr [g_1072DCBC], edx
    mov dword ptr [g_1072DCE8], 0
    fmul dword ptr [esp + 4]
    mov dword ptr [g_1072DCEC], 03F800000h
    mov dword ptr [g_1072DCF8], 0
    mov dword ptr [g_1072DCFC], 0
    fstp dword ptr [esp + 24]
    fmul dword ptr [g_1019BCB0]
    fst dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [g_1019BCB0]
    fst dword ptr [esp + 32]
    fild dword ptr [esp + 36]
    fmul dword ptr [esp]
    fild dword ptr [esp + 40]
    fmul dword ptr [esp + 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fadd st(1)
    fstp dword ptr [esp + 12]
    fstp st(0)
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp]
    fmul dword ptr [g_1019BCB0]
    fadd dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fmul dword ptr [g_1019BCB0]
    fadd dword ptr [esp + 16]
    fstp dword ptr [esp + 16]
    mov eax, dword ptr [esp + 16]
    fxch st(2)
    mov dword ptr [g_1072DCF4], eax
    fstp dword ptr [g_1072DCB0]
    fstp dword ptr [g_1072DCE0]
    fld dword ptr [esp + 32]
    fchs
    fstp dword ptr [g_1072DCE4]
    fstp dword ptr [g_1072DCF0]
    add esp, 52
    ret
FUN_1003e690 ENDP
END
