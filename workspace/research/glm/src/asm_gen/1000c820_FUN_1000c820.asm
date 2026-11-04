; FUN_1000c820 @ 0x1000c820 — auto-synthesized
    EXTRN g_101d0a78:DWORD
    sub_1000d4a9 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_1000c820 PROC
    mov eax, 0x202c
    call sub_100f883a
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x2038]
    push esi
    push edi
    xor esi, esi
    lea edi, [esp + 0x38]
    mov ebx, 0x1000c7e0
    mov dword ptr [esp + 0x38], esi
    call sub_1000d4a9
    mov edi, dword ptr [esp + 0x38]
    xor eax, eax
    mov dword ptr [esp + 0x10], eax
    mov dword ptr [esp + 0x14], eax
    mov dword ptr [esp + 0x18], eax
    mov dword ptr [esp + 0x1c], eax
    mov dword ptr [esp + 0x20], eax
    mov dword ptr [esp + 0x24], eax
    mov dword ptr [esp + 0x28], eax
    mov dword ptr [esp + 0x2c], eax
    mov dword ptr [esp + 0x30], eax
    xor edx, edx
    test edi, edi
    mov dword ptr [esp + 0x34], eax
    jle L0
    lea ecx, [ecx]
    mov eax, dword ptr [esp + edx*4 + 0x3c]
    mov ecx, dword ptr [eax + 0x10]
    movzx eax, byte ptr [eax + 0xc]
    mov ebx, dword ptr [esp + eax*4 + 0x10]
    add ebx, ecx
    test eax, eax
    mov dword ptr [esp + eax*4 + 0x10], ebx
    jl L1
    cmp eax, 1
    jle L2
    cmp eax, 4
    je L2
    add esi, ecx
    inc edx
    cmp edx, edi
    jl L3
    mov ecx, dword ptr [esp + 0x20]
    mov dword ptr [ebp], esi
    pop edi
    mov dword ptr [ebp + 4], ecx
    mov edx, dword ptr [g_101d0a78]
    pop esi
    mov dword ptr [ebp + 8], edx
    pop ebp
    pop ebx
    add esp, 0x202c
    ret
FUN_1000c820 ENDP
END