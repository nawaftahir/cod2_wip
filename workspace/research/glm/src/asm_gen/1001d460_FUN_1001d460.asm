; FUN_1001d460 @ 0x1001d460 — auto-synthesized
.CODE
FUN_1001d460 PROC
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
    lea eax, [esi + esi*2]
    lea ecx, [esp + 0x1c]
    lea ebx, [ebp + eax*4]
    push ecx
    push ebx
    call dword ptr [esp + 0x30]
    add esp, 8
    test al, al
    je L1
    mov ecx, dword ptr [ebx]
    lea edx, [edi + edi*2]
    lea eax, [ebp + edx*4]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ebx + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [eax + 8], ecx
    lea eax, [esi - 1]
    cdq
    sub eax, edx
    sar eax, 1
    mov edi, esi
    mov esi, eax
    cmp dword ptr [esp + 0x18], edi
    jl L2
    pop ebx
    mov ecx, dword ptr [esp + 0x18]
    lea edx, [edi + edi*2]
    lea eax, [ebp + edx*4]
    mov edx, dword ptr [esp + 0x1c]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 0x20]
    pop edi
    mov dword ptr [eax + 4], edx
    pop esi
    mov dword ptr [eax + 8], ecx
    pop ebp
    ret
FUN_1001d460 ENDP
END