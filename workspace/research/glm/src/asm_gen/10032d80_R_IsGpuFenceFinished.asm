; R_IsGpuFenceFinished @ 0x10032d80 — auto-synthesized
    EXTRN g_101d4810:DWORD
    EXTRN g_101d494c:DWORD
    EXTRN g_101d4950:DWORD
    EXTRN g_101d4954:DWORD
    EXTRN g_101d4958:DWORD
    sub_10032ce5 PROTO C
.CODE
R_IsGpuFenceFinished PROC
    mov eax, dword ptr [g_101d4810]
    sub esp, 8
    cmp eax, 3
    je L0
    add esp, 8
    jmp sub_10032ce5
    push ebp
    push esi
    push edi
    xor edi, edi
    mov dword ptr [esp + 0x10], edi
    rdtsc
    mov ecx, eax
    mov eax, dword ptr [g_101d4954]
    mov esi, edx
    cdq
    sub ecx, eax
    sbb esi, edx
    mov ebp, ecx
    mov dword ptr [g_101d4954], edi
    mov al, byte ptr [g_101d4958]
    test al, al
    je L1
    mov eax, dword ptr [g_101d494c]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 0x88760868
    je L2
    cmp eax, 1
    setne al
    test al, al
    jne L2
    rdtsc
    sub eax, ebp
    sbb edx, esi
    test edx, edx
    mov edi, eax
    jg L3
    jl L4
    cmp edi, 0x7fffffff
    ja L3
    jmp L4
    mov byte ptr [g_101d4958], 0
    mov ecx, dword ptr [g_101d4950]
    mov eax, ecx
    sub eax, edi
    cdq
    sub eax, edx
    sar eax, 1
    neg eax
    add ecx, eax
    mov dword ptr [g_101d4950], ecx
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
R_IsGpuFenceFinished ENDP
END