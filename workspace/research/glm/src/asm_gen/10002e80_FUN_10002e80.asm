; FUN_10002e80 @ 0x10002e80 — auto-synthesized
    sub_100f5df4 PROTO C
    sub_100f78e9 PROTO C
.CODE
FUN_10002e80 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    mov esi, 1
    cmp ebx, esi
    jle L0
    nop
    mov eax, dword ptr [edi + esi*8]
    push ebp
    push eax
    call sub_100f78e9
    add esp, 8
    test eax, eax
    je L1
    inc esi
    cmp esi, ebx
    jl L2
    fld dword ptr [esp + 0x10]
    pop esi
    pop ebp
    ret
    mov esi, dword ptr [edi + esi*8 + 4]
    test esi, esi
    jne L3
    fld dword ptr [esp + 0x10]
    pop esi
    pop ebp
    ret
    push esi
    call sub_100f5df4
    add esp, 4
    pop esi
    pop ebp
    ret
FUN_10002e80 ENDP
END