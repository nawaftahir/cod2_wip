; FUN_100296a0 @ 0x100296a0 — auto-synthesized
    EXTRN fp_101d4b3c:DWORD
    EXTRN fp_101d4b48:DWORD
.CODE
FUN_100296a0 PROC
    sub esp, 8
    push ebp
    push esi
    push edi
    push ebx
    xor edi, edi
    call dword ptr [fp_101d4b48]
    mov ebp, eax
    add esp, 4
    xor esi, esi
    test ebp, ebp
    jle L0
    lea ebx, [ebx]
    lea eax, [esp + 0xc]
    push eax
    push esi
    lea ecx, [esp + 0x18]
    push ecx
    push ebx
    call dword ptr [fp_101d4b3c]
    add esp, 0x10
    cmp edi, eax
    jge L1
    mov edi, eax
    inc esi
    cmp esi, ebp
    jl L2
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
FUN_100296a0 ENDP
END