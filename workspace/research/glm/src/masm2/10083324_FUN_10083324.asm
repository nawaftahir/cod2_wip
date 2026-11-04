.686
.MODEL FLAT, C
EXTRN sub_100827C8:PROC
.CODE
FUN_10083324 PROC
    mov mov edi, edi
    push push esi
    push push edi
    push push 14
    mov mov edx, ecx
    call sub_100827C8
    lea lea esi, [edx + 16]
    xor xor eax, eax
    mov mov dword ptr [edx], 010110068h
    mov mov edi, esi
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push 8
    pop pop ecx
    xor xor eax, eax
    lea lea edi, [edx + 32]
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop edi
    mov mov dword ptr [esi], 3
    mov mov eax, edx
    pop pop esi
    ret ret
FUN_10083324 ENDP
END
