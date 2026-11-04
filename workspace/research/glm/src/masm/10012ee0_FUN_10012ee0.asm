.686
.MODEL FLAT, C
EXTRN g_1019BD8C:DWORD
EXTRN g_1019BE40:DWORD
.CODE
FUN_10012ee0 PROC
    push ecx
    xor eax, eax
    mov dword ptr [esp], eax
L0:
    fild dword ptr [esp]
    inc eax
    cmp eax, 000000400h
    mov dword ptr [esp], eax
    fmul dword ptr [g_1019BE40]
    fmul dword ptr [g_1019BD8C]
    fsin
    fstp dword ptr [eax*4 + 0101D620Ch]
    jl L0
    pop ecx
    ret
FUN_10012ee0 ENDP
END
