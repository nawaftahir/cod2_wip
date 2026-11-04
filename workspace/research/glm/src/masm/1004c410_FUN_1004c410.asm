.686
.MODEL FLAT, C
.CODE
FUN_1004c410 PROC
    push ecx
    mov eax, dword ptr [esi + 4]
    push ebx
    push 84
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0000001A4h], eax
    mov dword ptr [eax], 01004C0E0h
    mov edx, dword ptr [esi + 44]
    mov ecx, dword ptr [esi + 0000000CCh]
    add esp, 12
    xor ebx, ebx
    test edx, edx
    jle L1
    push ebp
    add ecx, 80
    push edi
    mov dword ptr [esp + 12], ecx
    lea ebp, [eax + 44]
L0:
    mov ecx, dword ptr [esi + 4]
    push 000000100h
    push 1
    push esi
    call dword ptr [ecx]
    mov edx, dword ptr [esp + 24]
    mov edi, eax
    xor eax, eax
    mov dword ptr [edx], edi
    mov ecx, 64
    rep stosd dword ptr es:[edi], eax
    add esp, 12
    mov dword ptr [ebp], 0FFFFFFFFh
    mov eax, dword ptr [esi + 44]
    inc ebx
    add edx, 84
    add ebp, 4
    cmp ebx, eax
    mov dword ptr [esp + 12], edx
    jl L0
    pop edi
    pop ebp
L1:
    pop ebx
    pop ecx
    ret
FUN_1004c410 ENDP
END
