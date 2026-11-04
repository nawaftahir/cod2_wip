; FUN_10014fc0 @ 0x10014fc0 — auto-synthesized
    EXTRN g_101ce6fc:DWORD
    EXTRN g_10678514:DWORD
    EXTRN g_10678ab8:DWORD
    sub_10014e2a PROTO C
    sub_10014f83 PROTO C
.CODE
FUN_10014fc0 PROC
    mov ecx, dword ptr [g_10678514]
    sub esp, 0x80
    push ebx
    push ebp
    push esi
    mov esi, eax
    xor ebx, ebx
    xor eax, eax
    test ecx, ecx
    push edi
    jle L0
    mov edx, 0x10678518
    nop
    cmp byte ptr [eax + 0x10678a98], 0
    jne L1
    mov dword ptr [esp + ebx*4 + 0x10], edx
    inc ebx
    inc eax
    add edx, 0x2c
    cmp eax, ecx
    jl L2
    mov eax, dword ptr [g_101ce6fc]
    mov eax, dword ptr [eax + 8]
    cmp eax, esi
    jge L3
    mov esi, eax
    cmp ebx, esi
    jle L4
    push esi
    push ebx
    lea eax, [esp + 0x18]
    call sub_10014f83
    add esp, 8
    mov ebx, esi
    xor ebp, ebp
    xor edi, edi
    test ebx, ebx
    jle L5
    mov esi, dword ptr [esp + 0x9c]
    add esi, 4
    lea ebx, [ebx]
    mov eax, dword ptr [esp + edi*4 + 0x10]
    mov dword ptr [esi - 4], eax
    mov ecx, dword ptr [g_10678ab8]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 0x10]
    mov ecx, dword ptr [esp + 0x94]
    add eax, 4
    push edx
    push eax
    mov eax, dword ptr [esp + 0xa0]
    call sub_10014e2a
    mov eax, dword ptr [g_10678ab8]
    mov ecx, dword ptr [esi]
    add esp, 8
    sub eax, ecx
    mov dword ptr [esi + 4], eax
    je L6
    inc ebp
    add esi, 0xc
    inc edi
    cmp edi, ebx
    jl L7
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 0x80
    ret
FUN_10014fc0 ENDP
END