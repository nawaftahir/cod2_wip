; FUN_1000a780 @ 0x1000a780 — auto-synthesized
    EXTRN g_101ce5b4:DWORD
    EXTRN g_101d1b9c:DWORD
    sub_10008103 PROTO C
.CODE
FUN_1000a780 PROC
    mov eax, dword ptr [g_101ce5b4]
    test eax, eax
    je L0
    mov eax, dword ptr [g_101d1b9c]
    mov ecx, dword ptr [eax + 0x18]
    push esi
    xor esi, esi
    test ecx, ecx
    jle L1
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    push edi
    dec ebp
    mov ecx, dword ptr [esp + 0x14]
    mov edx, dword ptr [eax + 0x1c]
    mov edi, dword ptr [edx + esi*4]
    push ebp
    push ecx
    xor ebx, ebx
    call sub_10008103
    mov eax, dword ptr [g_101d1b9c]
    mov ecx, dword ptr [eax + 0x18]
    add esp, 8
    inc esi
    cmp esi, ecx
    jl L2
    pop edi
    pop ebp
    pop ebx
    pop esi
    ret
FUN_1000a780 ENDP
END