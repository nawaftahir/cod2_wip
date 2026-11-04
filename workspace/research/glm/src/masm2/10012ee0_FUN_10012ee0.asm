.686
.MODEL FLAT, C
EXTRN sub_10012F0F:PROC
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
EXTRN EXTRN g_1019BE40:DWORD:DWORD
.CODE
FUN_10012ee0 PROC
    push push ecx
    xor xor eax, eax
    mov mov dword ptr [esp], eax
    fild fild dword ptr [esp]
    inc inc eax
    cmp cmp eax, 0400h
    mov mov dword ptr [esp], eax
    fmul fmul dword ptr [g_1019BE40]
    fmul fmul dword ptr [g_1019BD8C]
    fsin fsin
    fstp fstp dword ptr [eax*4 + 0101D620Ch]
    jl sub_10012F0F
    pop pop ecx
    ret ret
FUN_10012ee0 ENDP
END
