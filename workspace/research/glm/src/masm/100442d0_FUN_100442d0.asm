.686
.MODEL FLAT, C
EXTRN sub_10044034:PROC
.CODE
FUN_100442d0 PROC
    push ebx
    mov bl, byte ptr [esp + 8]
    push esi
    mov esi, eax
    push 127
    mov eax, 7
    call sub_10044034
    add esp, 4
    test al, al
    je L4
    mov eax, dword ptr [esi]
    mov dword ptr [esi + 8], 0
    mov dword ptr [esi + 12], 0
    mov byte ptr [eax], 0000000FFh
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    inc ecx
    dec eax
    push edi
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 4], eax
    jne L0
    mov eax, dword ptr [esi + 32]
    mov edi, dword ptr [eax + 32]
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L5
    mov ecx, dword ptr [edi]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [esi + 4], edx
L0:
    mov eax, dword ptr [esi]
    sub bl, 48
    mov byte ptr [eax], bl
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    inc ecx
    dec eax
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 4], eax
    jne L1
    mov eax, dword ptr [esi + 32]
    mov edi, dword ptr [eax + 32]
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L5
    mov ecx, dword ptr [edi]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [esi + 4], edx
L1:
    mov ecx, dword ptr [esi + 32]
    mov edx, dword ptr [ecx + 0000000ECh]
    xor eax, eax
    test edx, edx
    jle L3
    lea ecx, [esi + 16]
    mov edi, edi
L2:
    mov dword ptr [ecx], 0
    mov edx, dword ptr [esi + 32]
    mov edi, dword ptr [edx + 0000000ECh]
    inc eax
    add ecx, 4
    cmp eax, edi
    jl L2
L3:
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
L4:
    pop esi
    xor al, al
    pop ebx
    ret
L5:
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
FUN_100442d0 ENDP
END
