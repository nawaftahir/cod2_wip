.686
.MODEL FLAT, C
EXTRN sub_100479C5:PROC
EXTRN sub_10047B7E:PROC
.CODE
FUN_10047c30 PROC
    push ebx
    mov bl, byte ptr [esp + 8]
    push esi
    push edi
    mov esi, eax
    call sub_10047B7E
    mov al, byte ptr [esi + 12]
    test al, al
    jne L3
    push 127
    mov eax, 7
    call sub_100479C5
    xor eax, eax
    mov dword ptr [esi + 24], eax
    mov dword ptr [esi + 28], eax
    mov eax, dword ptr [esi + 16]
    mov byte ptr [eax], 0000000FFh
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [esi + 20]
    add esp, 4
    inc ecx
    dec eax
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], eax
    jne L1
    mov eax, dword ptr [esi + 32]
    mov edi, dword ptr [eax + 32]
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L0
    mov ecx, dword ptr [esi + 32]
    mov edx, dword ptr [ecx]
    mov dword ptr [edx + 20], 24
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L0:
    mov edx, dword ptr [edi]
    mov dword ptr [esi + 16], edx
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esi + 20], eax
L1:
    mov ecx, dword ptr [esi + 16]
    sub bl, 48
    mov byte ptr [ecx], bl
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [esi + 20]
    inc ecx
    dec eax
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], eax
    jne L3
    mov eax, dword ptr [esi + 32]
    mov edi, dword ptr [eax + 32]
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L2
    mov edx, dword ptr [esi + 32]
    mov eax, dword ptr [edx]
    mov dword ptr [eax + 20], 24
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L2:
    mov edx, dword ptr [edi]
    mov dword ptr [esi + 16], edx
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esi + 20], eax
L3:
    mov ecx, dword ptr [esi + 32]
    mov eax, dword ptr [ecx + 000000134h]
    xor edx, edx
    cmp eax, edx
    jne L5
    mov edi, dword ptr [ecx + 0000000ECh]
    xor eax, eax
    cmp edi, edx
    jle L6
    lea ecx, [esi + 36]
L4:
    mov dword ptr [ecx], edx
    mov edi, dword ptr [esi + 32]
    mov ebx, dword ptr [edi + 0000000ECh]
    inc eax
    add ecx, 4
    cmp eax, ebx
    jl L4
    pop edi
    pop esi
    pop ebx
    ret
L5:
    mov dword ptr [esi + 56], edx
    mov dword ptr [esi + 60], edx
L6:
    pop edi
    pop esi
    pop ebx
    ret
FUN_10047c30 ENDP
END
