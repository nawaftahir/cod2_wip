.686
.MODEL FLAT, C
EXTRN sub_10043C54:PROC
EXTRN sub_10043C7B:PROC
EXTRN sub_10043C8B:PROC
EXTRN sub_10043C8D:PROC
.CODE
FUN_10043bd0 PROC
    mov mov eax, dword ptr [edi + 4]
    push push ebx
    push push esi
    push push 48
    push push 1
    push push edi
    call call dword ptr [eax]
    mov mov esi, eax
    mov mov dword ptr [edi + 0160h], esi
    mov mov dword ptr [esi], 010042E10h
    mov mov eax, dword ptr [edi + 0C0h]
    xor xor ebx, ebx
    add add esp, 12
    sub sub eax, ebx
    je sub_10043C54
    dec dec eax
    je L1
    dec dec eax
    je L0
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 20], 48
    mov mov edx, dword ptr [edi]
    push push edi
    call call dword ptr [edx]
    add add esp, 4
    jmp sub_10043C7B
    mov mov dword ptr [esi + 4], 0100434E0h
    mov mov dword ptr [esi + 28], 010052180h
    jmp sub_10043C8B
    mov mov dword ptr [esi + 8], 0100532C0h
    jmp sub_10043C8D
    mov mov dword ptr [esi + 8], 0100534D0h
    mov mov dword ptr [esi + 4], 010043110h
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [esi + 32], ebx
    mov mov dword ptr [esi + 16], ebx
    mov mov dword ptr [esi + 36], ebx
    mov mov dword ptr [esi + 20], ebx
    mov mov dword ptr [esi + 40], ebx
    mov mov dword ptr [esi + 24], ebx
L1:
    mov mov dword ptr [esi + 44], ebx
    pop pop esi
    pop pop ebx
    ret ret
FUN_10043bd0 ENDP
END
