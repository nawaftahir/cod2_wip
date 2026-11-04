.686
.MODEL FLAT, C
.CODE
FUN_10049d60 PROC
    push push esi
    push push edi
    push push 68
    mov mov edi, eax
    mov mov eax, dword ptr [edi + 4]
    push push 1
    push push edi
    call call dword ptr [eax]
    mov mov ecx, dword ptr [esp + 24]
    mov mov esi, eax
    mov mov dword ptr [edi + 0150h], esi
    push push 0500h
    mov mov dword ptr [esi], 010049A60h
    mov mov dword ptr [esi + 4], 010049AD0h
    mov mov dword ptr [esi + 24], ecx
    mov mov edx, dword ptr [edi + 4]
    push push 1
    push push edi
    call call dword ptr [edx + 4]
    mov mov edx, eax
    xor xor eax, eax
    mov mov edi, edx
    mov mov ecx, 0140h
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea eax, [edx + 080h]
    lea lea ecx, [edx + 0100h]
    mov mov dword ptr [esi + 32], eax
    mov mov dword ptr [esi + 36], ecx
    lea lea eax, [edx + 0180h]
    lea lea ecx, [edx + 0200h]
    mov mov dword ptr [esi + 40], eax
    mov mov dword ptr [esi + 44], ecx
    lea lea eax, [edx + 0280h]
    lea lea ecx, [edx + 0300h]
    mov mov dword ptr [esi + 48], eax
    mov mov dword ptr [esi + 52], ecx
    add add esp, 24
    mov mov dword ptr [esi + 28], edx
    lea lea eax, [edx + 0380h]
    lea lea ecx, [edx + 0400h]
    add add edx, 0480h
    pop pop edi
    mov mov dword ptr [esi + 56], eax
    mov mov dword ptr [esi + 60], ecx
    mov mov dword ptr [esi + 64], edx
    pop pop esi
    ret ret
FUN_10049d60 ENDP
END
