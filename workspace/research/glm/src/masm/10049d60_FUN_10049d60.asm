.686
.MODEL FLAT, C
.CODE
FUN_10049d60 PROC
    push esi
    push edi
    push 68
    mov edi, eax
    mov eax, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [eax]
    mov ecx, dword ptr [esp + 24]
    mov esi, eax
    mov dword ptr [edi + 000000150h], esi
    push 000000500h
    mov dword ptr [esi], 010049A60h
    mov dword ptr [esi + 4], 010049AD0h
    mov dword ptr [esi + 24], ecx
    mov edx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [edx + 4]
    mov edx, eax
    xor eax, eax
    mov edi, edx
    mov ecx, 000000140h
    rep stosd dword ptr es:[edi], eax
    lea eax, [edx + 000000080h]
    lea ecx, [edx + 000000100h]
    mov dword ptr [esi + 32], eax
    mov dword ptr [esi + 36], ecx
    lea eax, [edx + 000000180h]
    lea ecx, [edx + 000000200h]
    mov dword ptr [esi + 40], eax
    mov dword ptr [esi + 44], ecx
    lea eax, [edx + 000000280h]
    lea ecx, [edx + 000000300h]
    mov dword ptr [esi + 48], eax
    mov dword ptr [esi + 52], ecx
    add esp, 24
    mov dword ptr [esi + 28], edx
    lea eax, [edx + 000000380h]
    lea ecx, [edx + 000000400h]
    add edx, 000000480h
    pop edi
    mov dword ptr [esi + 56], eax
    mov dword ptr [esi + 60], ecx
    mov dword ptr [esi + 64], edx
    pop esi
    ret
FUN_10049d60 ENDP
END
