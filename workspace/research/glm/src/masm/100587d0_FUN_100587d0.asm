.686
.MODEL FLAT, C
EXTRN sub_10058903:PROC
EXTRN sub_1010A993:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BE5C:DWORD
EXTRN g_1019BE60:DWORD
EXTRN g_1019BE64:DWORD
.CODE
FUN_100587d0 PROC
    sub esp, 24
    fild dword ptr [esp + 28]
    push esi
    push edi
    mov edi, dword ptr [esp + 36]
    test edi, edi
    fstp dword ptr [esp + 36]
    fld dword ptr [g_1019BC78]
    mov esi, eax
    fdiv dword ptr [esp + 36]
    mov dword ptr [esp + 36], 0
    mov dword ptr [esp + 8], 03F800000h
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 16]
    jle sub_10058903
    jmp L0
    lea esp, [esp]
L0:
    fld dword ptr [esp + 16]
    fadd st(0), st(0)
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    fsubr dword ptr [g_1019BC78]
    call sub_1010A993
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 36]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    mov eax, dword ptr [esp + 12]
    fmul dword ptr [esp + 8]
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esi + 8], eax
    fstp dword ptr [esi]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esi + 4]
    add esi, ebx
    dec edi
    fld dword ptr [esp + 16]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 36]
    fmul dword ptr [g_1019BE64]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BE60]
    fsubp st(1)
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BE64]
    fld dword ptr [esp + 28]
    fmul dword ptr [g_1019BE5C]
    fsubp st(1)
    fstp dword ptr [esp + 8]
FUN_100587d0 ENDP
END
