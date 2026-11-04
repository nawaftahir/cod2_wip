; FUN_10012820 @ 0x10012820 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101d1bf4:DWORD
    EXTRN g_101d1bfc:DWORD
    sub_1001194d PROTO C
    sub_10012427 PROTO C
    sub_10012811 PROTO C
    sub_1006223a PROTO C
.CODE
FUN_10012820 PROC
    mov eax, dword ptr [g_101d1bf4]
    test eax, eax
    jne L0
    push 0x10193c1c
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 8
    push 0x20
    call sub_1006223a
    test eax, eax
    mov dword ptr [g_101d1bf4], eax
    jne L0
    push 0x10193bf8
    push eax
    call dword ptr [fp_101d49c8]
    add esp, 8
    xor al, al
    ret
    push esi
    call sub_10012811
    mov esi, eax
    mov dword ptr [g_101d1bfc], eax
    call sub_1001194d
    mov eax, dword ptr [g_101d1bfc]
    call sub_10012427
    mov al, 1
    pop esi
    ret
FUN_10012820 ENDP
END