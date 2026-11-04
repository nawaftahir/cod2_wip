; FUN_10012b00 @ 0x10012b00 — auto-synthesized
    EXTRN g_101d1c04:DWORD
.CODE
FUN_10012b00 PROC
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov esi, dword ptr [g_101d1c04]
    push edi
    xor edi, edi
    dec esi
    js L0
    lea eax, [esi + edi]
    cdq
    sub eax, edx
    sar eax, 1
    mov edx, eax
    shl edx, 4
    mov ecx, dword ptr [edx + 0x101d1c08]
    sub ecx, ebx
    jne L1
    mov ecx, dword ptr [edx + 0x101d1c0c]
    sub ecx, dword ptr [esp + 0x10]
    jne L1
    mov ecx, dword ptr [edx + 0x101d1c10]
    sub ecx, ebp
    je L2
    test ecx, ecx
    jge L3
    lea edi, [eax + 1]
    jmp L4
    lea esi, [eax - 1]
    cmp edi, esi
    jle L5
    shl esi, 4
    cmp dword ptr [esi + 0x101d1c08], ebx
    jne L6
    mov eax, dword ptr [esi + 0x101d1c0c]
    cmp eax, dword ptr [esp + 0x10]
    jne L6
    mov eax, dword ptr [esi + 0x101d1c10]
    pop edi
    pop esi
    pop ebp
    ret
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    ret
    shl edi, 4
    mov eax, dword ptr [edi + 0x101d1c10]
    pop edi
    pop esi
    pop ebp
    ret
FUN_10012b00 ENDP
END