.686
.MODEL FLAT, C
EXTRN sub_1010A96C:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BE5C:DWORD
EXTRN g_1019BE60:DWORD
EXTRN g_1019BE64:DWORD
.CODE
FUN_10058620 PROC
    sub esp, 20
    fild dword ptr [esp + 24]
    push esi
    push edi
    mov edi, dword ptr [esp + 32]
    test edi, edi
    fstp dword ptr [esp + 32]
    fld dword ptr [g_1019BC78]
    mov esi, eax
    fdiv dword ptr [esp + 32]
    mov dword ptr [esp + 32], 0
    mov dword ptr [esp + 8], 03F800000h
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 12]
    jle L1
L0:
    fld dword ptr [esp + 12]
    call sub_1010A96C
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    mov eax, dword ptr [esp + 32]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 24], eax
    fmul dword ptr [esp + 8]
    fstp dword ptr [esi]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 32]
    fstp dword ptr [esi + 4]
    add esi, ebx
    dec edi
    fld dword ptr [esp + 12]
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 32]
    fmul dword ptr [g_1019BE64]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BE60]
    fsubp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BE64]
    fld dword ptr [esp + 24]
    fmul dword ptr [g_1019BE5C]
    fsubp st(1)
    fstp dword ptr [esp + 8]
    jne L0
L1:
    pop edi
    pop esi
    add esp, 20
    ret
FUN_10058620 ENDP
END
