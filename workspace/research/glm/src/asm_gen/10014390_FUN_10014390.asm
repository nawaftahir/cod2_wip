; FUN_10014390 @ 0x10014390 — auto-synthesized
.CODE
FUN_10014390 PROC
    push ebx
    mov ebx, eax
    lea eax, [ebx - 1]
    cdq
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    sub eax, edx
    push edi
    mov edi, eax
    mov eax, dword ptr [esp + 0x14]
    sar edi, 1
    cmp eax, ebx
    jge L0
    push esi
    lea esp, [esp]
    mov eax, edi
    shl eax, 4
    lea ecx, [esp + 0x1c]
    lea esi, [eax + ebp]
    push ecx
    push esi
    call dword ptr [esp + 0x34]
    add esp, 8
    test al, al
    je L1
    mov edx, dword ptr [esi]
    shl ebx, 4
    add ebx, ebp
    mov dword ptr [ebx], edx
    mov eax, dword ptr [esi + 4]
    mov dword ptr [ebx + 4], eax
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ebx + 8], ecx
    mov edx, dword ptr [esi + 0xc]
    lea eax, [edi - 1]
    mov dword ptr [ebx + 0xc], edx
    cdq
    sub eax, edx
    sar eax, 1
    mov ebx, edi
    mov edi, eax
    cmp dword ptr [esp + 0x18], ebx
    jl L2
    pop esi
    mov eax, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 0x20]
    shl ebx, 4
    add ebx, ebp
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esp + 0x24]
    mov dword ptr [ebx + 4], ecx
    pop edi
    mov dword ptr [ebx + 8], edx
    pop ebp
    mov dword ptr [ebx + 0xc], eax
    pop ebx
    ret
FUN_10014390 ENDP
END