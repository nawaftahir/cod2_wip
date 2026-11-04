; FUN_10009820 @ 0x10009820 — auto-synthesized
    EXTRN g_101ce5e0:DWORD
    EXTRN g_101ce5e4:DWORD
.CODE
FUN_10009820 PROC
    mov eax, dword ptr [g_101ce5e4]
    push ebx
    push ebp
    mov ebp, dword ptr [eax]
    push esi
    mov byte ptr [ebp], 0
    mov esi, dword ptr [g_101ce5e0]
    dec esi
    mov ecx, 1
    xor ebx, ebx
    cmp esi, ecx
    push edi
    mov dword ptr [g_101ce5e0], esi
    jl L0
    cmp ecx, esi
    mov edx, dword ptr [g_101ce5e4]
    jge L1
    fld dword ptr [edx + ecx*8 + 0xc]
    fcomp dword ptr [edx + ecx*8 + 4]
    fnstsw ax
    test ah, 5
    jp L1
    inc ecx
    fld dword ptr [edx + esi*8 + 4]
    lea edi, [edx + ecx*8]
    fcomp dword ptr [edi + 4]
    fnstsw ax
    test ah, 0x41
    jnp L2
    mov eax, dword ptr [edi]
    mov dword ptr [edx + ebx*8], eax
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [g_101ce5e4]
    mov dword ptr [eax + ebx*8 + 4], edx
    mov esi, dword ptr [g_101ce5e0]
    mov ebx, ecx
    lea ecx, [ecx + ecx + 1]
    cmp ecx, esi
    jle L3
    mov edx, dword ptr [g_101ce5e4]
    mov ecx, edx
    mov eax, dword ptr [ecx + esi*8]
    mov dword ptr [edx + ebx*8], eax
    mov edx, dword ptr [g_101ce5e0]
    mov eax, dword ptr [ecx + edx*8 + 4]
    mov ecx, dword ptr [g_101ce5e4]
    pop edi
    mov dword ptr [ecx + ebx*8 + 4], eax
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_10009820 ENDP
END