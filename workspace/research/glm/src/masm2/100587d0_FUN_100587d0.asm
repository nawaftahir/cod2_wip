.686
.MODEL FLAT, C
EXTRN sub_10058903:PROC
EXTRN sub_1010A993:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BE5C:DWORD:DWORD
EXTRN EXTRN g_1019BE60:DWORD:DWORD
EXTRN EXTRN g_1019BE64:DWORD:DWORD
.CODE
FUN_100587d0 PROC
    sub sub esp, 24
    fild fild dword ptr [esp + 28]
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 36]
    test test edi, edi
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [g_1019BC78]
    mov mov esi, eax
    fdiv fdiv dword ptr [esp + 36]
    mov mov dword ptr [esp + 36], 0
    mov mov dword ptr [esp + 8], 03F800000h
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 16]
    jle sub_10058903
    jmp L0
    lea lea esp, [esp]
    fld fld dword ptr [esp + 16]
    fadd fadd st(0), st(0)
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    fsubr fsubr dword ptr [g_1019BC78]
    call sub_1010A993
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 8]
    mov mov dword ptr [esp + 28], ecx
    mov mov dword ptr [esi + 8], eax
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 36]
    fstp fstp dword ptr [esi + 4]
    add add esi, ebx
    dec dec edi
    fld fld dword ptr [esp + 16]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [g_1019BE64]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BE60]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BE64]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BE5C]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 8]
FUN_100587d0 ENDP
END
