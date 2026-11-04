; FUN_10028890 @ 0x10028890 — auto-synthesized
.CODE
FUN_10028890 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    lea eax, [edi - 1]
    cdq
    sub eax, edx
    mov esi, eax
    mov eax, dword ptr [esp + 0x14]
    sar esi, 1
    cmp eax, edi
    jge L0
    push ebx
    lea esp, [esp]
    lea eax, [esp + 0x1c]
    push eax
    lea ebx, [ebp + esi*8]
    push ebx
    call dword ptr [esp + 0x2c]
    add esp, 8
    test al, al
    je L1
    mov ecx, dword ptr [ebx]
    mov dword ptr [ebp + edi*8], ecx
    mov edx, dword ptr [ebx + 4]
    lea eax, [esi - 1]
    mov dword ptr [ebp + edi*8 + 4], edx
    cdq
    sub eax, edx
    sar eax, 1
    mov edi, esi
    mov esi, eax
    cmp dword ptr [esp + 0x18], edi
    jl L2
    pop ebx
    mov eax, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [ebp + edi*8], eax
    mov dword ptr [ebp + edi*8 + 4], ecx
    pop edi
    pop esi
    pop ebp
    ret
FUN_10028890 ENDP
END