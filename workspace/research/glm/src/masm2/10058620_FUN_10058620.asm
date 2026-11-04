.686
.MODEL FLAT, C
EXTRN sub_1005871D:PROC
EXTRN sub_1010A96C:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BE5C:DWORD:DWORD
EXTRN EXTRN g_1019BE60:DWORD:DWORD
EXTRN EXTRN g_1019BE64:DWORD:DWORD
.CODE
FUN_10058620 PROC
    sub sub esp, 20
    fild fild dword ptr [esp + 24]
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 32]
    test test edi, edi
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [g_1019BC78]
    mov mov esi, eax
    fdiv fdiv dword ptr [esp + 32]
    mov mov dword ptr [esp + 32], 0
    mov mov dword ptr [esp + 8], 03F800000h
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 12]
    jle sub_1005871D
    fld fld dword ptr [esp + 12]
    call sub_1010A96C
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    mov mov dword ptr [esp + 24], eax
    fmul fmul dword ptr [esp + 8]
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 32]
    fstp fstp dword ptr [esi + 4]
    add add esi, ebx
    dec dec edi
    fld fld dword ptr [esp + 12]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [g_1019BE64]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BE60]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BE64]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [g_1019BE5C]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 8]
    jne sub_1005871D
    pop pop edi
    pop pop esi
    add add esp, 20
    ret ret
FUN_10058620 ENDP
END
