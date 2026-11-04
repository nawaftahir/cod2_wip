; FUN_10018140 @ 0x10018140 — auto-synthesized
.CODE
FUN_10018140 PROC
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, eax
    lea eax, [edi - 1]
    cdq
    sub eax, edx
    mov esi, eax
    mov eax, dword ptr [esp + 0x10]
    sar esi, 1
    cmp eax, edi
    jge L0
    jmp L1
    lea ecx, [ecx]
    mov eax, dword ptr [ebx + esi*4]
    push ebp
    push eax
    call dword ptr [esp + 0x20]
    add esp, 8
    test al, al
    je L0
    mov ecx, dword ptr [ebx + esi*4]
    lea eax, [esi - 1]
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ebx + edi*4], ecx
    mov edi, esi
    mov esi, eax
    cmp dword ptr [esp + 0x10], edi
    jl L1
    mov dword ptr [ebx + edi*4], ebp
    pop edi
FUN_10018140 ENDP
END