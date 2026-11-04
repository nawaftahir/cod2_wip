; FUN_10009250 @ 0x10009250 — auto-synthesized
    EXTRN g_1067850c:DWORD
    EXTRN g_10678510:DWORD
    sub_100087d5 PROTO C
    sub_10009214 PROTO C
.CODE
FUN_10009250 PROC
    push ecx
    mov eax, dword ptr [g_1067850c]
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    xor esi, esi
    test eax, eax
    push edi
    mov dword ptr [esp + 0xc], eax
    jle L0
    xor edi, edi
    lea esp, [esp]
    mov eax, dword ptr [g_10678510]
    mov eax, dword ptr [edi + eax]
    cmp eax, 1
    jg L1
    push ebx
    push ebp
    push esi
    call sub_100087d5
    jmp L2
    cmp eax, 3
    jne L3
    push ebx
    push ebp
    push esi
    call sub_10009214
    add esp, 0xc
    mov eax, dword ptr [esp + 0xc]
    inc esi
    add edi, 0x74
    cmp esi, eax
    jl L4
    pop edi
    pop esi
    pop ebp
    pop ecx
    ret
FUN_10009250 ENDP
END