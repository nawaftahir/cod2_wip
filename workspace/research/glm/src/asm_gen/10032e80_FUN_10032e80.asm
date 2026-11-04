; FUN_10032e80 @ 0x10032e80 — auto-synthesized
    EXTRN g_101d494c:DWORD
    EXTRN g_101d4950:DWORD
    EXTRN g_101d4958:DWORD
.CODE
FUN_10032e80 PROC
    mov al, byte ptr [g_101d4958]
    sub esp, 8
    test al, al
    je L0
    mov eax, dword ptr [g_101d494c]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 0x88760868
    je L1
    cmp eax, 1
    setne al
    test al, al
    je L2
    mov byte ptr [g_101d4958], 0
    add esp, 8
    ret
    push esi
    rdtsc
    mov dword ptr [esp + 8], edx
    mov esi, eax
    mov al, byte ptr [g_101d4958]
    test al, al
    je L3
    mov eax, dword ptr [g_101d494c]
    mov edx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [edx + 0x1c]
    cmp eax, 0x88760868
    je L4
    cmp eax, 1
    setne al
    test al, al
    jne L4
    rdtsc
    mov ecx, dword ptr [g_101d4950]
    sub eax, esi
    cmp eax, ecx
    mov dword ptr [esp + 8], edx
    jle L5
    mov byte ptr [g_101d4958], 0
    rdtsc
    mov ecx, dword ptr [g_101d4950]
    sub eax, esi
    lea eax, [eax + eax*2]
    mov dword ptr [esp + 8], edx
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    add ecx, eax
    mov dword ptr [g_101d4950], ecx
    pop esi
    add esp, 8
    ret
FUN_10032e80 ENDP
END