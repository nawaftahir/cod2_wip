; FUN_10030580 @ 0x10030580 — auto-synthesized
    EXTRN g_1072decc:DWORD
    EXTRN g_1072ded0:DWORD
    sub_100304f3 PROTO C
.CODE
FUN_10030580 PROC
    push ecx
    mov eax, dword ptr [g_1072ded0]
    push esi
    mov esi, dword ptr [g_1072decc]
    push edi
    xor edi, edi
    test eax, eax
    jle L0
    mov eax, dword ptr [edi*4 + 0x1072ded4]
    push eax
    mov eax, esi
    call sub_100304f3
    mov eax, dword ptr [g_1072ded0]
    mov ecx, 1
    sub ecx, esi
    add esp, 4
    inc edi
    cmp edi, eax
    mov esi, ecx
    jl L1
    pop edi
    mov dword ptr [g_1072ded0], 0
    pop esi
    pop ecx
    ret
FUN_10030580 ENDP
END