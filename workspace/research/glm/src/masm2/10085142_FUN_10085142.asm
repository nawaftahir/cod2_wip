.686
.MODEL FLAT, C
EXTRN sub_100827C8:PROC
.CODE
FUN_10085142 PROC
    mov mov edi, edi
    push push esi
    push push edi
    push push 18
    mov mov esi, ecx
    call sub_100827C8
    xor xor eax, eax
    mov mov dword ptr [esi + 48], eax
    mov mov dword ptr [esi + 52], eax
    mov mov dword ptr [esi + 56], eax
    mov mov dword ptr [esi + 60], eax
    mov mov dword ptr [esi + 64], eax
    mov mov dword ptr [esi + 84], eax
    mov mov dword ptr [esi + 88], eax
    mov mov dword ptr [esi], 0101103E0h
    push push 8
    pop pop ecx
    lea lea edi, [esi + 16]
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea edi, [esi + 68]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    pop pop edi
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_10085142 ENDP
END
