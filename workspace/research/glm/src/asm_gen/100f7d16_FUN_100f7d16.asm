; FUN_100f7d16 @ 0x100f7d16 — auto-synthesized
    EXTRN g_101a47c4:DWORD
    EXTRN g_101a47cc:DWORD
    EXTRN g_101a47d0:DWORD
    EXTRN g_101a47dc:DWORD
    sub_100f7b8f PROTO C
    sub_100f7bd3 PROTO C
    sub_100f855d PROTO C
    sub_100fe8df PROTO C
    sub_101003eb PROTO C
.CODE
FUN_100f7d16 PROC
    push ebx
    push esi
    push edi
    mov byte ptr [eax], 0
    push dword ptr [g_101a47d0]
    mov edi, 0x1019563c
    push edi
    push dword ptr [g_101a47cc]
    push 3
    push dword ptr [g_101a47c4]
    call sub_100f7b8f
    mov esi, 0x101a47d0
    add esp, 0x14
    mov ebx, esi
    push 0x10195820
    push dword ptr [g_101a47c4]
    call sub_100fe8df
    add esi, 0xc
    push dword ptr [esi]
    push dword ptr [ebx]
    call sub_101003eb
    add esp, 0x10
    test eax, eax
    je L0
    xor ebp, ebp
    push dword ptr [esi]
    mov ebx, esi
    push edi
    push dword ptr [esi - 4]
    push 3
    push dword ptr [g_101a47c4]
    call sub_100f7bd3
    add esp, 0x14
    cmp esi, 0x101a4800
    jl L1
    test ebp, ebp
    pop edi
    pop esi
    pop ebx
    jne L2
    mov eax, dword ptr [g_101a47c4]
    pop ebp
    ret
    push dword ptr [g_101a47c4]
    call sub_100f855d
    and dword ptr [g_101a47c4], 0
    mov eax, dword ptr [g_101a47dc]
    pop ecx
    pop ebp
    ret
FUN_100f7d16 ENDP
END