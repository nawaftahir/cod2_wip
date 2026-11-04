; FUN_1003dd70 @ 0x1003dd70 — auto-synthesized
    EXTRN g_101d4c88:DWORD
    sub_1003d972 PROTO C
.CODE
FUN_1003dd70 PROC
    mov eax, dword ptr [g_101d4c88]
    push edi
    xor edi, edi
    test eax, eax
    jle L0
    lea esp, [esp]
    cmp dword ptr [edi*4 + 0x10766774], esi
    jne L1
    push 0
    xor eax, eax
    call sub_1003d972
    add esp, 4
    mov eax, dword ptr [g_101d4c88]
    inc edi
    cmp edi, eax
    jl L2
    pop edi
    ret
FUN_1003dd70 ENDP
END