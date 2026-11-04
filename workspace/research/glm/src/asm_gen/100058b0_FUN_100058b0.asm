; FUN_100058b0 @ 0x100058b0 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN g_101ae500:DWORD
    EXTRN g_101ae504:DWORD
    EXTRN g_101ae508:DWORD
    EXTRN g_10678504:DWORD
.CODE
FUN_100058b0 PROC
    mov ecx, dword ptr [g_101ae504]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov esi, dword ptr [g_101ae500]
    xor ebx, ebx
    test ecx, ecx
    push edi
    jle L0
    xor edx, edx
    lea esp, [esp]
    mov eax, dword ptr [g_10678504]
    sub eax, dword ptr [edx + esi + 0x20]
    lea edi, [edx + esi]
    js L1
    cmp eax, dword ptr [edi + 0x24]
    jg L1
    inc ebx
    add edx, 0x28
    jmp L2
    dec ecx
    lea eax, [ecx + ecx*4]
    mov dword ptr [g_101ae504], ecx
    lea esi, [esi + eax*8]
    mov ecx, 0xa
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov esi, dword ptr [g_101ae500]
    mov ecx, dword ptr [g_101ae504]
    cmp ebx, ecx
    jl L3
    test esi, esi
    je L4
    mov eax, dword ptr [ebp + 0x48]
    test eax, eax
    jne L5
    mov eax, dword ptr [g_101ae508]
    lea ecx, [eax + eax*4]
    shl ecx, 3
    push ecx
    call dword ptr [fp_101d49dc]
    mov dword ptr [ebp + 0x48], eax
    mov esi, dword ptr [g_101ae500]
    mov ecx, dword ptr [g_101ae504]
    add esp, 4
    mov edi, dword ptr [ebp + 0x48]
    lea ecx, [ecx + ecx*4]
    shl ecx, 3
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [g_101ae504]
    pop edi
    pop esi
    mov dword ptr [ebp + 0x4c], eax
    pop ebp
    pop ebx
    ret
    pop edi
    pop esi
    mov dword ptr [ebp + 0x4c], ecx
    pop ebp
    pop ebx
    ret
FUN_100058b0 ENDP
END