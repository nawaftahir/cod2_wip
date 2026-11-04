; FUN_1000d260 @ 0x1000d260 — auto-synthesized
    EXTRN g_101d0a74:DWORD
    EXTRN g_101d0a78:DWORD
.CODE
FUN_1000d260 PROC
    push esi
    push edi
    xor edi, edi
    mov esi, dword ptr [edi + 0x101cea68]
    test esi, esi
    je L0
    cmp byte ptr [esi + 0x1e], 5
    jb L0
    movzx eax, byte ptr [esi + 0xc]
    test eax, eax
    jl L1
    cmp eax, 1
    jle L2
    cmp eax, 4
    je L2
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
    je L3
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    lea ecx, [esi + 0x10]
    mov dword ptr [esi + 4], 0
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [esi], 0
    add edi, 4
    cmp edi, 0x2000
    jb L4
    pop edi
    pop esi
    ret
FUN_1000d260 ENDP
END