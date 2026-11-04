; FUN_10003810 @ 0x10003810 — auto-synthesized
    EXTRN g_101ae384:DWORD
    EXTRN g_101ae388:DWORD
    sub_100038aa PROTO C
    sub_100298bf PROTO C
    sub_10029c45 PROTO C
.CODE
FUN_10003810 PROC
    mov eax, dword ptr [g_101ae384]
    push esi
    xor esi, esi
    test eax, eax
    push edi
    jle L0
    xor edi, edi
    nop
    mov eax, dword ptr [g_101ae388]
    mov ecx, dword ptr [edi + eax + 0x1c]
    push ecx
    call sub_100298bf
    mov eax, dword ptr [g_101ae384]
    add esp, 4
    inc esi
    add edi, 0x3c
    cmp esi, eax
    jl L1
    xor esi, esi
    test eax, eax
    jle sub_100038aa
    xor edi, edi
    jmp L2
    lea esp, [esp]
    mov edx, dword ptr [g_101ae388]
    mov eax, dword ptr [edi + edx + 0x1c]
    push eax
    push 0x101ae288
    call sub_10029c45
    mov eax, dword ptr [g_101ae384]
    add esp, 8
    inc esi
    add edi, 0x3c
FUN_10003810 ENDP
END