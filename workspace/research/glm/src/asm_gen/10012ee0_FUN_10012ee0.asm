; FUN_10012ee0 @ 0x10012ee0 — auto-synthesized
    EXTRN g_1019bd8c:DWORD
    EXTRN g_1019be40:DWORD
.CODE
FUN_10012ee0 PROC
    push ecx
    xor eax, eax
    mov dword ptr [esp], eax
    fild dword ptr [esp]
    inc eax
    cmp eax, 0x400
    mov dword ptr [esp], eax
    fmul dword ptr [g_1019be40]
    fmul dword ptr [g_1019bd8c]
    fsin
    fstp dword ptr [eax*4 + 0x101d620c]
    jl L0
    pop ecx
    ret
FUN_10012ee0 ENDP
END