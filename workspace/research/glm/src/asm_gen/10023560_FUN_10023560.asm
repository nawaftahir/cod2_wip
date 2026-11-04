; FUN_10023560 @ 0x10023560 — auto-synthesized
    EXTRN g_101d0a74:DWORD
    EXTRN g_101d0a78:DWORD
    EXTRN g_101d4924:DWORD
.CODE
FUN_10023560 PROC
    push esi
    push edi
    mov edi, 0x101d4828
    mov eax, dword ptr [edi - 4]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov eax, dword ptr [edi]
    test eax, eax
    je L1
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov esi, dword ptr [edi - 8]
    test esi, esi
    je L2
    movzx eax, byte ptr [esi + 0xc]
    test eax, eax
    jl L3
    cmp eax, 1
    jle L4
    cmp eax, 4
    je L4
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [g_101d0a74]
    sub ecx, eax
    mov eax, dword ptr [g_101d0a78]
    mov dword ptr [g_101d0a74], ecx
    mov ecx, dword ptr [esi + 0x14]
    sub eax, ecx
    mov dword ptr [g_101d0a78], eax
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L5
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    lea ecx, [esi + 0x10]
    mov dword ptr [esi + 4], 0
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [esi], 0
    add edi, 0x14
    cmp edi, 0x101d492c
    jl L6
    xor eax, eax
    mov ecx, 0x41
    mov edi, 0x101d4820
    rep stosd dword ptr es:[edi], eax
    pop edi
    mov dword ptr [g_101d4924], eax
    pop esi
    ret
FUN_10023560 ENDP
END