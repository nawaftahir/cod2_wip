; FUN_1003ec50 @ 0x1003ec50 — auto-synthesized
    EXTRN g_101d1b08:DWORD
    sub_1003d966 PROTO C
.CODE
FUN_1003ec50 PROC
    push edi
    xor edi, edi
    xor eax, eax
    mov al, byte ptr [edi + 0x10766764]
    push eax
    mov eax, dword ptr [g_101d1b08]
    call sub_1003d966
    add esp, 4
    inc edi
    cmp edi, 0x10
    jl L0
    pop edi
    ret
FUN_1003ec50 ENDP
END