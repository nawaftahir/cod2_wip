.686
.MODEL FLAT, C
.CODE
FUN_10043bd0 PROC
    mov eax, dword ptr [edi + 4]
    push ebx
    push esi
    push 48
    push 1
    push edi
    call dword ptr [eax]
    mov esi, eax
    mov dword ptr [edi + 000000160h], esi
    mov dword ptr [esi], 010042E10h
    mov eax, dword ptr [edi + 0000000C0h]
    xor ebx, ebx
    add esp, 12
    sub eax, ebx
    je L2
    dec eax
    je L1
    dec eax
    je L0
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 48
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    jmp L4
L0:
    mov dword ptr [esi + 4], 0100434E0h
    mov dword ptr [esi + 28], 010052180h
    jmp L4
L1:
    mov dword ptr [esi + 8], 0100532C0h
    jmp L3
L2:
    mov dword ptr [esi + 8], 0100534D0h
L3:
    mov dword ptr [esi + 4], 010043110h
L4:
    mov dword ptr [esi + 12], ebx
    mov dword ptr [esi + 32], ebx
    mov dword ptr [esi + 16], ebx
    mov dword ptr [esi + 36], ebx
    mov dword ptr [esi + 20], ebx
    mov dword ptr [esi + 40], ebx
    mov dword ptr [esi + 24], ebx
    mov dword ptr [esi + 44], ebx
    pop esi
    pop ebx
    ret
FUN_10043bd0 ENDP
END
